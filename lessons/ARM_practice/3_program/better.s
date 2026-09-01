.global _start

.text
_start:
	ldr r0, =string
	bl len
	mov r4, r0
	ldr r0, =string
	mov r1, r4
	bl print
	ldr r0, =buf
	ldr r1, =string
	bl reverse
	ldr r0, =buf
	bl len
	mov r1, r0
	ldr r0, =buf
	bl print

	mov r7, #1
	mov r0, #0
	swi 0

len: @ int len(char *buf); -> returns length of buffer buf that ends with 0.
	mov r1, r0
	mov r0, #0
	ldrb r2, [r1] @ ldr with one byte from that address.

loop1_start:
	cmp r2, #0
	beq loop1_end
	add r0, r0, #1
	add r1, r1, #1
	ldrb r2, [r1]
	b loop1_start

loop1_end:
	bx lr

print: @ void print(char *buf, int len); -> prints buffer buf with length len.
	push {r7, lr}

	mov r7, #4
	mov r2, r1
	mov r1, r0
	mov r0, #1
	swi 0

	pop {r7, lr}
	bx lr

reverse: @ void reverse(char *dst, char *src); -> stores reversed src in dst.
	push {r4, r5, r6, lr}
	mov r4, r0
	mov r5, r1

	mov r0, r5
	bl len
	add r5, r5, r0

loop2_start:
	cmp r0, #0
	beq loop2_end
	sub r5, r5, #1
	sub r0, r0, #1
	ldrb r1, [r5]
	strb r1, [r4] @ str with one byte at that address.
	add r4, r4, #1
	b loop2_start

loop2_end:
	pop {r4, r5, r6, lr}
	bx lr

.section .rodata
string:
	.ascii "\nARM assembly all the way!\n"
	.byte 0

.bss
buf:
	.space 32 @ reserves 32 zeroed bytes.

