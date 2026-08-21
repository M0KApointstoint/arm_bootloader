.global _start

.text
_start:
	mov r0, #8
	lsl r0, r0, #1 // r0 = r0 << 1
	mov r1, #1
	lsl r0, r1, #1 // r0 = r1 << 1; r1 = r1

	mov r7, #1
	mov r0, r1
	swi 0

