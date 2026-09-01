.global _start

.text
_start:
	mov r4, #9

loop1_start:
	mov r0, r4
	bl print_digit
	bl sleep1
	cmp r4, #0
	ble loop1_end
	sub r4, r4, #1
	b loop1_start

loop1_end:
	mov r7, #1
	mov r0, #0
	swi 0

print_digit: @ void print_digit(int n); -> prints digit n to stdout.
	push {r7, lr}

	add r0, r0, #'0'
	ldr r1, =buf
	strb r0, [r1]
	mov r7, #4
	mov r0, #1
	mov r2, #2
	swi 0

	pop {r7, lr}
	bx lr

sleep1: @ void sleep1(void); -> Sleeps for one second.
	push {r7, lr}

	mov r7, #162
	ldr r0, =struct_var
	mov r1, #0
	swi 0

	pop {r7, lr}
	bx lr

.data
buf:
	.byte 0, 10

.balign 4
struct_var:
	.word 1, 0

