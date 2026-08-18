.global _start

.text
_start:
	ldr r0, =var1 // How could you not love x86 sometimes.

	ldr r0, =var2
	ldr r1, [r0] // Dereference.

	mov r7, #1
	mov r0, r1
	swi 0

.data // Use readelf -x .data a.out
var1:
	.word 0x12345678 // On ARM, a word is four bytes.

var2:
	.word 0x00000006

