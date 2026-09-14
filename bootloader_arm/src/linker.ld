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
	} > FLASH

	.data :
	{
		_sdata = .;
		*(.data*)
		. = ALIGN(4);
		_edata = .;
	} > SRAM AT> FLASH

	_sidata = LOADADDR(.data);

	.bss :
	{
		_sbss = .;
		*(.bss*)
		*(COMMON)
		. = ALIGN(4);
		_ebss = .;
	} > SRAM
}

