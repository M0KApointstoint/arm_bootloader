.global _start

.text
_start:
	mov r0, #8
	lsr r0, r0, #1 // r0 = r0 >> 1
	mov r1, #1
	lsr r0, r1, #1 // r0 = r1 >> 1; r1 = r1
	mov r0, r1

	mov r7, #1
	swi 0

