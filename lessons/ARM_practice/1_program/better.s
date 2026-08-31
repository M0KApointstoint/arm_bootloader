.global _start

.text
_start:
	ldr r0, =n
	ldr r4, [r0] // Counter.

loop_start:
	cmp r4, #0
	ble loop_end
	bl print
	sub r4, r4, #1
	b loop_start

loop_end:
	mov r7, #1
	mov r0, #0
	swi 0

print: // void print(void) -> prints the string from rodata.
	mov r7, #4
	mov r0, #1
	ldr r1, =string
	mov r2, #string_len
	swi 0
	bx lr

.section .rodata
string:
	.ascii "Embedded incoming!\n"
string_len = . - string // Just a constant.
.align 2 // same as .balign 4 (2 ^ 2).
n:
	.word 69

