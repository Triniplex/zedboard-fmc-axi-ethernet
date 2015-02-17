cmd_lib/libfdt/fdt_ro.o := arm-xilinx-linux-gnueabi-gcc -Wp,-MD,lib/libfdt/.fdt_ro.o.d  -nostdinc -isystem /opt/Xilinx/SDK/2014.4/gnu/arm/lin/bin/../lib/gcc/arm-xilinx-linux-gnueabi/4.8.3/include -Iinclude  -I/root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include -D__KERNEL__ -DCONFIG_SYS_TEXT_BASE=0x4000000 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -g -fstack-usage -Wno-format-nonliteral -DCONFIG_ARM -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations -march=armv7-a -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -msoft-float -fno-strict-aliasing -mno-unaligned-access -mfpu=neon -pipe    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(fdt_ro)"  -D"KBUILD_MODNAME=KBUILD_STR(fdt_ro)" -c -o lib/libfdt/fdt_ro.o lib/libfdt/fdt_ro.c

source_lib/libfdt/fdt_ro.o := lib/libfdt/fdt_ro.c

deps_lib/libfdt/fdt_ro.o := \
  include/libfdt_env.h \
  include/compiler.h \
  /opt/Xilinx/SDK/2014.4/gnu/arm/lin/lib/gcc/arm-xilinx-linux-gnueabi/4.8.3/include/stddef.h \
  include/linux/string.h \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
  include/linux/posix_types.h \
  include/linux/stddef.h \
  /root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include/asm/posix_types.h \
  /root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include/asm/types.h \
    $(wildcard include/config/arm64.h) \
  /opt/Xilinx/SDK/2014.4/gnu/arm/lin/lib/gcc/arm-xilinx-linux-gnueabi/4.8.3/include/stdbool.h \
  /root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include/asm/string.h \
    $(wildcard include/config/use/arch/memcpy.h) \
    $(wildcard include/config/use/arch/memset.h) \
  include/config.h \
    $(wildcard include/config/sys/arch.h) \
    $(wildcard include/config/sys/cpu.h) \
    $(wildcard include/config/sys/board.h) \
    $(wildcard include/config/sys/vendor.h) \
    $(wildcard include/config/sys/soc.h) \
    $(wildcard include/config/boarddir.h) \
  include/config_cmd_defaults.h \
    $(wildcard include/config/cmd/defaults/h/.h) \
    $(wildcard include/config/cmd/bootm.h) \
    $(wildcard include/config/cmd/crc32.h) \
    $(wildcard include/config/cmd/exportenv.h) \
    $(wildcard include/config/cmd/go.h) \
    $(wildcard include/config/cmd/importenv.h) \
  include/config_defaults.h \
    $(wildcard include/config/defaults/h/.h) \
    $(wildcard include/config/bootm/linux.h) \
    $(wildcard include/config/bootm/netbsd.h) \
    $(wildcard include/config/bootm/plan9.h) \
    $(wildcard include/config/bootm/rtems.h) \
    $(wildcard include/config/bootm/vxworks.h) \
    $(wildcard include/config/gzip.h) \
    $(wildcard include/config/zlib.h) \
    $(wildcard include/config/partitions.h) \
  include/configs/zynq_zc70x.h \
    $(wildcard include/config/zynq/zc70x/h.h) \
    $(wildcard include/config/sys/sdram/size.h) \
    $(wildcard include/config/zynq/serial/uart1.h) \
    $(wildcard include/config/zynq/gem0.h) \
    $(wildcard include/config/zynq/gem/phy/addr0.h) \
    $(wildcard include/config/sys/no/flash.h) \
    $(wildcard include/config/zynq/sdhci0.h) \
    $(wildcard include/config/zynq/usb.h) \
    $(wildcard include/config/zynq/qspi.h) \
    $(wildcard include/config/zynq/i2c0.h) \
    $(wildcard include/config/zynq/eeprom.h) \
    $(wildcard include/config/zynq/boot/freebsd.h) \
    $(wildcard include/config/default/device/tree.h) \
  include/configs/zynq-common.h \
    $(wildcard include/config/zynq/common/h.h) \
    $(wildcard include/config/armv7.h) \
    $(wildcard include/config/zynq.h) \
    $(wildcard include/config/cmd/cache.h) \
    $(wildcard include/config/sys/cacheline/size.h) \
    $(wildcard include/config/sys/l2cache/off.h) \
    $(wildcard include/config/sys/l2/pl310.h) \
    $(wildcard include/config/sys/pl310/base.h) \
    $(wildcard include/config/baudrate.h) \
    $(wildcard include/config/sys/baudrate/table.h) \
    $(wildcard include/config/zynq/dcc.h) \
    $(wildcard include/config/arm/dcc.h) \
    $(wildcard include/config/cpu/v6.h) \
    $(wildcard include/config/zynq/serial/uart0.h) \
    $(wildcard include/config/zynq/serial.h) \
    $(wildcard include/config/zynq/gem1.h) \
    $(wildcard include/config/net/multi.h) \
    $(wildcard include/config/zynq/gem.h) \
    $(wildcard include/config/mii.h) \
    $(wildcard include/config/sys/fault/echo/link/down.h) \
    $(wildcard include/config/phylib.h) \
    $(wildcard include/config/phy/marvell.h) \
    $(wildcard include/config/sys/enet.h) \
    $(wildcard include/config/bootp/may/fail.h) \
    $(wildcard include/config/zynq/gem/emio0.h) \
    $(wildcard include/config/zynq/gem/emio1.h) \
    $(wildcard include/config/zynq/spi.h) \
    $(wildcard include/config/spi/flash.h) \
    $(wildcard include/config/spi/flash/sst.h) \
    $(wildcard include/config/cmd/spi.h) \
    $(wildcard include/config/cmd/sf.h) \
    $(wildcard include/config/sys/flash/base.h) \
    $(wildcard include/config/sys/flash/size.h) \
    $(wildcard include/config/sys/max/flash/banks.h) \
    $(wildcard include/config/sys/max/flash/sect.h) \
    $(wildcard include/config/sys/flash/erase/tout.h) \
    $(wildcard include/config/sys/flash/write/tout.h) \
    $(wildcard include/config/flash/show/progress.h) \
    $(wildcard include/config/sys/flash/cfi.h) \
    $(wildcard include/config/sys/flash/empty/info.h) \
    $(wildcard include/config/flash/cfi/driver.h) \
    $(wildcard include/config/sys/flash/protection.h) \
    $(wildcard include/config/sys/flash/use/buffer/write.h) \
    $(wildcard include/config/zynq/m29ew/wb/hack.h) \
    $(wildcard include/config/zynq/sdhci1.h) \
    $(wildcard include/config/mmc.h) \
    $(wildcard include/config/generic/mmc.h) \
    $(wildcard include/config/sdhci.h) \
    $(wildcard include/config/zynq/sdhci.h) \
    $(wildcard include/config/cmd/mmc.h) \
    $(wildcard include/config/usb/ehci.h) \
    $(wildcard include/config/cmd/usb.h) \
    $(wildcard include/config/usb/storage.h) \
    $(wildcard include/config/usb/ehci/zynq.h) \
    $(wildcard include/config/usb/ulpi/viewport.h) \
    $(wildcard include/config/usb/ulpi.h) \
    $(wildcard include/config/ehci/is/tdi.h) \
    $(wildcard include/config/usb/max/controller/count.h) \
    $(wildcard include/config/ci/udc.h) \
    $(wildcard include/config/usb/gadget.h) \
    $(wildcard include/config/usb/gadget/dualspeed.h) \
    $(wildcard include/config/usbdownload/gadget.h) \
    $(wildcard include/config/sys/dfu/data/buf/size.h) \
    $(wildcard include/config/dfu/function.h) \
    $(wildcard include/config/dfu/ram.h) \
    $(wildcard include/config/usb/gadget/vbus/draw.h) \
    $(wildcard include/config/g/dnl/vendor/num.h) \
    $(wildcard include/config/g/dnl/product/num.h) \
    $(wildcard include/config/g/dnl/manufacturer.h) \
    $(wildcard include/config/usb/cable/check.h) \
    $(wildcard include/config/cmd/dfu.h) \
    $(wildcard include/config/cmd/thor/download.h) \
    $(wildcard include/config/thor/function.h) \
    $(wildcard include/config/thor/reset/off.h) \
    $(wildcard include/config/dfu/mmc.h) \
    $(wildcard include/config/support/vfat.h) \
    $(wildcard include/config/cmd/fat.h) \
    $(wildcard include/config/cmd/ext2.h) \
    $(wildcard include/config/fat/write.h) \
    $(wildcard include/config/dos/partition.h) \
    $(wildcard include/config/cmd/ext4.h) \
    $(wildcard include/config/cmd/ext4/write.h) \
    $(wildcard include/config/sf/default/speed.h) \
    $(wildcard include/config/spi/flash/bar.h) \
    $(wildcard include/config/spi/flash/spansion.h) \
    $(wildcard include/config/spi/flash/stmicro.h) \
    $(wildcard include/config/spi/flash/winbond.h) \
    $(wildcard include/config/sf/dual/flash.h) \
    $(wildcard include/config/nand/zynq.h) \
    $(wildcard include/config/cmd/nand.h) \
    $(wildcard include/config/cmd/nand/lock/unlock.h) \
    $(wildcard include/config/sys/max/nand/device.h) \
    $(wildcard include/config/sys/nand/self/init.h) \
    $(wildcard include/config/sys/nand/onfi/detection.h) \
    $(wildcard include/config/mtd/device.h) \
    $(wildcard include/config/sys/i2c/zynq.h) \
    $(wildcard include/config/cmd/i2c.h) \
    $(wildcard include/config/sys/i2c.h) \
    $(wildcard include/config/sys/i2c/zynq/speed.h) \
    $(wildcard include/config/sys/i2c/zynq/slave.h) \
    $(wildcard include/config/cmd/eeprom.h) \
    $(wildcard include/config/sys/i2c/eeprom/addr/len.h) \
    $(wildcard include/config/sys/i2c/eeprom/addr.h) \
    $(wildcard include/config/sys/eeprom/page/write/bits.h) \
    $(wildcard include/config/sys/eeprom/page/write/delay/ms.h) \
    $(wildcard include/config/sys/eeprom/size.h) \
    $(wildcard include/config/sys/i2c/mux/addr.h) \
    $(wildcard include/config/sys/i2c/mux/eeprom/sel.h) \
    $(wildcard include/config/env/size.h) \
    $(wildcard include/config/env/overwrite.h) \
    $(wildcard include/config/env/is/nowhere.h) \
    $(wildcard include/config/env/is/in/flash.h) \
    $(wildcard include/config/env/is/in/spi/flash.h) \
    $(wildcard include/config/env/is/in/nand.h) \
    $(wildcard include/config/env/sect/size.h) \
    $(wildcard include/config/env/offset.h) \
    $(wildcard include/config/cmd/saveenv.h) \
    $(wildcard include/config/extra/env/settings.h) \
    $(wildcard include/config/ipaddr.h) \
    $(wildcard include/config/serverip.h) \
    $(wildcard include/config/cmd/zynq/rsa.h) \
    $(wildcard include/config/bootcommand.h) \
    $(wildcard include/config/bootdelay.h) \
    $(wildcard include/config/sys/load/addr.h) \
    $(wildcard include/config/sys/prompt.h) \
    $(wildcard include/config/sys/hush/parser.h) \
    $(wildcard include/config/cmdline/editing.h) \
    $(wildcard include/config/auto/complete.h) \
    $(wildcard include/config/board/late/init.h) \
    $(wildcard include/config/display/boardinfo.h) \
    $(wildcard include/config/sys/longhelp.h) \
    $(wildcard include/config/clocks.h) \
    $(wildcard include/config/cmd/clk.h) \
    $(wildcard include/config/sys/maxargs.h) \
    $(wildcard include/config/sys/cbsize.h) \
    $(wildcard include/config/sys/pbsize.h) \
    $(wildcard include/config/cse/qspi.h) \
    $(wildcard include/config/cse/nor.h) \
    $(wildcard include/config/sys/text/base.h) \
    $(wildcard include/config/cse/nand.h) \
    $(wildcard include/config/zynq/ocm.h) \
    $(wildcard include/config/nr/dram/banks.h) \
    $(wildcard include/config/sys/sdram/base.h) \
    $(wildcard include/config/sys/memtest/start.h) \
    $(wildcard include/config/sys/memtest/end.h) \
    $(wildcard include/config/sys/malloc/len.h) \
    $(wildcard include/config/sys/init/ram/addr.h) \
    $(wildcard include/config/sys/init/ram/size.h) \
    $(wildcard include/config/sys/init/sp/addr.h) \
    $(wildcard include/config/fpga.h) \
    $(wildcard include/config/fpga/xilinx.h) \
    $(wildcard include/config/fpga/zynqpl.h) \
    $(wildcard include/config/cmd/fpga.h) \
    $(wildcard include/config/cmd/fpga/loadmk.h) \
    $(wildcard include/config/cmd/fpga/loadp.h) \
    $(wildcard include/config/cmd/fpga/loadbp.h) \
    $(wildcard include/config/cmd/fpga/loadfs.h) \
    $(wildcard include/config/of/libfdt.h) \
    $(wildcard include/config/fit.h) \
    $(wildcard include/config/fit/verbose.h) \
    $(wildcard include/config/image/format/legacy.h) \
    $(wildcard include/config/sys/bootm/len.h) \
    $(wildcard include/config/api.h) \
    $(wildcard include/config/cmd/elf.h) \
    $(wildcard include/config/sys/mmc/max/device.h) \
    $(wildcard include/config/sys/ldscript.h) \
    $(wildcard include/config/cmd/ping.h) \
    $(wildcard include/config/cmd/dhcp.h) \
    $(wildcard include/config/cmd/mii.h) \
    $(wildcard include/config/cmd/tftpput.h) \
    $(wildcard include/config/cmd/net.h) \
    $(wildcard include/config/cmd/nfs.h) \
    $(wildcard include/config/rsa.h) \
    $(wildcard include/config/sha256.h) \
    $(wildcard include/config/cmd/zynq/aes.h) \
    $(wildcard include/config/cmd/bootz.h) \
    $(wildcard include/config/sys/hz.h) \
    $(wildcard include/config/cmd/reginfo.h) \
    $(wildcard include/config/panic/hang.h) \
    $(wildcard include/config/spl.h) \
    $(wildcard include/config/cmd/spl.h) \
    $(wildcard include/config/spl/framework.h) \
    $(wildcard include/config/spl/libcommon/support.h) \
    $(wildcard include/config/spl/libgeneric/support.h) \
    $(wildcard include/config/spl/serial/support.h) \
    $(wildcard include/config/spl/board/init.h) \
    $(wildcard include/config/spl/ldscript.h) \
    $(wildcard include/config/spl/fpga/support.h) \
    $(wildcard include/config/spl/fpga/load/addr.h) \
    $(wildcard include/config/spl/fpga/bit.h) \
    $(wildcard include/config/spl/fpga/load/args/name.h) \
    $(wildcard include/config/spl/mmc/support.h) \
    $(wildcard include/config/sys/mmcsd/raw/mode/u/boot/sector.h) \
    $(wildcard include/config/sys/u/boot/max/size/sectors.h) \
    $(wildcard include/config/sys/mmc/sd/fat/boot/partition.h) \
    $(wildcard include/config/spl/libdisk/support.h) \
    $(wildcard include/config/spl/fat/support.h) \
    $(wildcard include/config/of/control.h) \
    $(wildcard include/config/of/separate.h) \
    $(wildcard include/config/spl/fat/load/payload/name.h) \
    $(wildcard include/config/spl/build.h) \
    $(wildcard include/config/sys/dcache/off.h) \
    $(wildcard include/config/sys/spl/args/addr.h) \
    $(wildcard include/config/sys/spi/args/offs.h) \
    $(wildcard include/config/sys/spi/args/size.h) \
    $(wildcard include/config/spl/fat/load/args/name.h) \
    $(wildcard include/config/spl/fat/load/kernel/name.h) \
    $(wildcard include/config/sys/mmcsd/raw/mode/args/sector.h) \
    $(wildcard include/config/sys/mmcsd/raw/mode/args/sectors.h) \
    $(wildcard include/config/sys/mmcsd/raw/mode/kernel/sector.h) \
    $(wildcard include/config/spl/spi/support.h) \
    $(wildcard include/config/spl/spi/load.h) \
    $(wildcard include/config/spl/spi/flash/support.h) \
    $(wildcard include/config/spl/spi/bus.h) \
    $(wildcard include/config/sys/spi/u/boot/offs.h) \
    $(wildcard include/config/spl/spi/cs.h) \
    $(wildcard include/config/spl/ram/device.h) \
    $(wildcard include/config/spl/net/support.h) \
    $(wildcard include/config/spl/eth/support.h) \
    $(wildcard include/config/spl/env/support.h) \
    $(wildcard include/config/spl/eth/device.h) \
    $(wildcard include/config/spl/os/boot.h) \
    $(wildcard include/config/sys/spi/kernel/offs.h) \
    $(wildcard include/config/spl/text/base.h) \
    $(wildcard include/config/spl/max/footprint.h) \
    $(wildcard include/config/spl/max/size.h) \
    $(wildcard include/config/spl/stack/size.h) \
    $(wildcard include/config/spl/stack.h) \
    $(wildcard include/config/sys/spl/malloc/start.h) \
    $(wildcard include/config/sys/spl/malloc/size.h) \
    $(wildcard include/config/spl/bss/start/addr.h) \
    $(wildcard include/config/spl/bss/max/size.h) \
    $(wildcard include/config/sys/uboot/start.h) \
    $(wildcard include/config/sys/generic/board.h) \
  include/config_cmd_default.h \
    $(wildcard include/config/cmd/default/h.h) \
    $(wildcard include/config/cmd/bdi.h) \
    $(wildcard include/config/cmd/bootd.h) \
    $(wildcard include/config/cmd/console.h) \
    $(wildcard include/config/cmd/echo.h) \
    $(wildcard include/config/cmd/editenv.h) \
    $(wildcard include/config/cmd/imi.h) \
    $(wildcard include/config/cmd/itest.h) \
    $(wildcard include/config/cmd/flash.h) \
    $(wildcard include/config/cmd/imls.h) \
    $(wildcard include/config/cmd/loadb.h) \
    $(wildcard include/config/cmd/loads.h) \
    $(wildcard include/config/cmd/memory.h) \
    $(wildcard include/config/cmd/misc.h) \
    $(wildcard include/config/cmd/run.h) \
    $(wildcard include/config/cmd/setgetdcr.h) \
    $(wildcard include/config/cmd/source.h) \
    $(wildcard include/config/cmd/ximg.h) \
  /root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include/asm/config.h \
    $(wildcard include/config/h/.h) \
    $(wildcard include/config/sys/generic/global/data.h) \
    $(wildcard include/config/lmb.h) \
    $(wildcard include/config/sys/boot/ramdisk/high.h) \
    $(wildcard include/config/phys/64bit.h) \
    $(wildcard include/config/static/rela.h) \
    $(wildcard include/config/fsl/lsch3.h) \
  include/config_fallbacks.h \
    $(wildcard include/config/fallbacks/h.h) \
    $(wildcard include/config/spl/pad/to.h) \
    $(wildcard include/config/fs/fat.h) \
    $(wildcard include/config/fs/ext4.h) \
    $(wildcard include/config/ext4/write.h) \
    $(wildcard include/config/cmd/ide.h) \
    $(wildcard include/config/cmd/sata.h) \
    $(wildcard include/config/cmd/scsi.h) \
    $(wildcard include/config/cmd/part.h) \
    $(wildcard include/config/cmd/gpt.h) \
    $(wildcard include/config/systemace.h) \
    $(wildcard include/config/sandbox.h) \
    $(wildcard include/config/partition/uuids.h) \
    $(wildcard include/config/efi/partition.h) \
    $(wildcard include/config/random/uuid.h) \
    $(wildcard include/config/cmd/uuid.h) \
    $(wildcard include/config/bootp/pxe.h) \
    $(wildcard include/config/lib/uuid.h) \
    $(wildcard include/config/lib/rand.h) \
    $(wildcard include/config/lib/hw/rand.h) \
    $(wildcard include/config/lcd.h) \
    $(wildcard include/config/cmd/bmp.h) \
    $(wildcard include/config/fit/signature.h) \
    $(wildcard include/config/disable/image/legacy.h) \
  include/config_uncmd_spl.h \
    $(wildcard include/config/uncmd/spl/h//.h) \
    $(wildcard include/config/cmd/cdp.h) \
    $(wildcard include/config/cmd/dns.h) \
    $(wildcard include/config/cmd/link/local.h) \
    $(wildcard include/config/cmd/rarp.h) \
    $(wildcard include/config/cmd/sntp.h) \
    $(wildcard include/config/cmd/tftpsrv.h) \
  include/linux/linux_string.h \
  /root/zynq_linux_axiethernet_driver/u-boot-xlnx/arch/arm/include/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc4.h \
  include/linux/byteorder/swab.h \
  include/linux/byteorder/generic.h \
  include/linux/types.h \
  include/fdt.h \
  include/libfdt.h \
  lib/libfdt/libfdt_internal.h \

lib/libfdt/fdt_ro.o: $(deps_lib/libfdt/fdt_ro.o)

$(deps_lib/libfdt/fdt_ro.o):
