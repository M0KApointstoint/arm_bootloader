.global _start

.text
_start:
	mov r1, #0xffffffff
	mvn r0, r1 // r0 = ~r1; r1 = r1; Move and negate.

	mov r7, #1
	swi 0

