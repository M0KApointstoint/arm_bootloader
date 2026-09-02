.section .vector_table, "x"
.global _reset
_reset:
b reset_handler
b . /* 0x4 Undefined Instruction */
b . /* 0x8 Software Interrupt */
b . /* 0xC Prefetch Abort */
b . /* 0x10 Data Abort */
b . /* 0x14 Reserved */
b . /* 0x18 IRQ */
b . /* 0x1C FIQ */

.section .text
reset_handler:
ldr r2, str1
b .
str1: .word 0xdeadbeef

