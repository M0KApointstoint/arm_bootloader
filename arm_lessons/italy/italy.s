.global _start

.text
_start:
	mov r7, #4
	mov r0, #1
	ldr r1, =string1
	ldr r2, =string2
	sub r2, r2, r1
	swi 0

	// mov r7, #4
	mov r0, #1 // Careful on what registers are modified after system calls.
	// ldr r1, =string1
	ldr r2, =string2
	ldr r3, [r2]
	add r1, r1, #1
	str r3, [r1]
	sub r2, r2, r1
	swi 0

	mov r7, #1
	mov r0, #0
	swi 0

.data
string1:
	.ascii "Italy was amazing!\n"

string2:
	.ascii "Bari"

