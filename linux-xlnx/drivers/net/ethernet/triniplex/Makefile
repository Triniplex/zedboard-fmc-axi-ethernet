#
# Makefile for the triniplex network device drivers.
#

axienet_fmc_mdio-objs := axienet_fmc_util.o 
obj-m += axienet_fmc_mdio.o
axienet_fmc_emac-objs := axienet_fmc_util.o axienet_fmc_driver.o
obj-m += axienet_fmc_emac.o

all:
	make -C /root/zynq_linux_axiethernet_driver/linux-xlnx M=$(PWD) INSTALL_MOD_PATH=/root/zynq_linux_axiethernet_driver/build_install modules modules_install

clean:
	make -C /root/zynq_linux_axiethernet_driver/linux-xlnx M=$(PWD) clean
