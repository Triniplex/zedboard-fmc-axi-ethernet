cmd_spl/lib/div64.o := arm-xilinx-linux-gnueabi-gcc -Wp,-MD,spl/lib/.div64.o.d  -nostdinc -isystem /opt/Xilinx/SDK/2014.4/gnu/arm/lin/bin/../lib/gcc/arm-xilinx-linux-gnueabi/4.8.3/include -Iinclude  -I/root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x4000000 -DCONFIG_SPL_BUILD -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -g -fstack-usage -Wno-format-nonliteral -ffunction-sections -fdata-sections -DCONFIG_ARM -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -march=armv7-a -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -msoft-float -fno-strict-aliasing -mno-unaligned-access -mfpu=neon -pipe    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(div64)"  -D"KBUILD_MODNAME=KBUILD_STR(div64)" -c -o spl/lib/div64.o lib/div64.c

source_spl/lib/div64.o := lib/div64.c

deps_spl/lib/div64.o := \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
  include/linux/posix_types.h \
  include/linux/stddef.h \
  /root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include/asm/posix_types.h \
  /root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include/asm/types.h \
    $(wildcard include/config/arm64.h) \
  /opt/Xilinx/SDK/2014.4/gnu/arm/lin/lib/gcc/arm-xilinx-linux-gnueabi/4.8.3/include/stdbool.h \

spl/lib/div64.o: $(deps_spl/lib/div64.o)

$(deps_spl/lib/div64.o):
