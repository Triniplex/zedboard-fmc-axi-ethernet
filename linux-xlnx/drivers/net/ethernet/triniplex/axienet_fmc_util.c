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

static inline u32 axienet_ior(struct axienet_fmc_local *lp, off_t offset)
{
	return in_be32(lp->regs + offset);
}

/**
 * axienet_iow - Memory mapped Axi Ethernet register write
 * @lp:         Pointer to axienet local structure
 * @offset:     Address offset from the base address of Axi Ethernet core
 * @value:      Value to be written into the Axi Ethernet register
 *
 * This function writes the desired value into the corresponding Axi Ethernet
 * register.
 */
static inline void axienet_iow(struct axienet_fmc_local *lp, off_t offset,
			       u32 value)
{
	out_be32((lp->regs + offset), value);
}

int axienet_fmc_mdio_wait_until_ready(struct axienet_fmc_local *lp)
{
        unsigned long end = jiffies + 2;
        while (!(fmc_axienet_ior(lp, XAE_MDIO_MCR_OFFSET) &
                 XAE_MDIO_MCR_READY_MASK)) {
                if (time_before_eq(end, jiffies)) {
                        WARN_ON(1);
                        return -ETIMEDOUT;
                }
                udelay(1);
        }
        return 0;
}

int axienet_mdio_read(struct mii_bus *bus, int phy_id, int reg)
{
        u32 rc;
        int ret;
        struct axienet_fmc_local *lp = bus->priv;

        ret = axienet_fmc_mdio_wait_until_ready(lp);
        if (ret < 0)
                return ret;

        fmc_axienet_iow(lp, XAE_MDIO_MCR_OFFSET,
                    (((phy_id << XAE_MDIO_MCR_PHYAD_SHIFT) &
                      XAE_MDIO_MCR_PHYAD_MASK) |
                     ((reg << XAE_MDIO_MCR_REGAD_SHIFT) &
                      XAE_MDIO_MCR_REGAD_MASK) |
                     XAE_MDIO_MCR_INITIATE_MASK |
                     XAE_MDIO_MCR_OP_READ_MASK));

        ret = axienet_fmc_mdio_wait_until_ready(lp);
        if (ret < 0)
                return ret;

        rc = fmc_axienet_ior(lp, XAE_MDIO_MRD_OFFSET) & 0x0000FFFF;


        dev_dbg(lp->dev, "axienet_mdio_read(phy_id=%i, reg=%x) == %x\n",
                phy_id, reg, rc);

        return rc;
}

int axienet_mdio_write(struct mii_bus *bus, int phy_id, int reg, u16 val)
{
        int ret;
        struct axienet_fmc_local *lp = bus->priv;

        dev_dbg(lp->dev, "axienet_mdio_write(phy_id=%i, reg=%x, val=%x)\n",
                phy_id, reg, val);
        ret = axienet_fmc_mdio_wait_until_ready(lp);
        if (ret < 0)
                return ret;

        fmc_axienet_iow(lp, XAE_MDIO_MWD_OFFSET, (u32) val);
        fmc_axienet_iow(lp, XAE_MDIO_MCR_OFFSET,
                    (((phy_id << XAE_MDIO_MCR_PHYAD_SHIFT) &
                      XAE_MDIO_MCR_PHYAD_MASK) |
                     ((reg << XAE_MDIO_MCR_REGAD_SHIFT) &
                      XAE_MDIO_MCR_REGAD_MASK) |
                     XAE_MDIO_MCR_INITIATE_MASK |
                     XAE_MDIO_MCR_OP_WRITE_MASK));

        ret = axienet_fmc_mdio_wait_until_ready(lp);
        if (ret < 0)
                return ret;
        return 0;
}
int axienet_fmc_get_IEEE_phy_speed(struct axienet_fmc_local *lp) {
    int temp, phy_addr, phy_identifier, phy_model, control, status, partner_capabilities;
    phy_addr = 0;

    /* Get the PHY Identifier and Model number */
    phy_identifier = axienet_mdio_read(lp->mii_bus, phy_addr, 2);
    phy_model = axienet_mdio_read(lp->mii_bus, phy_addr, 3);
    phy_model = phy_model & PHY_MODEL_NUM_MASK;

    /* The PHY ID for Marvel is 0x0141 */
    printk(KERN_INFO "PHY ID is: 0x%04X\n",phy_identifier);
    /* The PHY model for 88E1510 is 0x01D0 */
    printk(KERN_INFO "PHY model is : 0x%04X\n",phy_model);
    printk(KERN_INFO "Start PHY autonegotiation \n");

    axienet_mdio_write(lp->mii_bus,phy_addr, IEEE_PAGE_ADDRESS_REGISTER, 2);
    control = axienet_mdio_read(lp->mii_bus, phy_addr, IEEE_CONTROL_REG_MAC);
    //control |= IEEE_RGMII_TXRX_CLOCK_DELAYED_MASK;
    control &= ~(0x10);
    axienet_mdio_write(lp->mii_bus, phy_addr, IEEE_CONTROL_REG_MAC, control);

    axienet_mdio_write(lp->mii_bus, phy_addr, IEEE_PAGE_ADDRESS_REGISTER, 0);

    control = axienet_mdio_read(lp->mii_bus, phy_addr, IEEE_AUTONEGO_ADVERTISE_REG);
    control |= IEEE_ASYMMETRIC_PAUSE_MASK;
    control |= IEEE_PAUSE_MASK;
    control |= ADVERTISE_100;
    control |= ADVERTISE_10;
    axienet_mdio_write(lp->mii_bus, phy_addr, IEEE_AUTONEGO_ADVERTISE_REG, control);

    control = axienet_mdio_read(lp->mii_bus, phy_addr, IEEE_1000_ADVERTISE_REG_OFFSET);
    control |= ADVERTISE_1000;
    axienet_mdio_write(lp->mii_bus, phy_addr, IEEE_1000_ADVERTISE_REG_OFFSET, control);

    axienet_mdio_write(lp->mii_bus, phy_addr, IEEE_PAGE_ADDRESS_REGISTER, 0);
    control = axienet_mdio_read(lp->mii_bus, phy_addr, IEEE_COPPER_SPECIFIC_CONTROL_REG);
    control |= (7 << 12);    /* max number of gigabit attempts */
    control |= (1 << 11);    /* enable downshift */
    axienet_mdio_write(lp->mii_bus, phy_addr, IEEE_COPPER_SPECIFIC_CONTROL_REG, control);
    control = axienet_mdio_read(lp->mii_bus, phy_addr, IEEE_CONTROL_REG_OFFSET);
    control |= IEEE_CTRL_AUTONEGOTIATE_ENABLE;
    control |= IEEE_STAT_AUTONEGOTIATE_RESTART;

    axienet_mdio_write(lp->mii_bus, phy_addr, IEEE_CONTROL_REG_OFFSET, control);
    control = axienet_mdio_read(lp->mii_bus, phy_addr, IEEE_CONTROL_REG_OFFSET);
    control |= IEEE_CTRL_RESET_MASK;
    axienet_mdio_write(lp->mii_bus, phy_addr, IEEE_CONTROL_REG_OFFSET, control);

    while (1) {
        control = axienet_mdio_read(lp->mii_bus, phy_addr, IEEE_CONTROL_REG_OFFSET);
        if (control & IEEE_CTRL_RESET_MASK)
            continue;
        else
            break;
    }
    printk(KERN_INFO "Waiting for PHY to complete autonegotiation.\n");

    status = axienet_mdio_read(lp->mii_bus, phy_addr, IEEE_STATUS_REG_OFFSET);
    while ( !(status & IEEE_STAT_AUTONEGOTIATE_COMPLETE) ) {
        msleep(1000);
        temp = axienet_mdio_read(lp->mii_bus, phy_addr, IEEE_COPPER_SPECIFIC_STATUS_REG_2);
        if (temp & IEEE_AUTONEG_ERROR_MASK) {
            printk(KERN_INFO "Auto negotiation error.\n");
        }
        status = axienet_mdio_read(lp->mii_bus, phy_addr, IEEE_STATUS_REG_OFFSET);
        }

    printk(KERN_INFO "autonegotiation complete \n");

    partner_capabilities = axienet_mdio_read(lp->mii_bus, phy_addr, IEEE_SPECIFIC_STATUS_REG);

    if ( ((partner_capabilities >> 14) & 3) == 2)/* 1000Mbps */
        return 1000;
    else if ( ((partner_capabilities >> 14) & 3) == 1)/* 100Mbps */
        return 100;
    else                    /* 10Mbps */
        return 10;
}

void axienet_fmc_mdio_stop(struct axienet_fmc_local *lp)
{
	mdiobus_unregister(lp->mii_bus);
	mdiobus_free(lp->mii_bus);
	lp->mii_bus = NULL;
}
int axienet_fmc_mdio_setup(struct axienet_fmc_local *lp, struct device_node *np)
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

	ret = axienet_fmc_mdio_wait_until_ready(lp);
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
int axienet_fmc_phy_setup(struct axienet_fmc_local *lp) {
    int link_speed, phy_wr_data;
    struct mii_bus *bus;

    link_speed = 1000;
    bus = lp->mii_bus;

    phy_wr_data = IEEE_CTRL_AUTONEGOTIATE_ENABLE |
                      IEEE_CTRL_LINKSPEED_1000M;
    phy_wr_data &= (~PHY_R0_ISOLATE);
    phy_wr_data = IEEE_CTRL_AUTONEGOTIATE_ENABLE |
                  IEEE_CTRL_LINKSPEED_1000M;
    phy_wr_data &= (~PHY_R0_ISOLATE);

    axienet_mdio_write(bus, 0, IEEE_CONTROL_REG_OFFSET, phy_wr_data);

    /* set PHY <--> MAC data clock */
    link_speed = axienet_fmc_get_IEEE_phy_speed(lp);
    printk(KERN_INFO "auto-negotiated link speed: %d\n", link_speed);
    return link_speed;
}
