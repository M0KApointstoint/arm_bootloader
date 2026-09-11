MEMORY
{
	FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 256k
	SRAM (rw)  : ORIGIN = 0x20000000, LENGTH = 64k
}

SECTIONS
{
	.text :
	{
		KEEP(*(.vector_table))
		*(.text*)
		*(.rodata*)
		_etext = .;
	} > FLASH

	.data :
	{
		_sdata = .;
		*(.data*)
		_edata = .;
	} > SRAM AT> FLASH

	.bss :
	{
		_sbss = .;
		*(.bss*)
		*(COMMON)
		_ebss = .;
	} > SRAM
}

