ASM=nasm

SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/boot.bin: $(SRC_DIR)/boot.asm
	nasm -f bin $(SRC_DIR)/boot.asm -o $(BUILD_DIR)/boot.bin

