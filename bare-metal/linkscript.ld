ENTRY(_reset)

SECTIONS
{
	. = 0x0;
	.text : { better.o (.vector_table) * (.text) }
	. = ALIGN(8);
}

