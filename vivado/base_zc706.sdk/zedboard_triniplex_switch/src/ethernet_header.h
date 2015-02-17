#ifndef ETHERNET_HEADER_H
#define ETHERNET_HEADER_H

#include "xaxiethernet.h"
/**************************** Type Definitions ******************************/

/*
 * Define an aligned data type for an ethernet frame. This declaration is
 * specific to the GNU compiler
 */
//typedef char EthernetFrame[XEMACPS_MAX_VLAN_FRAME_SIZE]
//	__attribute__ ((aligned(32)));

typedef unsigned char EthernetFrame[XAE_MAX_JUMBO_FRAME_SIZE] __attribute__ ((aligned(64)));
#endif /* ETHERNET_HEADER_H */
