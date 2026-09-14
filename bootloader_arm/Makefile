CC      = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy
QEMU    = qemu-system-arm

CFLAGS  = -mcpu=cortex-m3 -mthumb -O0 -Wall -Werror -Wextra
LDFLAGS = -nostdlib

BUILD_DIR = build

BOOT_SRC = src/main.c
BOOT_LD  = src/linker.ld

APP_SRC = app/main.c
APP_LD  = app/linker.ld

all: $(BUILD_DIR)/bootloader.elf $(BUILD_DIR)/app.bin

run: all
	$(QEMU) -M lm3s6965evb \
		-kernel $(BUILD_DIR)/bootloader.elf \
		-device loader,file=$(BUILD_DIR)/app.bin,addr=0x8000 \
		-nographic

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/main.o: $(BOOT_SRC) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/bootloader.elf: $(BUILD_DIR)/main.o $(BOOT_LD)
	$(CC) $(LDFLAGS) -T $(BOOT_LD) $< -o $@

$(BUILD_DIR)/app.o: $(APP_SRC) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/app.elf: $(BUILD_DIR)/app.o $(APP_LD)
	$(CC) $(LDFLAGS) -T $(APP_LD) $< -o $@

$(BUILD_DIR)/app.bin: $(BUILD_DIR)/app.elf
	$(OBJCOPY) -O binary $< $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all run clean

