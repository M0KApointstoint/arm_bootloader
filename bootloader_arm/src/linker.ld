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
	} > FLASH
}

