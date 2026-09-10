CC = arm-none-eabi-gcc
CFLAGS = -c -mcpu=cortex-m3 -mthumb -O0 -Wall -Werror -Wextra
LDFLAGS = -T src/linker.ld -nostdlib

BUILD_DIR = build
SRC = src/main.c

run: $(BUILD_DIR)/bootloader.elf
	qemu-system-arm -M lm3s6965evb -kernel $(BUILD_DIR)/bootloader.elf -nographic

$(BUILD_DIR)/bootloader.elf: $(BUILD_DIR)/main.o
	$(CC) $(LDFLAGS) $(BUILD_DIR)/main.o -o $(BUILD_DIR)/bootloader.elf

$(BUILD_DIR)/main.o: $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(BUILD_DIR)/main.o

