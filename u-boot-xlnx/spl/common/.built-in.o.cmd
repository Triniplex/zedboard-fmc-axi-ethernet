cmd_spl/common/built-in.o :=  arm-xilinx-linux-gnueabi-ld     -r -o spl/common/built-in.o spl/common/env_sf.o spl/common/cmd_nvedit.o spl/common/env_common.o spl/common/console.o spl/common/dlmalloc.o spl/common/image.o spl/common/image-fdt.o spl/common/image-fit.o spl/common/memsize.o spl/common/stdio.o 