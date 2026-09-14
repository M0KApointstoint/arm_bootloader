#include <stdint.h>

#define SRAM_BASE 0x20000000u
#define SRAM_LENGTH (64u * 1024u)
#define STACK_TOP (SRAM_BASE + SRAM_LENGTH)

#define UART0_DR (*(volatile uint32_t *)0x4000c000u)

extern uint32_t _sidata;
extern uint32_t _sdata;
extern uint32_t _edata;
extern uint32_t _sbss;
extern uint32_t _ebss;

uint32_t data_var = 0xdeadbeee;
uint32_t bss_var;

void reset_handler(void);

__attribute__((section(".vector_table"))) uint32_t vector_table[] = {
	STACK_TOP,
	(uint32_t)reset_handler
};

void uart_putc(char c)
{
	UART0_DR = (uint32_t)c;
}

void uart_puts(const char *buf)
{
	while (*buf) {
		uart_putc(*buf);
		++buf;
	}
}

void uart_print_hex(uint32_t x)
{
	uart_puts("0x");
	uint32_t mask = 0xf0000000;
	uint32_t temp = 0;
	for (uint8_t i = 0; i < 8; ++i) {
		temp = x & mask;
		temp >>= 28;
		if (temp < 10) {
			temp += '0';
		} else {
			temp -= 10;
			temp += 'a';
		}
		uart_putc((char)temp);
		x <<= 4;
	}
}

void reset_handler(void)
{
	uart_puts("Booting...\n");
	
	uart_puts("Copying .data values from FLASH to SRAM...\n");
	uint32_t *src = &_sidata;
	uint32_t *dest = &_sdata;
	while (dest < &_edata) {
		*dest = *src;
		++dest;
		++src;
	}
	uart_puts("Done!\n");

	uart_puts("Zeroing .bss...\n");
	dest = &_sbss;
	while (dest < &_ebss) {
		*dest = 0x00000000;
		++dest;
	}
	uart_puts("Done!\n");

	uart_puts("Welcome, Assembler! Here is a nice number for you: ");
	++data_var;
	uart_print_hex(data_var);
	data_var++;
	uart_puts("\nFinish code: ");
	uart_print_hex(bss_var);
	uart_puts("\nHello, World!\n");

	while (1) {
	}
}

