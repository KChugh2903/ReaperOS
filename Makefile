OS = reaperos

ifndef arch
        arch = armv8-a
endif

include arch/$(arch)/config.mk

# tools
AR = arm-none-eabi-ar
AS = arm-none-eabi-as
CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
OBJDUMP = arm-none-eabi-objdump

# don't get pulseaudio related errors when qemu starts
export QEMU_AUDIO_DRV = none

# flags
CFLAGS = -mcpu=$(CPU) -gstabs -I include -I arch/$(arch)/include -marm \
         -std=c99 -pedantic -Wall -Wextra -msoft-float -fPIC -mapcs-frame \
         -fno-builtin-printf -fno-builtin-strcpy -Wno-overlength-strings \
         -fno-builtin-exit
ASFLAGS = -mcpu=$(CPU) -g -I include -I arch/$(arch)/include
QEMU_FLAGS = $(ARCH_QEMU_FLAGS) -nographic

all: $(OS).bin

OBJS = kernel/startup.o

include kernel/build.mk
include lib/build.mk
include arch/$(arch)/build.mk
include usr/build.mk

$(OS).bin: $(OBJS) $(OS).ld lib/libreaperos.a
	$(LD) -L arch/$(arch) -T $(OS).ld $(OBJS) lib/libreaperos.a -o $(OS).elf
	$(OBJCOPY) -O binary $(OS).elf $(OS).bin
	$(OBJDUMP) -D $(OS).elf > $(OS).asm
ifeq ($(arch),armv8-a)
	cp reaperos.bin /run/media/hadi/boot/kernel.img
endif

qemu: $(OS).bin 
	qemu-system-arm $(QEMU_FLAGS) -kernel $(OS).bin

qemu-gdb: $(OS).bin
	qemu-system-arm $(QEMU_FLAGS) -gdb tcp::26000 -S -kernel $(OS).bin

clean:
	rm -f $(OBJS) $(EXTRA_CLEAN)
	rm -f $(OS).elf $(OS).bin $(OS).asm