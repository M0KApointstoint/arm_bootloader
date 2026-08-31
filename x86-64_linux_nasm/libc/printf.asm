global main
extern printf

section .text
main:
	push rbp
	mov rbp, rsp
	
	mov rdi, string
	mov esi, [age]
	xor eax, eax    ; 0 xmm registers used.
	call printf

	leave           ; Equivalent to: mov rsp, rbp; pop rbp
	ret             ; Conceptually: pop rip

section .rodata
	string: db "Hello, assembler! I am %d years old.", 10, 0
	age: dd 19

