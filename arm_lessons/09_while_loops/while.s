.global _start

.text
_start:
	mov r0, #0

loop_start:
	cmp r0, #5
	bge loop_end
	add r0, r0, #1
	b loop_start

loop_end:
	mov r7, #1
	swi 0

// Similar C code:

/*
	int i = 0;
	while (i < 5) {
		i++;
	}
*/

