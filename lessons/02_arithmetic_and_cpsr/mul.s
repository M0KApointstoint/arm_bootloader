.global _start

.section .text

_start:
	mov r0, #4
	mov r2, #2

	mul r1, r0, r2 // r1 = r0 * r2; r0 = r0; r2 = r2

	mov r7, #1
	mov r0, r1
	swi 0

