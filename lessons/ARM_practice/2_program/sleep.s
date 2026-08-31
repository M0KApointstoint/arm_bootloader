.global _start

.text
_start:
	mov r7, #0xa2
	ldr r0, =struct_var
	ldr r1, =struct_var
	swi 0

	mov r7, #1
	mov r0, #0
	swi 0

.data
struct_var:
	.word 1, 0, 0, 0

// Very useful:
// grep -R "struct __kernel_timespec" /usr/include 2>/dev/null
// struct __kernel_timespec {
//    __kernel_time64_t       tv_sec;                 /* seconds */
//    long long               tv_nsec;                /* nanoseconds */
// };

