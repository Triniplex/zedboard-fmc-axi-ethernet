#include <linux/delay.h>
#include <linux/etherdevice.h>
#include <linux/module.h>
#include <linux/netdevice.h>
#include <linux/of_mdio.h>
#include <linux/of_platform.h>
#include <linux/of_irq.h>
#include <linux/of_address.h>
#include <linux/skbuff.h>
#include <linux/spinlock.h>
#include <linux/phy.h>
#include <linux/mii.h>
#include <linux/jiffies.h>


#include "axienet_fmc_util.h"
#include "axienet_fmc.h"
#include "axienet_fmc_marvell.h"

#define MAX_MDIO_FREQ		2500000 /* 2.5 MHz */
#define DEFAULT_CLOCK_DIVISOR	XAE_MDIO_DIV_DFT

unsigned int axienet_fmc_axienet_in32(unsigned int addr) {
	return *(volatile unsigned int *) addr;
}

void axienet_fmc_axienet_out32(unsigned int addr, unsigned int value) {
	*(volatile unsigned int *) addr = value;
}

/**
 * axienet_fmc_mdio_setup - MDIO setup function
 * @lp:		Pointer to axienet local data structure.
 * @np:		Pointer to device node
 *
 * Return:	0 on success, -ETIMEDOUT on a timeout, -ENOMEM when
 *		mdiobus_alloc (to allocate memory for mii bus structure) fails.
 *
 * Sets up the MDIO interface by initializing the MDIO clock and enabling the
 * MDIO interface in hardware. Register the MDIO interface.
 **/

int axienet_fmc_mdio_clock_init(struct device_node *np, struct mii_bus *bus) {
	int ret;
    u32 clk_div, *property_p;

	property_p = (uint32_t *)of_get_property(np,
		"clock-frequency", NULL);
	if (!property_p) {
		printk(KERN_INFO "Could not find clock mdio controller property.");
		printk(KERN_INFO "Setting MDIO clock divisor to default %d\n",
			DEFAULT_CLOCK_DIVISOR);
		clk_div = DEFAULT_CLOCK_DIVISOR;
	} else {
		u32 host_clock = be32_to_cpup(property_p);

		clk_div = (host_clock / (MAX_MDIO_FREQ * 2)) - 1;

		if (host_clock % (MAX_MDIO_FREQ * 2))
			clk_div++;
		printk(KERN_INFO "Setting MDIO clock divisor to %u "
			"based on %u Hz host clock.\n", clk_div, host_clock);
	}

	ret = axienet_mdio_write(bus, 0, XAE_MDIO_MC_OFFSET, (((u32)clk_div) | XAE_MDIO_MC_MDIOEN_MASK));

	if (ret < 0)
		return ret;

	return 0;
}

int axienet_mdio_setup(struct axienet_local *lp, struct device_node *np)
{
	int ret;
	u32 clk_div;
	struct mii_bus *bus;
	struct resource res;
	struct device_node *np1;
	/* the ethernet controller device node */
	struct device_node *npp = NULL;

	/* clk_div can be calculated by deriving it from the equation:
	 * fMDIO = fHOST / ((1 + clk_div) * 2)
	 *
	 * Where fMDIO <= 2500000, so we get:
	 * fHOST / ((1 + clk_div) * 2) <= 2500000
	 *
	 * Then we get:
	 * 1 / ((1 + clk_div) * 2) <= (2500000 / fHOST)
	 *
	 * Then we get:
	 * 1 / (1 + clk_div) <= ((2500000 * 2) / fHOST)
	 *
	 * Then we get:
	 * 1 / (1 + clk_div) <= (5000000 / fHOST)
	 *
	 * So:
	 * (1 + clk_div) >= (fHOST / 5000000)
	 *
	 * And finally:
	 * clk_div >= (fHOST / 5000000) - 1
	 *
	 * fHOST can be read from the flattened device tree as property
	 * "clock-frequency" from the CPU
	 */
	np1 = of_get_parent(lp->phy_node);
	if (np1) {
		npp = of_get_parent(np1);
		of_node_put(np1);
	}
	if (!npp) {
		dev_warn(lp->dev,
			"Could not find ethernet controller device node.");
		dev_warn(lp->dev, "Setting MDIO clock divisor to default %d\n",
		       DEFAULT_CLOCK_DIVISOR);
		clk_div = DEFAULT_CLOCK_DIVISOR;
	} else {
		u32 *property_p;

		property_p = (uint32_t *)of_get_property(npp,
						"clock-frequency", NULL);
		if (!property_p) {
			dev_warn(lp->dev,
				"Could not find clock ethernet "
				"controller property.");
			dev_warn(lp->dev,
				 "Setting MDIO clock divisor to default %d\n",
							DEFAULT_CLOCK_DIVISOR);
			clk_div = DEFAULT_CLOCK_DIVISOR;
		} else {
			u32 host_clock = be32_to_cpup(property_p);

			clk_div = (host_clock / (MAX_MDIO_FREQ * 2)) - 1;

			/* If there is any remainder from the division of
			 * fHOST / (MAX_MDIO_FREQ * 2), then we need to add 1
			 * to the clock divisor or we will surely be
			 * above 2.5 MHz
			 */
			if (host_clock % (MAX_MDIO_FREQ * 2))
				clk_div++;
			dev_dbg(lp->dev,
				"Setting MDIO clock divisor to %u "
				"based on %u Hz host clock.\n",
				clk_div, host_clock);
		}
		of_node_put(npp);
	}

	axienet_iow(lp, XAE_MDIO_MC_OFFSET, (((u32)clk_div) |
						XAE_MDIO_MC_MDIOEN_MASK));

	ret = axienet_mdio_wait_until_ready(lp);
	if (ret < 0)
		return ret;

	bus = mdiobus_alloc();
	if (!bus)
		return -ENOMEM;

	of_address_to_resource(npp, 0, &res);
	snprintf(bus->id, MII_BUS_ID_SIZE, "%.8llx",
		 (unsigned long long) res.start);

	bus->priv = lp;
	bus->name = "Xilinx Axi Ethernet MDIO";
	bus->read = axienet_mdio_read;
	bus->write = axienet_mdio_write;
	bus->parent = lp->dev;
	bus->irq = lp->mdio_irqs; /* preallocated IRQ table */
	lp->mii_bus = bus;

	ret = of_mdiobus_register(bus, np1);
	if (ret) {
		mdiobus_free(bus);
		return ret;
	}
	return 0;
}


static struct of_device_id axienet_fmc_mdio_match[] = {
	{
		.compatible = "fmc,axienet-mdio",
	},
	{},
};

static int axienet_fmc_mdio_reset(struct mii_bus *bus) {
	return 0;
}

static int axienet_fmc_mdio_probe(struct platform_device *pdev) {
	const struct of_device_id *id =
	                of_match_device(axienet_fmc_mdio_match, &pdev->dev);
	struct device_node *np = pdev->dev.of_node;
    struct resource res;
	struct axienet_fmc_mdio_local *priv;
	int err;
	struct mii_bus *bus;

    printk(KERN_INFO "found %s compatible node\n", id->compatible);

    bus = mdiobus_alloc_size(sizeof(*priv));
	if (!bus)
		return -ENOMEM;

	priv = bus->priv;
	bus->name = "Triniplex AXI Ethernet FMC MDIO Driver";
	bus->read = axienet_mdio_read;
	bus->write = axienet_mdio_write;
	bus->reset = axienet_fmc_mdio_reset;
	bus->irq = priv->mdio_irqs;
	priv->mii_bus = bus;

    err = of_address_to_resource(np, 0, &res);
    if (err < 0) {
        printk(KERN_INFO "could not obtain address information\n");
        return err;
    }

    snprintf(bus->id, MII_BUS_ID_SIZE, "%s@%llx", np->name,
            (unsigned long long)res.start);

    bus->parent = &pdev->dev;
    platform_set_drvdata(pdev, bus);

    err = of_mdiobus_register(bus, np);
    if (err) {
            printk(KERN_INFO "cannot register %s as MDIO bus\n",
                    bus->name);
            return err;
    }

    axienet_fmc_mdio_clock_init(np, priv->mii_bus);
    return 0;
}

static int axienet_fmc_mdio_remove(struct platform_device *pdev)
{
	struct mii_bus *bus = platform_get_drvdata(pdev);

	mdiobus_unregister(bus);
	iounmap(bus->priv);
	mdiobus_free(bus);

	return 0;
}

MODULE_DEVICE_TABLE(of, axienet_fmc_mdio_match);

static struct platform_driver axienet_fmc_mdio_driver = {
	.driver = {
		.name = "fmc-axienet_mdio",
		.of_match_table = axienet_fmc_mdio_match,
	},
	.probe = axienet_fmc_mdio_probe,
	.remove = axienet_fmc_mdio_remove,
};

module_platform_driver(axienet_fmc_mdio_driver);

MODULE_DESCRIPTION("Triniplex AXI Ethernet FMC MDIO Controller");
MODULE_LICENSE("GPL v2");
