.global _start

.section .text

_start:
	mov r0, #4

	add r1, r0, #3 // r1 = r0 + 3; r0 = r0

	mov r7, #1
	swi 0

