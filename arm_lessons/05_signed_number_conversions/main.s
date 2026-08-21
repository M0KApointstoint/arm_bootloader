.global _start

.text
_start:
	mov r7, #4
	mov r0, #1
	ldr r1, =string
	ldr r2, =string_end
	sub r2, r2, r1
	swi 0

	mov r7, #1
	mov r0, #-1
	swi 0

.section .rodata
string:
	.ascii "255 bro\n"
string_end:
	.byte 0

// Also, maybe I should finally learn a fast method to go from negative to positive in binary.

