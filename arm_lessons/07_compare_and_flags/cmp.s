.global _start

.text
_start:
	mov r0, #4
	mov r1, #5
	cmp r0, r1 // This modifies CPSR flags: N, Z, C, V.

	mov r7, #1
	mov r0, #0
	swi 0

// Should learn how condition flags are set in more depth.

