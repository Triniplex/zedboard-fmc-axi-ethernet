/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * 
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "scugic_header.h"
#include "xaxiethernet.h"
#include "xaxiethernet_example.h"
#include "xaxidma.h"
#include "axiethernet_intr_header.h"
#include "xdevcfg.h"
#include "devcfg_header.h"
#include "xdmaps.h"
#include "dmaps_header.h"
#include "xemacps.h"
#include "xemacps_example.h"
#include "emacps_header.h"
#include "xqspips.h"
#include "qspips_header.h"
#include "xscutimer.h"
#include "scutimer_header.h"
#include "xscuwdt.h"
#include "scuwdt_header.h"
#include "platform.h"
#include "ethfmc_axie.h"

int main() 
{
   static XScuGic intc;

   static XEmacPs ps7_ethernet_0;
   static XAxiEthernet axi_ethernet_0_eth_buf_AxiEthernet;
   static XAxiDma  axi_ethernet_0_eth_buf_AxiDma;

   static XAxiEthernet axi_ethernet_1_eth_buf_AxiEthernet;
   static XAxiDma  axi_ethernet_1_eth_buf_AxiDma;

   static XAxiEthernet axi_ethernet_2_eth_buf_AxiEthernet;
   static XAxiDma  axi_ethernet_2_eth_buf_AxiDma;

   static XAxiEthernet axi_ethernet_3_eth_buf_AxiEthernet;
   static XAxiDma  axi_ethernet_3_eth_buf_AxiDma;

   static XScuTimer ps7_scutimer_0;
   static XScuWdt ps7_scuwdt_0;
   Xil_ICacheEnable();
   Xil_DCacheEnable();
   print("---Entering main---\n\r");
   

   {
      int Status;
      
      print("\r\n Running ScuGicSelfTestExample() for ps7_scugic_0...\r\n");
      
      Status = ScuGicSelfTestExample(XPAR_PS7_SCUGIC_0_DEVICE_ID);
      
      if (Status == 0) {
         print("ScuGicSelfTestExample PASSED\r\n");
      }
      else {
         print("ScuGicSelfTestExample FAILED\r\n");
      }
   } 
	
   {
       int Status;

       Status = ScuGicInterruptSetup(&intc, XPAR_PS7_SCUGIC_0_DEVICE_ID);
       if (Status == 0) {
          print("ScuGic Interrupt Setup PASSED\r\n");
       } 
       else {
         print("ScuGic Interrupt Setup FAILED\r\n");
      } 
   }
   
   unsigned char mac_ethernet_address[] =
          { 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };

   {
      int Status;

      print("\r\nRunning AxiEthernetSgDmaIntrExample() for axi_ethernet_0_eth_buf...\r\n");

#if XPAR_GIGE_PCS_PMA_CORE_PRESENT == 1
          ProgramSi5324();
          ProgramSfpPhy();
#endif

      init_platform();
      EthFMC_init_axiemac(XPAR_AXIETHERNET_0_BASEADDR,mac_ethernet_address);

      Status = AxiEthernetSgDmaIntrExample(&intc, &axi_ethernet_0_eth_buf_AxiEthernet,
                     &axi_ethernet_0_eth_buf_AxiDma,
                     XPAR_AXI_ETHERNET_0_ETH_BUF_DEVICE_ID,
                     XPAR_AXI_ETHERNET_0_DMA_DEVICE_ID,
                     XPAR_FABRIC_AXI_ETHERNET_0_ETH_BUF_INTERRUPT_INTR,
                     XPAR_AXIETHERNET_0_CONNECTED_DMARX_INTR,
                     XPAR_AXIETHERNET_0_CONNECTED_DMATX_INTR);

      if (Status == 0) {
         print("AxiEthernet Interrupt Test PASSED.\r\n");
      }
      else {
         print("AxiEthernet Interrupt Test FAILED.\r\n");
      }

   }

   {
      int Status;

      print("\r\nRunning AxiEthernetSgDmaIntrExample() for axi_ethernet_1_eth_buf...\r\n");

      EthFMC_init_axiemac(XPAR_AXIETHERNET_1_BASEADDR,mac_ethernet_address);

      Status = AxiEthernetSgDmaIntrExample(&intc, &axi_ethernet_1_eth_buf_AxiEthernet,
                     &axi_ethernet_1_eth_buf_AxiDma,
                     XPAR_AXI_ETHERNET_1_ETH_BUF_DEVICE_ID,
                     XPAR_AXI_ETHERNET_1_DMA_DEVICE_ID,
                     XPAR_FABRIC_AXI_ETHERNET_1_ETH_BUF_INTERRUPT_INTR,
                     XPAR_AXIETHERNET_1_CONNECTED_DMARX_INTR,
                     XPAR_AXIETHERNET_1_CONNECTED_DMATX_INTR);

      if (Status == 0) {
         print("AxiEthernet Interrupt Test PASSED.\r\n");
      }
      else {
         print("AxiEthernet Interrupt Test FAILED.\r\n");
      }

   }
   
   {
      int Status;

      print("\r\nRunning AxiEthernetSgDmaIntrExample() for axi_ethernet_2_eth_buf...\r\n");

      EthFMC_init_axiemac(XPAR_AXIETHERNET_2_BASEADDR,mac_ethernet_address);

      Status = AxiEthernetSgDmaIntrExample(&intc, &axi_ethernet_2_eth_buf_AxiEthernet,
                     &axi_ethernet_2_eth_buf_AxiDma,
                     XPAR_AXI_ETHERNET_2_ETH_BUF_DEVICE_ID,
                     XPAR_AXI_ETHERNET_2_DMA_DEVICE_ID,
                     XPAR_FABRIC_AXI_ETHERNET_2_ETH_BUF_INTERRUPT_INTR,
                     XPAR_AXIETHERNET_2_CONNECTED_DMARX_INTR,
                     XPAR_AXIETHERNET_2_CONNECTED_DMATX_INTR);

      if (Status == 0) {
         print("AxiEthernet Interrupt Test PASSED.\r\n");
      }
      else {
         print("AxiEthernet Interrupt Test FAILED.\r\n");
      }

   }


   {
      int Status;

      print("\r\nRunning AxiEthernetSgDmaIntrExample() for axi_ethernet_3_eth_buf...\r\n");

      EthFMC_init_axiemac(XPAR_AXIETHERNET_3_BASEADDR,mac_ethernet_address);

      Status = AxiEthernetSgDmaIntrExample(&intc, &axi_ethernet_3_eth_buf_AxiEthernet,
                     &axi_ethernet_3_eth_buf_AxiDma,
                     XPAR_AXI_ETHERNET_3_ETH_BUF_DEVICE_ID,
                     XPAR_AXI_ETHERNET_3_DMA_DEVICE_ID,
                     XPAR_FABRIC_AXI_ETHERNET_3_ETH_BUF_INTERRUPT_INTR,
                     XPAR_AXIETHERNET_3_CONNECTED_DMARX_INTR,
                     XPAR_AXIETHERNET_3_CONNECTED_DMATX_INTR);

      if (Status == 0) {
         print("AxiEthernet Interrupt Test PASSED.\r\n");
      }
      else {
         print("AxiEthernet Interrupt Test FAILED.\r\n");
      }

   }

   {
      int Status;

      print("\r\n Running DcfgSelfTestExample() for ps7_dev_cfg_0...\r\n");

      Status = DcfgSelfTestExample(XPAR_PS7_DEV_CFG_0_DEVICE_ID);

      if (Status == 0) {
         print("DcfgSelfTestExample PASSED\r\n");
      }
      else {
         print("DcfgSelfTestExample FAILED\r\n");
      }
   }
   

   {
      int Status;
      
      print("\r\n Running XDmaPs_Example_W_Intr() for ps7_dma_s...\r\n");
      
      Status = XDmaPs_Example_W_Intr(&intc,XPAR_PS7_DMA_S_DEVICE_ID);
      
      if (Status == 0) {
         print("XDmaPs_Example_W_Intr PASSED\r\n");
      }
      else {
         print("XDmaPs_Example_W_Intr FAILED\r\n");
      }
   }
   
   {
      int Status;

      print("\r\n Running Interrupt Test  for ps7_ethernet_0...\r\n");
      
      Status = EmacPsDmaIntrExample(&intc, &ps7_ethernet_0, \
                                 XPAR_PS7_ETHERNET_0_DEVICE_ID, \
                                 XPAR_PS7_ETHERNET_0_INTR);
	
      if (Status == 0) {
         print("EmacPsDmaIntrExample PASSED\r\n");
      } 
      else {
         print("EmacPsDmaIntrExample FAILED\r\n");
      }

   }
   

   {
      int Status;
      
      print("\r\n Running QspiSelfTestExample() for ps7_qspi_0...\r\n");
      
      Status = QspiPsSelfTestExample(XPAR_PS7_QSPI_0_DEVICE_ID);
      
      if (Status == 0) {
         print("QspiPsSelfTestExample PASSED\r\n");
      }
      else {
         print("QspiPsSelfTestExample FAILED\r\n");
      }
   }
   

   {
      int Status;
      
      print("\r\n Running ScuTimerPolledExample() for ps7_scutimer_0...\r\n");
      
      Status = ScuTimerPolledExample(XPAR_PS7_SCUTIMER_0_DEVICE_ID);
      
      if (Status == 0) {
         print("ScuTimerPolledExample PASSED\r\n");
      }
      else {
         print("ScuTimerPolledExample FAILED\r\n");
      }
   }
   {
      int Status;

      print("\r\n Running Interrupt Test  for ps7_scutimer_0...\r\n");
      
      Status = ScuTimerIntrExample(&intc, &ps7_scutimer_0, \
                                 XPAR_PS7_SCUTIMER_0_DEVICE_ID, \
                                 XPAR_PS7_SCUTIMER_0_INTR);
	
      if (Status == 0) {
         print("ScuTimerIntrExample PASSED\r\n");
      } 
      else {
         print("ScuTimerIntrExample FAILED\r\n");
      }

   }
   
   {
      int Status;

      print("\r\n Running Interrupt Test  for ps7_scuwdt_0...\r\n");
      
      Status = ScuWdtIntrExample(&intc, &ps7_scuwdt_0, \
                                 XPAR_PS7_SCUWDT_0_DEVICE_ID, \
                                 XPAR_PS7_SCUWDT_0_INTR);
	
      if (Status == 0) {
         print("ScuWdtIntrExample PASSED\r\n");
      } 
      else {
         print("ScuWdtIntrExample FAILED\r\n");
      }

   }
   
   /*
    * Peripheral Test will not be run for ps7_uart_1
    * because it has been selected as the STDOUT device
    */

   print("---Exiting main---\n\r");
   Xil_DCacheDisable();
   Xil_ICacheDisable();
   return 0;
}
