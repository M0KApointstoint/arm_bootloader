MEMORY
{
	FLASH (rx) : ORIGIN = 0x00008000, LENGTH = 224k
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
}

