cmd_spl/u-boot-spl := (cd spl && arm-xilinx-linux-gnueabi-ld   -T u-boot-spl.lds  --gc-sections -Bstatic --gc-sections -Ttext 0x0 arch/arm/cpu/armv7/start.o --start-group arch/arm/cpu/armv7/built-in.o arch/arm/cpu/built-in.o arch/arm/lib/built-in.o board/xilinx/zynq/built-in.o common/spl/built-in.o common/built-in.o disk/built-in.o drivers/mmc/built-in.o drivers/serial/built-in.o drivers/mtd/spi/built-in.o drivers/spi/built-in.o fs/built-in.o drivers/fpga/built-in.o lib/built-in.o --end-group arch/arm/lib/eabi_compat.o -L /opt/Xilinx/SDK/2014.4/gnu/arm/lin/bin/../lib/gcc/arm-xilinx-linux-gnueabi/4.8.3 -lgcc -Map u-boot-spl.map -o u-boot-spl)
