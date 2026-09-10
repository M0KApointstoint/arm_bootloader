#include <stdint.h>

#define SRAM_BASE 0x20000000u
#define SRAM_LENGTH (64u * 1024u)
#define STACK_TOP (SRAM_BASE + SRAM_LENGTH)

#define UART0_DR (*(volatile uint32_t *)0x4000c000u)

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

void reset_handler(void)
{
	uart_puts("Hello, World!\n");
	while (1) {
	}
}

