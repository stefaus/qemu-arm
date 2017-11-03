LSCRIPT = kernel.lds
OBJ = start.o led.o
CC = $(CROSS)gcc
LD = $(CROSS)ld
OBJCOPY = $(CROSS)objcopy
CROSS = arm-none-eabi-
CFLAGS = -Wall -Wextra -ffreestanding
CFLAGS += -mcpu=arm920t -O2
%.o: %.S
	$(CC) $(CFLAGS) -MMD -MP -o $@ -c $<
%.o: %.c
	$(CC) $(CFLAGS) -MMD -MP -o $@ -c $<
kernel: $(LSCRIPT) $(OBJ)
	$(LD) -T$(LSCRIPT) -o $@ $(OBJ) $(LIBGCC)
kernel.bin: kernel
	$(OBJCOPY) -Obinary --set-section-flags \
	.bss=contents,alloc,load,data $< $@
kernel.img: kernel.bin
	mkimage -A arm -T standalone -C none -a 0x20000000 -d $< $@
