# Target and Toolchain
TARGET = firmware
CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy

# Flags
CFLAGS = -mcpu=cortex-m3 -mthumb -Wall -O0 -g -Iinclude
LDFLAGS = -T linker_script.ld -specs=rdimon.specs -lc -lrdimon

# Source and Output
SRC = src/main.c src/sensors.c
OUTDIR = build

# Rules
all: $(OUTDIR)/$(TARGET).elf $(OUTDIR)/$(TARGET).hex

$(OUTDIR)/$(TARGET).elf: $(SRC)
	@mkdir -p $(OUTDIR)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

$(OUTDIR)/$(TARGET).hex: $(OUTDIR)/$(TARGET).elf
	$(OBJCOPY) -O ihex $< $@

clean:
	@rm -rf $(OUTDIR)
