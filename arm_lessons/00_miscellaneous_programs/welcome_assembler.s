.global _start

.text
_start:
	mov r7, #4
	mov r0, #1
	ldr r1, =string
	ldr r2, =end_string
	sub r2, r2, r1
	swi 0

	mov r7, #1
	mov r0, #0
	swi 0

.section .rodata
string:
	.ascii "Welcome, Assembler!\n"
end_string:
	.byte 0

