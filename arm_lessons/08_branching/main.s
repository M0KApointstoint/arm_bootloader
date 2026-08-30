.global _start

.text
_start:
	mov r0, #4
	mov r1, #5

	cmp r0, r1
	beq cond2 // JUMP! (x86 all the way).

	mov r7, #1

cond1:
	mov r7, #4
	mov r0, #1
	ldr r1, =string
	ldr r2, =end_string
	sub r2, r2, r1
	swi 0
	mov r0, #0
	b exit // bal also works.

cond2:
	mov r0, #1

exit:
	mov r7, #1
	swi 0

.data
string:
	.ascii "This gets printed.\n"

end_string:
	.byte 0

