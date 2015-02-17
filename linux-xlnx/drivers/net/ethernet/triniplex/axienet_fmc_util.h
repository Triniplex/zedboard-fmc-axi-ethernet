#ifndef AXIENET_FMC_UTIL_H
#define AXIENET_FMC_UTIL_H

#include "axienet_fmc.h"
#define MAX_MDIO_FREQ		2500000 /* 2.5 MHz */
#define DEFAULT_CLOCK_DIVISOR	XAE_MDIO_DIV_DFT

void axienet_fmc_mdio_stop(struct axienet_fmc_local *lp);
int axienet_mdio_setup(struct axienet_fmc_local *lp, struct device_node *np);
int axienet_fmc_get_IEEE_phy_speed(struct axienet_fmc_local *lp);
int axienet_fmc_phy_setup(struct axienet_fmc_local *lp);
int axienet_fmc_mdio_wait_until_ready(struct axienet_fmc_local *lp);
int axienet_mdio_read(struct mii_bus *bus, int phy_id, int reg);
int axienet_mdio_write(struct mii_bus *bus, int phy_id, int reg, u16 val);

#endif //AXIENET_FMC_UTIL_H
