cmd_examples/api/crt0.o := arm-xilinx-linux-gnueabi-gcc -Wp,-MD,examples/api/.crt0.o.d  -nostdinc -isystem /opt/Xilinx/SDK/2014.4/gnu/arm/lin/bin/../lib/gcc/arm-xilinx-linux-gnueabi/4.8.3/include -Iinclude  -I/root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x4000000  -D__ASSEMBLY__ -g       -DCONFIG_ARM -D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux  -mword-relocations  -march=armv7-a  -mno-unaligned-access  -ffunction-sections -fdata-sections -fno-common -ffixed-r9  -msoft-float  -fno-strict-aliasing -mno-unaligned-access -mfpu=neon -pipe     -c -o examples/api/crt0.o examples/api/crt0.S

source_examples/api/crt0.o := examples/api/crt0.S

deps_examples/api/crt0.o := \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/arm.h) \

examples/api/crt0.o: $(deps_examples/api/crt0.o)

$(deps_examples/api/crt0.o):
