################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/ethfmc_axie.c \
../src/platform.c \
../src/platform_mb.c \
../src/platform_ppc.c \
../src/platform_zynq.c \
../src/sfp.c \
../src/si5324.c \
../src/testperiph.c \
../src/xaxiethernet_example_intr_sgdma.c \
../src/xaxiethernet_example_util.c \
../src/xdevcfg_selftest_example.c \
../src/xdmaps_example_w_intr.c \
../src/xemacps_example_intr_dma.c \
../src/xemacps_example_util.c \
../src/xqspips_selftest_example.c \
../src/xscugic_tapp_example.c \
../src/xscutimer_intr_example.c \
../src/xscutimer_polled_example.c \
../src/xscuwdt_intr_example.c 

OBJS += \
./src/ethfmc_axie.o \
./src/platform.o \
./src/platform_mb.o \
./src/platform_ppc.o \
./src/platform_zynq.o \
./src/sfp.o \
./src/si5324.o \
./src/testperiph.o \
./src/xaxiethernet_example_intr_sgdma.o \
./src/xaxiethernet_example_util.o \
./src/xdevcfg_selftest_example.o \
./src/xdmaps_example_w_intr.o \
./src/xemacps_example_intr_dma.o \
./src/xemacps_example_util.o \
./src/xqspips_selftest_example.o \
./src/xscugic_tapp_example.o \
./src/xscutimer_intr_example.o \
./src/xscutimer_polled_example.o \
./src/xscuwdt_intr_example.o 

C_DEPS += \
./src/ethfmc_axie.d \
./src/platform.d \
./src/platform_mb.d \
./src/platform_ppc.d \
./src/platform_zynq.d \
./src/sfp.d \
./src/si5324.d \
./src/testperiph.d \
./src/xaxiethernet_example_intr_sgdma.d \
./src/xaxiethernet_example_util.d \
./src/xdevcfg_selftest_example.d \
./src/xdmaps_example_w_intr.d \
./src/xemacps_example_intr_dma.d \
./src/xemacps_example_util.d \
./src/xqspips_selftest_example.d \
./src/xscugic_tapp_example.d \
./src/xscutimer_intr_example.d \
./src/xscutimer_polled_example.d \
./src/xscuwdt_intr_example.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../zedboard_ethernet_test_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


