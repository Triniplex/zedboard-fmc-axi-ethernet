CONFIG_SPI_FLASH_WINBOND=y
CONFIG_SYS_MMCSD_FS_BOOT_PARTITION=y
CONFIG_CMD_FPGA_LOADFS=y
CONFIG_SYS_SPI_U_BOOT_OFFS=0x100000
CONFIG_CMD_FAT=y
CONFIG_CMD_FPGA_LOADP=y
CONFIG_SPL_FPGA_SUPPORT=y
CONFIG_CMD_ITEST=y
CONFIG_CMD_FPGA_LOADMK=y
CONFIG_BOOTM_VXWORKS=y
CONFIG_CMD_EDITENV=y
CONFIG_SYS_ENET=y
CONFIG_USB_ULPI_VIEWPORT=y
CONFIG_SYS_LONGHELP=y
CONFIG_SYS_GENERIC_BOARD=y
CONFIG_SYS_LOAD_ADDR=0
CONFIG_DISPLAY_BOARDINFO=y
CONFIG_CMD_XIMG=y
CONFIG_CMD_CACHE=y
CONFIG_BOOTDELAY=3
CONFIG_SYS_FLASH_SIZE="(16 * 1024 * 1024)"
CONFIG_SPI_FLASH=y
CONFIG_SYS_HELP_CMD_WIDTH=8
CONFIG_NR_DRAM_BANKS=y
CONFIG_FS_FAT=y
CONFIG_SPL_STACK_SIZE=0x1000
CONFIG_BOOTM_RTEMS=y
CONFIG_SYS_CBSIZE=2048
CONFIG_SDHCI=y
CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x300
CONFIG_BOOTM_LINUX=y
CONFIG_BOARD_LATE_INIT=y
CONFIG_CMD_CONSOLE=y
CONFIG_SYS_LDSCRIPT="arch/arm/cpu/armv7/zynq/u-boot.lds"
CONFIG_MII=y
CONFIG_SPL_BOARD_INIT=y
CONFIG_SYS_CACHELINE_SIZE=32
CONFIG_MMC=y
CONFIG_THOR_RESET_OFF=y
CONFIG_SYS_SPL_MALLOC_SIZE=0x1000
CONFIG_SYS_SPL_ARGS_ADDR=0x10000000
CONFIG_SPL_OS_BOOT=y
CONFIG_CMD_MISC=y
CONFIG_SPL_FPGA_LOAD_ADDR=0x1000000
CONFIG_FIT=y
CONFIG_SPL_LIBCOMMON_SUPPORT=y
CONFIG_ENV_OFFSET=0xE0000
CONFIG_USB_MAX_CONTROLLER_COUNT=2
CONFIG_ENV_OVERWRITE=y
CONFIG_CMD_NET=y
CONFIG_ZYNQ_GEM0=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_ZYNQ_SERIAL_UART1=y
CONFIG_ENV_SIZE="(128 << 10)"
CONFIG_CMD_CLK=y
CONFIG_G_DNL_VENDOR_NUM=0x03FD
CONFIG_CMD_FS_GENERIC=y
CONFIG_ZYNQ_EEPROM=y
CONFIG_SYS_MALLOC_LEN=0xC00000
CONFIG_SPL_LIBDISK_SUPPORT=y
CONFIG_SPI_FLASH_SPANSION=y
CONFIG_SYS_BOOTM_LEN="(60 * 1024 * 1024)"
CONFIG_SYS_TEXT_BASE=0x4000000
CONFIG_CMD_FLASH=y
CONFIG_SPL_FS_LOAD_ARGS_NAME="system.dtb"
CONFIG_CMD_SAVEENV=y
CONFIG_USB_ULPI=y
CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTOR=0
CONFIG_ENV_SECT_SIZE=$(CONFIG_ENV_SIZE)
CONFIG_SYS_EEPROM_PAGE_WRITE_BITS=4
CONFIG_BOOTM_PLAN9=y
CONFIG_SYS_U_BOOT_MAX_SIZE_SECTORS=0x200
CONFIG_SPL_TEXT_BASE=0x0
CONFIG_ZYNQ_M29EW_WB_HACK=y
CONFIG_SPI_FLASH_BAR=y
CONFIG_ENV_ADDR="(CONFIG_SYS_FLASH_BASE + CONFIG_ENV_OFFSET)"
CONFIG_FPGA_ZYNQPL=y
CONFIG_CMD_MEMORY=y
CONFIG_SYS_MAXARGS=32
CONFIG_CMD_RUN=y
CONFIG_IPADDR="172.16.2.68"
CONFIG_SYS_PBSIZE="(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)"
CONFIG_DISPLAY_BOARDINFO_LATE=y
CONFIG_BOARDDIR="board/xilinx/zynq"
CONFIG_SPI_FLASH_STMICRO=y
CONFIG_OF_LIBFDT=y
CONFIG_SPL_STACK="(OCM_HIGH_ADDR + CONFIG_SPL_STACK_SIZE)"
CONFIG_SUPPORT_VFAT=y
CONFIG_PHY_MARVELL=y
CONFIG_PHYLIB=y
CONFIG_FPGA_XILINX=y
CONFIG_CMDLINE_EDITING=y
CONFIG_CMD_USB=y
CONFIG_FLASH_CFI_DRIVER=y
CONFIG_CMD_EXT2=y
CONFIG_CMD_EXT4=y
CONFIG_USB_EHCI=y
CONFIG_BOOTCOMMAND="run $modeboot"
CONFIG_SPL_MAX_FOOTPRINT=0x30000
CONFIG_CPU_FREQ_HZ=800000000
CONFIG_CMD_SETGETDCR=y
CONFIG_SYS_L2CACHE_OFF=y
CONFIG_CMD_EEPROM=y
CONFIG_CMD_DFU=y
CONFIG_G_DNL_PRODUCT_NUM=0x0300
CONFIG_ZLIB=y
CONFIG_USB_GADGET_DUALSPEED=y
CONFIG_G_DNL_MANUFACTURER="Xilinx"
CONFIG_SYS_FLASH_WRITE_TOUT=5000
CONFIG_CMD_BOOTD=y
CONFIG_SPL_SPI_FLASH_SUPPORT=y
CONFIG_CMD_BOOTZ=y
CONFIG_NET_MULTI=y
CONFIG_SYS_I2C_ZYNQ=y
CONFIG_BOOTP_MAY_FAIL=y
CONFIG_AUTO_COMPLETE=y
CONFIG_SYS_I2C_ZYNQ_SLAVE=0
CONFIG_ZYNQ_GEM_PHY_ADDR0=7
CONFIG_DOS_PARTITION=y
CONFIG_GZIP=y
CONFIG_DFU_MMC=y
CONFIG_SYS_DFU_DATA_BUF_SIZE=0x600000
CONFIG_USB_EHCI_ZYNQ=y
CONFIG_SYS_MMCSD_RAW_MODE_ARGS_SECTORS=0
CONFIG_CMD_SF=y
CONFIG_SYS_EEPROM_PAGE_WRITE_DELAY_MS=5
CONFIG_CMD_FPGA=y
CONFIG_SYS_INIT_RAM_SIZE=0x1000
CONFIG_ZYNQ_USB=y
CONFIG_SYS_SPI_ARGS_OFFS=0
CONFIG_SYS_I2C_MUX_ADDR=0x74
CONFIG_SYS_BAUDRATE_TABLE="{300, 600, 1200, 2400, 4800, 9600, 19200, 38400, 57600, 115200, 230400}"
CONFIG_SF_DUAL_FLASH=y
CONFIG_SPL_LIBGENERIC_SUPPORT=y
CONFIG_SYS_DCACHE_OFF=y
CONFIG_SYS_HUSH_PARSER=y
CONFIG_SPL_MMC_SUPPORT=y
CONFIG_ENV_IS_IN_FLASH=y
CONFIG_SYS_SDRAM_BASE=0
CONFIG_IMAGE_FORMAT_LEGACY=y
CONFIG_SYS_BOOT_RAMDISK_HIGH=y
CONFIG_SPL_LDSCRIPT="arch/arm/cpu/armv7/zynq/u-boot-spl.lds"
CONFIG_CMD_SPI=y
CONFIG_CMD_SPL=y
CONFIG_ZYNQ_QSPI=y
CONFIG_SPL_SERIAL_SUPPORT=y
CONFIG_CMD_ECHO=y
CONFIG_GENERIC_MMC=y
CONFIG_SPL_SPI_LOAD=y
CONFIG_SYS_SPL_MALLOC_START="(CONFIG_SPL_STACK + GENERATED_GBL_DATA_SIZE)"
CONFIG_USBDOWNLOAD_GADGET=y
CONFIG_FAT_WRITE=y
CONFIG_SYS_I2C=y
CONFIG_SYS_INIT_RAM_ADDR=0xFFFF0000
CONFIG_ZYNQ_GEM=y
CONFIG_ZYNQ_SDHCI0=y
CONFIG_SPL_BSS_MAX_SIZE=0x100000
CONFIG_SPL_FS_LOAD_KERNEL_NAME="uImage"
CONFIG_CI_UDC=y
CONFIG_SPI_FLASH_ISSI=y
CONFIG_SPL_BSS_START_ADDR=0x100000
CONFIG_SPL_PAD_TO=$(CONFIG_SPL_MAX_SIZE)
CONFIG_ZYNQ_I2C0=y
CONFIG_EXTRA_ENV_SETTINGS=""ethaddr=00:0a:35:00:01:220kernel_image=uImage0kernel_load_address=0x20800000ramdisk_image=uramdisk.image.gz0ramdisk_load_address=0x40000000devicetree_image=devicetree.dtb0devicetree_load_address=0x20000000bitstream_image=system.bit.bin0boot_image=BOOT.bin0loadbit_addr=0x1000000loadbootenv_addr=0x20000000kernel_size=0x5000000devicetree_size=0x200000ramdisk_size=0x5E00000boot_size=0xF000000fdt_high=0x200000000initrd_high=0x200000000bootenv=uEnv.txt0loadbootenv=load mmc 0 ${loadbootenv_addr} ${bootenv}0importbootenv=echo Importing environment from SD ...; env import -t ${loadbootenv_addr} $filesize0mmc_loadbit=echo Loading bitstream from SD/MMC/eMMC to RAM.. && mmcinfo && load mmc 0 ${loadbit_addr} ${bitstream_image} && fpga load 0 ${loadbit_addr} ${filesize}0norboot=echo Copying Linux from NOR flash to RAM... && cp.b 0xE2100000 ${kernel_load_address} ${kernel_size} && cp.b 0xE2600000 ${devicetree_load_address} ${devicetree_size} && echo Copying ramdisk... && cp.b 0xE2620000 ${ramdisk_load_address} ${ramdisk_size} && bootm ${kernel_load_address} ${ramdisk_load_address} ${devicetree_load_address}0qspiboot=echo Copying Linux from QSPI flash to RAM... && sf probe 0 0 0 && sf read ${kernel_load_address} 0x100000 ${kernel_size} && sf read ${devicetree_load_address} 0x600000 ${devicetree_size} && echo Copying ramdisk... && sf read ${ramdisk_load_address} 0x620000 ${ramdisk_size} && bootm ${kernel_load_address} ${ramdisk_load_address} ${devicetree_load_address}0uenvboot=if run loadbootenv; then echo Loaded environment from ${bootenv}; run importbootenv; fi; if test -n $uenvcmd; then echo Running uenvcmd ...; run uenvcmd; fi0sdboot=if mmcinfo; then run uenvboot; echo Copying Linux from SD to RAM... && load mmc 0 ${kernel_load_address} ${kernel_image} && load mmc 0 ${devicetree_load_address} ${devicetree_image} && load mmc 0 ${ramdisk_load_address} ${ramdisk_image} && bootm ${kernel_load_address} ${ramdisk_load_address} ${devicetree_load_address}; fi0usbboot=if usb start; then run uenvboot; echo Copying Linux from USB to RAM... && load usb 0 ${kernel_load_address} ${kernel_image} && load usb 0 ${devicetree_load_address} ${devicetree_image} && load usb 0 ${ramdisk_load_address} ${ramdisk_image} && bootm ${kernel_load_address} ${ramdisk_load_address} ${devicetree_load_address}; fi0nandboot=echo Copying Linux from NAND flash to RAM... && nand read ${kernel_load_address} 0x100000 ${kernel_size} && nand read ${devicetree_load_address} 0x600000 ${devicetree_size} && echo Copying ramdisk... && nand read ${ramdisk_load_address} 0x620000 ${ramdisk_size} && bootm ${kernel_load_address} ${ramdisk_load_address} ${devicetree_load_address}0jtagboot=echo TFTPing Linux to RAM... && tftpboot ${kernel_load_address} ${kernel_image} && tftpboot ${devicetree_load_address} ${devicetree_image} && bootm ${kernel_load_address} - ${devicetree_load_address}0rsa_norboot=echo Copying Image from NOR flash to RAM... && cp.b 0xE2100000 0x100000 ${boot_size} && zynqrsa 0x100000 && bootm ${kernel_load_address} ${ramdisk_load_address} ${devicetree_load_address}0rsa_nandboot=echo Copying Image from NAND flash to RAM... && nand read 0x100000 0x0 ${boot_size} && zynqrsa 0x100000 && bootm ${kernel_load_address} ${ramdisk_load_address} ${devicetree_load_address}0rsa_qspiboot=echo Copying Image from QSPI flash to RAM... && sf probe 0 0 0 && sf read 0x100000 0x0 ${boot_size} && zynqrsa 0x100000 && bootm ${kernel_load_address} ${ramdisk_load_address} ${devicetree_load_address}0rsa_sdboot=echo Copying Image from SD to RAM... && load mmc 0 0x100000 ${boot_image} && zynqrsa 0x100000 && bootm ${kernel_load_address} ${ramdisk_load_address} ${devicetree_load_address}0rsa_jtagboot=echo TFTPing Image to RAM... && tftpboot 0x100000 ${boot_image} && zynqrsa 0x100000 && bootm ${kernel_load_address} ${ramdisk_load_address} ${devicetree_load_address}0" DFU_ALT_INFO"
CONFIG_SYS_INIT_SP_ADDR="(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_RAM_SIZE - GENERATED_GBL_DATA_SIZE)"
CONFIG_BAUDRATE=115200
CONFIG_SYS_I2C_EEPROM_ADDR_LEN=y
CONFIG_USB_CABLE_CHECK=y
CONFIG_SYS_UBOOT_START=$(CONFIG_SYS_TEXT_BASE)
CONFIG_SYS_FLASH_CFI=y
CONFIG_PARTITIONS=y
CONFIG_SYS_MEMTEST_END="(CONFIG_SYS_SDRAM_BASE + 0x1000)"
CONFIG_CMD_I2C=y
CONFIG_FIT_VERBOSE=y
CONFIG_ZYNQ_SERIAL=y
CONFIG_SYS_DEF_EEPROM_ADDR=$(CONFIG_SYS_I2C_EEPROM_ADDR)
CONFIG_FS_EXT4=y
CONFIG_ZYNQ_GEM_EMIO0=0
CONFIG_ZYNQ_GEM_EMIO1=0
CONFIG_SYS_FLASH_BASE=0xE2000000
CONFIG_SPL_MAX_SIZE=0x30000
CONFIG_SPL_FRAMEWORK=y
CONFIG_SYS_SPI_KERNEL_OFFS=0
CONFIG_SYS_MAX_FLASH_BANKS=y
CONFIG_CMD_IMLS=y
CONFIG_CMD_SOURCE=y
CONFIG_SYS_PROMPT="zynq-uboot> "
CONFIG_USB_STORAGE=y
CONFIG_CLOCKS=y
CONFIG_SYS_FLASH_USE_BUFFER_WRITE=y
CONFIG_DFU_RAM=y
CONFIG_EXT4_WRITE=y
CONFIG_SPL_FAT_SUPPORT=y
CONFIG_SYS_FAULT_ECHO_LINK_DOWN=y
CONFIG_SYS_I2C_EEPROM_ADDR=0x54
CONFIG_SYS_MEMTEST_START=$(CONFIG_SYS_SDRAM_BASE)
CONFIG_CMD_LOADB=y
CONFIG_CMD_LOADS=y
CONFIG_CMD_IMI=y
CONFIG_CMD_EXT4_WRITE=y
CONFIG_SF_DEFAULT_SPEED=30000000
CONFIG_LMB=y
CONFIG_SYS_SPI_ARGS_SIZE=0
CONFIG_SYS_SDRAM_SIZE="(1024 * 1024 * 1024)"
CONFIG_SYS_MAX_FLASH_SECT=512
CONFIG_CMD_BDI=y
CONFIG_SERVERIP="172.16.2.251"
CONFIG_SYS_MMCSD_RAW_MODE_KERNEL_SECTOR=0
CONFIG_FLASH_SHOW_PROGRESS=10
CONFIG_SYS_I2C_MUX_EEPROM_SEL=0x4
CONFIG_EHCI_IS_TDI=y
CONFIG_BOOTSTAGE_USER_COUNT=20
CONFIG_ZYNQ_SDHCI=y
CONFIG_CMD_MII=y
CONFIG_USB_GADGET=y
CONFIG_DFU_FUNCTION=y
CONFIG_SYS_FLASH_ERASE_TOUT=1000
CONFIG_SYS_EEPROM_SIZE=1024
CONFIG_SYS_I2C_ZYNQ_SPEED=100000
CONFIG_CMD_MMC=y
CONFIG_SPL_SPI_SUPPORT=y
CONFIG_CMD_FPGA_LOADBP=y
CONFIG_SPL_FPGA_LOAD_ARGS_NAME="fpga.bin"
CONFIG_CMD_THOR_DOWNLOAD=y
CONFIG_THOR_FUNCTION=y
CONFIG_SPL_FS_LOAD_PAYLOAD_NAME="u-boot-dtb.img"
