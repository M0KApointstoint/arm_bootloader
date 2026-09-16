.global _start

.text
_start:
	mov r0, #1
	mov r1, #2
	mov r2, #3
	mov r3, #4
	mov r4, #5
	mov r5, #6
	push {r4, r5} @ Same as: sub sp, sp, #8; str r4, [sp]; str r5, [sp, #4]
	bl add_6
	pop {r4, r5}

	mov r7, #1
	swi 0

add_6: @ int add_6(int a, int b, int c, int d, int e, int f);
	add r0, r0, r1
	add r0, r0, r2
	add r0, r0, r3
	ldr r1, [sp] @ r1 = 5
	add r0, r0, r1
	ldr r1, [sp, #4] @ r1 = 6
	add r0, r0, r1
	bx lr

