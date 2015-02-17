cmd_spl/arch/arm/lib/vectors.o := arm-xilinx-linux-gnueabi-gcc -Wp,-MD,spl/arch/arm/lib/.vectors.o.d  -nostdinc -isystem /opt/Xilinx/SDK/2014.4/gnu/arm/lin/bin/../lib/gcc/arm-xilinx-linux-gnueabi/4.8.3/include -Iinclude  -I/root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x4000000  -DCONFIG_SPL_BUILD -D__ASSEMBLY__ -g      -DCONFIG_ARM -D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux  -march=armv7-a  -mno-unaligned-access  -ffunction-sections -fdata-sections -fno-common -ffixed-r9  -msoft-float  -fno-strict-aliasing -mno-unaligned-access -mfpu=neon -pipe     -c -o spl/arch/arm/lib/vectors.o arch/arm/lib/vectors.S

source_spl/arch/arm/lib/vectors.o := arch/arm/lib/vectors.S

deps_spl/arch/arm/lib/vectors.o := \
    $(wildcard include/config/sys/dv/nor/boot/cfg.h) \
    $(wildcard include/config/spl/build.h) \
    $(wildcard include/config/use/irq.h) \

spl/arch/arm/lib/vectors.o: $(deps_spl/arch/arm/lib/vectors.o)

$(deps_spl/arch/arm/lib/vectors.o):
