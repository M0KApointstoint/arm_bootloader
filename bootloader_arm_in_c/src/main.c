#include <stdint.h>

#define SRAM_BASE 0x20000000u
#define SRAM_LENGTH (64u * 1024u)
#define STACK_TOP (SRAM_BASE + SRAM_LENGTH)

void reset_handler(void);

__attribute__((section(".vector_table"))) uint32_t vector_table[] = {
	STACK_TOP,
	(uint32_t)reset_handler
};

void reset_handler(void)
{
	while (1) {
	}
}

