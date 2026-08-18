.global _start

.section .text

_start:
	mov r0, #3
	mov r1, #3

	subs r2, r0, r1 // Interact with CPSR register via 's' sufix.
	
	mov r7, #1
	swi 0

