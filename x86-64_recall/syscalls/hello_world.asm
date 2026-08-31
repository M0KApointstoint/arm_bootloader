global _start

section .text
_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, string
	mov rdx, end_string
	sub rdx, rsi
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

section .rodata
	string: db "Hello, World!", 10
	end_string: db 0

