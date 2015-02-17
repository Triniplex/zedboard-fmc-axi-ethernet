#ifndef AXIENET_FMC_H
#define AXIENET_FMC_H

#include "axienet_hw.h"
#include <linux/netdevice.h>
#include <linux/spinlock.h>
#include <linux/interrupt.h>
#include <linux/if_vlan.h>

#define CONFIG_OF_MDIO 1
#define XAE_PROMISC_OPTION		0x00000001
#define XAE_JUMBO_OPTION		0x00000002
#define XAE_VLAN_OPTION			0x00000004
#define XAE_FLOW_CONTROL_OPTION		0x00000008
#define XAE_FCS_STRIP_OPTION		0x00000010
#define XAE_FCS_INSERT_OPTION		0x00000020
#define XAE_LENTYPE_ERR_OPTION		0x00000040
#define XAE_TRANSMITTER_ENABLE_OPTION	0x00000080
#define XAE_RECEIVER_ENABLE_OPTION	0x00000100
#define XAE_BROADCAST_OPTION		0x00000200
#define XAE_MULTICAST_OPTION		0x00000400
#define XAE_EXT_MULTICAST_OPTION	0x00000800
#define XAE_EXT_TXVLAN_TRAN_OPTION	0x00001000
#define XAE_EXT_RXVLAN_TRAN_OPTION	0x00002000
#define XAE_EXT_TXVLAN_TAG_OPTION	0x00004000
#define XAE_EXT_RXVLAN_TAG_OPTION	0x00008000
#define XAE_EXT_TXVLAN_STRP_OPTION	0x00010000
#define XAE_EXT_RXVLAN_STRP_OPTION	0x00020000

#define XAE_DEFAULT_OPTIONS				\
		(XAE_FLOW_CONTROL_OPTION |		\
		 XAE_BROADCAST_OPTION |			\
		 XAE_FCS_INSERT_OPTION |		\
		 XAE_FCS_STRIP_OPTION |			\
		 XAE_LENTYPE_ERR_OPTION |		\
		 XAE_TRANSMITTER_ENABLE_OPTION | 	\
		 XAE_RECEIVER_ENABLE_OPTION)

#define XAE_MULTI_MAT_ENTRIES	4
#define XAE_MDIO_DIV_DFT	29
#define XAE_MAC_ADDR_SIZE		6
#define XAE_MTU				1500
#define XAE_JUMBO_MTU			8982	
#define XAE_HDR_SIZE			14
#define XAE_HDR_VLAN_SIZE		18
#define XAE_TRL_SIZE			4
#define XAE_MAX_FRAME_SIZE	 (XAE_MTU + XAE_HDR_SIZE + XAE_TRL_SIZE)
#define XAE_MAX_VLAN_FRAME_SIZE  (XAE_MTU + XAE_HDR_VLAN_SIZE + XAE_TRL_SIZE)
#define XAE_MAX_JUMBO_FRAME_SIZE (XAE_JUMBO_MTU + XAE_HDR_SIZE + XAE_TRL_SIZE)
#define XAE_PHY_TYPE_MII		0
#define XAE_PHY_TYPE_GMII		1
#define XAE_PHY_TYPE_RGMII_1_3		2
#define XAE_PHY_TYPE_RGMII_2_0		3
#define XAE_PHY_TYPE_SGMII		4
#define XAE_PHY_TYPE_1000BASE_X		5
#define XAE_TPID_MAX_ENTRIES		4 
#define XAE_VTAG_NONE			0
#define XAE_VTAG_ALL			1
#define XAE_VTAG_EXISTED		2
#define XAE_VTAG_SELECT		  	3
#define XAE_DEFAULT_TXVTAG_MODE  	XAE_VTAG_ALL
#define XAE_DEFAULT_RXVTAG_MODE  	XAE_VTAG_ALL
#define XAE_VSTRP_NONE			0
#define XAE_VSTRP_ALL			1
#define XAE_VSTRP_SELECT		3
#define XAE_DEFAULT_TXVSTRP_MODE	XAE_VSTRP_ALL
#define XAE_DEFAULT_RXVSTRP_MODE	XAE_VSTRP_ALL
#define XAE_RX				1 
#define XAE_TX				2
#define XAE_SOFT_TEMAC_10_100_MBPS	0
#define XAE_SOFT_TEMAC_10_100_1000_MBPS	1
#define XAE_HARD_TEMC			2
#define XAXIDMA_TX_CR_OFFSET    0x00000000 /* Channel control */
#define XAXIDMA_TX_SR_OFFSET    0x00000004 /* Status */
#define XAXIDMA_TX_CDESC_OFFSET 0x00000008 /* Current descriptor pointer */
#define XAXIDMA_TX_TDESC_OFFSET 0x00000010 /* Tail descriptor pointer */

#define XAXIDMA_RX_CR_OFFSET    0x00000030 /* Channel control */
#define XAXIDMA_RX_SR_OFFSET    0x00000034 /* Status */
#define XAXIDMA_RX_CDESC_OFFSET 0x00000038 /* Current descriptor pointer */
#define XAXIDMA_RX_TDESC_OFFSET 0x00000040 /* Tail descriptor pointer */

#define XAXIDMA_CR_RUNSTOP_MASK 0x00000001 /* Start/stop DMA channel */
#define XAXIDMA_CR_RESET_MASK   0x00000004 /* Reset DMA engine */

#define XAXIDMA_BD_NDESC_OFFSET         0x00 /* Next descriptor pointer */
#define XAXIDMA_BD_BUFA_OFFSET          0x08 /* Buffer address */
#define XAXIDMA_BD_CTRL_LEN_OFFSET      0x18 /* Control/buffer length */
#define XAXIDMA_BD_STS_OFFSET           0x1C /* Status */
#define XAXIDMA_BD_USR0_OFFSET          0x20 /* User IP specific word0 */
#define XAXIDMA_BD_USR1_OFFSET          0x24 /* User IP specific word1 */
#define XAXIDMA_BD_USR2_OFFSET          0x28 /* User IP specific word2 */
#define XAXIDMA_BD_USR3_OFFSET          0x2C /* User IP specific word3 */
#define XAXIDMA_BD_USR4_OFFSET          0x30 /* User IP specific word4 */
#define XAXIDMA_BD_ID_OFFSET            0x34 /* Sw ID */
#define XAXIDMA_BD_HAS_STSCNTRL_OFFSET  0x38 /* Whether has stscntrl strm */
#define XAXIDMA_BD_HAS_DRE_OFFSET       0x3C /* Whether has DRE */

#define XAXIDMA_BD_HAS_DRE_SHIFT        8 /* Whether has DRE shift */
#define XAXIDMA_BD_HAS_DRE_MASK         0xF00 /* Whether has DRE mask */
#define XAXIDMA_BD_WORDLEN_MASK         0xFF /* Whether has DRE mask */

#define XAXIDMA_BD_CTRL_LENGTH_MASK     0x007FFFFF /* Requested len */
#define XAXIDMA_BD_CTRL_TXSOF_MASK      0x08000000 /* First tx packet */
#define XAXIDMA_BD_CTRL_TXEOF_MASK      0x04000000 /* Last tx packet */
#define XAXIDMA_BD_CTRL_ALL_MASK        0x0C000000 /* All control bits */

#define XAXIDMA_DELAY_MASK              0xFF000000 /* Delay timeout counter */
#define XAXIDMA_COALESCE_MASK           0x00FF0000 /* Coalesce counter */

#define XAXIDMA_DELAY_SHIFT             24
#define XAXIDMA_COALESCE_SHIFT          16

#define XAXIDMA_IRQ_IOC_MASK            0x00001000 /* Completion intr */
#define XAXIDMA_IRQ_DELAY_MASK          0x00002000 /* Delay interrupt */
#define XAXIDMA_IRQ_ERROR_MASK          0x00004000 /* Error interrupt */
#define XAXIDMA_IRQ_ALL_MASK            0x00007000 /* All interrupts */

/* Default TX/RX Threshold and waitbound values for SGDMA mode */
#define XAXIDMA_DFT_TX_THRESHOLD        24
#define XAXIDMA_DFT_TX_WAITBOUND        254
#define XAXIDMA_DFT_RX_THRESHOLD        24
#define XAXIDMA_DFT_RX_WAITBOUND        254

#define XAXIDMA_BD_CTRL_TXSOF_MASK      0x08000000 /* First tx packet */
#define XAXIDMA_BD_CTRL_TXEOF_MASK      0x04000000 /* Last tx packet */
#define XAXIDMA_BD_CTRL_ALL_MASK        0x0C000000 /* All control bits */

#define XAXIDMA_BD_STS_ACTUAL_LEN_MASK  0x007FFFFF /* Actual len */
#define XAXIDMA_BD_STS_COMPLETE_MASK    0x80000000 /* Completed */
#define XAXIDMA_BD_STS_DEC_ERR_MASK     0x40000000 /* Decode error */
#define XAXIDMA_BD_STS_SLV_ERR_MASK     0x20000000 /* Slave error */
#define XAXIDMA_BD_STS_INT_ERR_MASK     0x10000000 /* Internal err */
#define XAXIDMA_BD_STS_ALL_ERR_MASK     0x70000000 /* All errors */
#define XAXIDMA_BD_STS_RXSOF_MASK       0x08000000 /* First rx pkt */
#define XAXIDMA_BD_STS_RXEOF_MASK       0x04000000 /* Last rx pkt */
#define XAXIDMA_BD_STS_ALL_MASK         0xFC000000 /* All status bits */

#define XAXIDMA_BD_MINIMUM_ALIGNMENT    0x40

/* Axi Ethernet Synthesis features */
#define XAE_FEATURE_PARTIAL_RX_CSUM     (1 << 0)
#define XAE_FEATURE_PARTIAL_TX_CSUM     (1 << 1)
#define XAE_FEATURE_FULL_RX_CSUM        (1 << 2)
#define XAE_FEATURE_FULL_TX_CSUM        (1 << 3)

#define XAE_NO_CSUM_OFFLOAD             0

#define XAE_FULL_CSUM_STATUS_MASK       0x00000038
#define XAE_IP_UDP_CSUM_VALIDATED       0x00000003
#define XAE_IP_TCP_CSUM_VALIDATED       0x00000002

#define DELAY_OF_ONE_MILLISEC           1000
#define XAE_PPST_OFFSET		0x00000030 

/* Read/Write access to the registers */
#ifndef out_be32
#ifdef CONFIG_ARCH_ZYNQ
#define in_be32(offset)         __raw_readl(offset)
#define out_be32(offset, val)   __raw_writel(val, offset)
#endif
#endif

/**
 * struct axidma_bd - Axi Dma buffer descriptor layout
 * @next:         MM2S/S2MM Next Descriptor Pointer
 * @reserved1:    Reserved and not used
 * @phys:         MM2S/S2MM Buffer Address
 * @reserved2:    Reserved and not used
 * @reserved3:    Reserved and not used
 * @reserved4:    Reserved and not used
 * @cntrl:        MM2S/S2MM Control value
 * @status:       MM2S/S2MM Status value
 * @app0:         MM2S/S2MM User Application Field 0.
 * @app1:         MM2S/S2MM User Application Field 1.
 * @app2:         MM2S/S2MM User Application Field 2.
 * @app3:         MM2S/S2MM User Application Field 3.
 * @app4:         MM2S/S2MM User Application Field 4.
 * @sw_id_offset: MM2S/S2MM Sw ID
 * @reserved5:    Reserved and not used
 * @reserved6:    Reserved and not used
 */
struct axidma_bd {
        u32 next;       /* Physical address of next buffer descriptor */
        u32 reserved1;
        u32 phys;
        u32 reserved2;
        u32 reserved3;
        u32 reserved4;
        u32 cntrl;
        u32 status;
        u32 app0;
        u32 app1;       /* TX start << 16 | insert */
        u32 app2;       /* TX csum seed */
        u32 app3;
        u32 app4;
        u32 sw_id_offset;
        u32 reserved5;
        u32 reserved6;
};

/**
 * struct axienet_fmc_local - axienet private per device data
 * @ndev:       Pointer for net_device to which it will be attached.
 * @dev:        Pointer to device structure
 * @phy_dev:    Pointer to PHY device structure attached to the axienet_fmc_local
 * @phy_node:   Pointer to device node structure
 * @mii_bus:    Pointer to MII bus structure
 * @mdio_irqs:  IRQs table for MDIO bus required in mii_bus structure
 * @regs:       Base address for the axienet_fmc_local device address space
 * @dma_regs:   Base address for the axidma device address space
 * @dma_err_tasklet: Tasklet structure to process Axi DMA errors
 * @tx_irq:     Axidma TX IRQ number
 * @rx_irq:     Axidma RX IRQ number
 * @temac_type: axienet type to identify between soft and hard temac
 * @phy_type:   Phy type to identify between MII/GMII/RGMII/SGMII/1000 Base-X
 * @options:    AxiEthernet option word
 * @last_link:  Phy link state in which the PHY was negotiated earlier
 * @features:   Stores the extended features supported by the axienet hw
 * @tx_bd_v:    Virtual address of the TX buffer descriptor ring
 * @tx_bd_p:    Physical address(start address) of the TX buffer descr. ring
 * @rx_bd_v:    Virtual address of the RX buffer descriptor ring
 * @rx_bd_p:    Physical address(start address) of the RX buffer descr. ring
 * @tx_bd_ci:   Stores the index of the Tx buffer descriptor in the ring being
 *              accessed currently. Used while alloc. BDs before a TX starts
 * @tx_bd_tail: Stores the index of the Tx buffer descriptor in the ring being
 *              accessed currently. Used while processing BDs after the TX
 *              completed.
 * @rx_bd_ci:   Stores the index of the Rx buffer descriptor in the ring being
 *              accessed currently.
 * @max_frm_size: Stores the maximum size of the frame that can be that
 *                Txed/Rxed in the existing hardware. If jumbo option is
 *                supported, the maximum frame size would be 9k. Else it is
 *                1522 bytes (assuming support for basic VLAN)
 * @jumbo_support: Stores hardware configuration for jumbo support. If hardware
 *                 can handle jumbo packets, this entry will be 1, else 0.
 */

struct axienet_fmc_mdio_local {
    struct net_device *ndev;
	u32 mii_offset;	/* offset of the MII registers */
    struct phy_device *phy_dev;     /* Pointer to PHY device */
    struct device_node *phy_node;
    struct mii_bus *mii_bus;        /* MII bus reference */
    int mdio_irqs[PHY_MAX_ADDR];    /* IRQs table for MDIO bus */
    u32 temac_type;
    u32 phy_type;

    u32 options;                    /* Current options word */
    u32 last_link;
    u32 features;
    u32 started;
};

/**
 * struct axienet_local - axienet private per device data
 * @ndev:	Pointer for net_device to which it will be attached.
 * @dev:	Pointer to device structure
 * @phy_dev:	Pointer to PHY device structure attached to the axienet_local
 * @phy_node:	Pointer to device node structure
 * @mii_bus:	Pointer to MII bus structure
 * @mdio_irqs:	IRQs table for MDIO bus required in mii_bus structure
 * @regs:	Base address for the axienet_local device address space
 * @dma_regs:	Base address for the axidma device address space
 * @dma_err_tasklet: Tasklet structure to process Axi DMA errors
 * @tx_irq:	Axidma TX IRQ number
 * @rx_irq:	Axidma RX IRQ number
 * @temac_type:	axienet type to identify between soft and hard temac
 * @phy_type:	Phy type to identify between MII/GMII/RGMII/SGMII/1000 Base-X
 * @options:	AxiEthernet option word
 * @last_link:	Phy link state in which the PHY was negotiated earlier
 * @features:	Stores the extended features supported by the axienet hw
 * @tx_bd_v:	Virtual address of the TX buffer descriptor ring
 * @tx_bd_p:	Physical address(start address) of the TX buffer descr. ring
 * @rx_bd_v:	Virtual address of the RX buffer descriptor ring
 * @rx_bd_p:	Physical address(start address) of the RX buffer descr. ring
 * @tx_bd_ci:	Stores the index of the Tx buffer descriptor in the ring being
 *		accessed currently. Used while alloc. BDs before a TX starts
 * @tx_bd_tail:	Stores the index of the Tx buffer descriptor in the ring being
 *		accessed currently. Used while processing BDs after the TX
 *		completed.
 * @rx_bd_ci:	Stores the index of the Rx buffer descriptor in the ring being
 *		accessed currently.
 * @max_frm_size: Stores the maximum size of the frame that can be that
 *		  Txed/Rxed in the existing hardware. If jumbo option is
 *		  supported, the maximum frame size would be 9k. Else it is
 *		  1522 bytes (assuming support for basic VLAN)
 * @jumbo_support: Stores hardware configuration for jumbo support. If hardware
 *		   can handle jumbo packets, this entry will be 1, else 0.
 */
struct axienet_fmc_local {
	struct net_device *ndev;
	struct device *dev;

	/* Connection to PHY device */
	struct phy_device *phy_dev;	/* Pointer to PHY device */
	struct device_node *phy_node;

	/* MDIO bus data */
	struct mii_bus *mii_bus;	/* MII bus reference */
	int mdio_irqs[PHY_MAX_ADDR];	/* IRQs table for MDIO bus */

	/* IO registers, dma functions and IRQs */
	void __iomem *regs;
	void __iomem *dma_regs;

	struct tasklet_struct dma_err_tasklet;

	int tx_irq;
	int rx_irq;
	u32 temac_type;
	u32 phy_type;

	u32 options;			/* Current options word */
	u32 last_link;
	u32 features;
	u32 started;

	/* Buffer descriptors */
	struct axidma_bd *tx_bd_v;
	dma_addr_t tx_bd_p;
	struct axidma_bd *rx_bd_v;
	dma_addr_t rx_bd_p;
	u32 tx_bd_ci;
	u32 tx_bd_tail;
	u32 rx_bd_ci;

	u32 max_frm_size;
	u32 rxmem;

	int csum_offload_on_tx_path;
	int csum_offload_on_rx_path;

	u32 coalesce_count_rx;
	u32 coalesce_count_tx;
};
/**
 * struct axiethernet_option - Used to set axi ethernet hardware options
 * @opt:        Option to be set.
 * @reg:        Register offset to be written for setting the option
 * @m_or:       Mask to be ORed for setting the option in the register
 */
struct axienet_fmc_option {
        u32 opt;
        u32 reg;
        u32 m_or;
};

struct axienet_fmc_mdio_data {
		u32 mii_offset;	/* offset of the MII registers */
        struct mii_bus *mii_bus;        /* MII bus reference */
        u32 options;                    /* Current options word */
        u32 started;
        uint32_t __iomem * (*get_phy_id)(void __iomem *p);
};

struct axienet_fmc_mii {
	u32 miimcfg;	/* MII management configuration reg */
	u32 miimcom;	/* MII management command reg */
	u32 miimadd;	/* MII management address reg */
	u32 miimcon;	/* MII management control reg */
	u32 miimstat;	/* MII management status reg */
	u32 miimind;	/* MII management indication reg */
};

struct axienet_fmc_mdio_priv {
	void __iomem *map;
	struct axienet_fmc_mii __iomem *regs;
	int irqs[PHY_MAX_ADDR];
};

/**
 * axienet_ior - Memory mapped Axi Ethernet register read
 * @lp:         Pointer to axienet local structure
 * @offset:     Address offset from the base address of Axi Ethernet core
 *
 * returns: The contents of the Axi Ethernet register
 *
 * This function returns the contents of the corresponding register.
 */
static inline u32 fmc_axienet_ior(struct axienet_fmc_local *lp, off_t offset) {
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
static inline void fmc_axienet_iow(struct axienet_fmc_local *lp, off_t offset,
                               u32 value) {
        out_be32((lp->regs + offset), value);
}

void axienet_fmc_set_mac_address(struct net_device *ndev, void *address);
void axienet_fmc_mdio_stop(struct axienet_fmc_local *lp);
int axienet_fmc_mdio_setup(struct axienet_fmc_local *lp, struct device_node *np);

#endif /* AXIENET_FMC_H */
