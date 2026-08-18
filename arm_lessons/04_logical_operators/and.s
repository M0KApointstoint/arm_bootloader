.global _start

.text
_start:
	mov r0, #0xffffff00
	and r1, r0, #0x00ffffff // r1 = r0 & 0x00ffffff; r0 = r0

	mov r7, #1
	mov r0, r1
	swi 0

