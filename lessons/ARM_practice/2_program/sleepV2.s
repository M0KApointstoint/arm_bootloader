.global _start

.text
_start:
	ldr r0, =string_1
	mov r1, #string_1_len
	bl print

	mov r7, #162
	ldr r0, =struct_var
	mov r1, #0
	swi 0

	ldr r0, =string_2
	mov r1, #string_2_len
	bl print

	mov r7, #1
	mov r0, #0
	swi 0

print: // void print(char *fmt, int len); -> prints string fmt with length len.
	push {r4, r5} // Callee-saved registers.
	mov r4, r0
	mov r5, r1

	mov r7, #4
	mov r0, #1
	mov r1, r4
	mov r2, r5
	swi 0

	pop {r4, r5}

	bx lr

.section .rodata
string_1:
	.ascii "Hi!\n"

string_1_len = . - string_1

string_2:
	.ascii "Bye!\n"

string_2_len = . - string_2

.data
struct_var:
	.word 1, 0

// Very useful:
// man 2 nanosleep (1 -> shell, 2 -> syscalls, 3 -> libc)
// struct timespec {
//     __kernel_old_time_t     tv_sec;         /* seconds */
//     long                    tv_nsec;        /* nanoseconds */
// };

