.section .rodata
	string: .ascii "Hello, World!\n"

.section .text
	.global _start

_start:
	mov r7, #4
	mov r0, #1
	ldr r1, =string
	mov r2, #14
	swi 0
	mov r7, #1
	mov r0, #0
	swi 0

