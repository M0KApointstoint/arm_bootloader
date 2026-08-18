.global _start

.text
_start:
	mov r1, #0xaa
	eor r0, r1, #0xd5 // r0 = r1 ^ 0xd5; r1 = 1r; Nicx

	mov r7, #1
	swi 0

