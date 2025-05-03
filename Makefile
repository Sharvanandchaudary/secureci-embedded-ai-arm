# Target and Toolchain
TARGET = firmware
CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy

# Flags
CFLAGS = -mcpu=cortex-m4 -mthumb -Wall -O2 -g -fno-unwind-tables -fno-asynchronous-unwind-tables

LDFLAGS = -T linker_script.ld -nostartfiles

# Source and Output
SRC = src/main.c src/sensors.c src/syscalls.c src/startup.c

OBJ = $(SRC:.c=.o)
INCLUDES = -Iinclude
OUTDIR = build

# Rules
all: $(OUTDIR)/$(TARGET).elf $(OUTDIR)/$(TARGET).hex

$(OUTDIR)/$(TARGET).elf: $(SRC)
	@mkdir -p $(OUTDIR)
	$(CC) $(CFLAGS) $(INCLUDES) $(LDFLAGS) -o $@ $^

$(OUTDIR)/$(TARGET).hex: $(OUTDIR)/$(TARGET).elf
	$(OBJCOPY) -O ihex $< $@

clean:
	rm -rf $(OUTDIR)/*.elf $(OUTDIR)/*.hex
