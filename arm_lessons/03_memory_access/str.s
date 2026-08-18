.global _start

.text
_start:
	mov r0, #0x69
	ldr r1, =var1
	str r0, [r1] // What even happened to the nice syntax.

	mov r7, #1
	ldr r0, [r1]
	swi 0

.data
var1:
	.word 5

var2:
	.word 6

