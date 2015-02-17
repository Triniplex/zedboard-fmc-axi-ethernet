cmd_u-boot.lds := arm-xilinx-linux-gnueabi-gcc -E -Wp,-MD,./.u-boot.lds.d -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x4000000   -DCONFIG_ARM -D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux  -mword-relocations  -march=armv7-a  -mno-unaligned-access  -ffunction-sections -fdata-sections -fno-common -ffixed-r9  -msoft-float  -fno-strict-aliasing -mno-unaligned-access -mfpu=neon -pipe -Iinclude  -I/root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include  -nostdinc -isystem /opt/Xilinx/SDK/2014.4/gnu/arm/lin/bin/../lib/gcc/arm-xilinx-linux-gnueabi/4.8.3/include -include /root/zynq_linux_axiethernet_driver/u-boot-xlnx/include/u-boot/u-boot.lds.h -DCPUDIR=arch/arm/cpu/armv7  -ansi -D__ASSEMBLY__ -x assembler-with-cpp -P -o u-boot.lds /root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/cpu/armv7/zynq/u-boot.lds

source_u-boot.lds := /root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/cpu/armv7/zynq/u-boot.lds

deps_u-boot.lds := \
  /root/zynq_linux_axiethernet_driver/u-boot-xlnx/include/u-boot/u-boot.lds.h \

u-boot.lds: $(deps_u-boot.lds)

$(deps_u-boot.lds):
