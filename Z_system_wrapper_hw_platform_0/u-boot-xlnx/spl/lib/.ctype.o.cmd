cmd_spl/lib/ctype.o := arm-xilinx-linux-gnueabi-gcc -Wp,-MD,spl/lib/.ctype.o.d  -nostdinc -isystem /opt/Xilinx/SDK/2014.4/gnu/arm/lin/bin/../lib/gcc/arm-xilinx-linux-gnueabi/4.8.3/include -Iinclude  -I/root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x4000000 -DCONFIG_SPL_BUILD -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -g -fstack-usage -Wno-format-nonliteral -ffunction-sections -fdata-sections -DCONFIG_ARM -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -march=armv7-a -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -msoft-float -fno-strict-aliasing -mno-unaligned-access -mfpu=neon -pipe    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(ctype)"  -D"KBUILD_MODNAME=KBUILD_STR(ctype)" -c -o spl/lib/ctype.o lib/ctype.c

source_spl/lib/ctype.o := lib/ctype.c

deps_spl/lib/ctype.o := \
  include/linux/ctype.h \

spl/lib/ctype.o: $(deps_spl/lib/ctype.o)

$(deps_spl/lib/ctype.o):
