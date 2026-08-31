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
	ldr r2, =end_string
	sub r2, r2, r1
	swi 0
	bx lr

.section .rodata
string:
	.ascii "Embedded incoming!\n"
end_string:
	.byte 0
n:
	.word 69

