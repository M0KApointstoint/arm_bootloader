ASM=nasm

SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/boot_floppy.img: $(BUILD_DIR)/boot.bin
	cp $(BUILD_DIR)/boot.bin $(BUILD_DIR)/boot_floppy.img
	truncate -s 1440k $(BUILD_DIR)/boot_floppy.img

$(BUILD_DIR)/boot.bin: $(SRC_DIR)/boot.asm
	nasm -f bin $(SRC_DIR)/boot.asm -o $(BUILD_DIR)/boot.bin

