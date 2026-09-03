org 0x7c00
bits 16

halt:
	mov ax, 0x1337 ; Testing.
	mov bx, 0xbeef
	jmp halt
	mov bx, 0x0000

times 510 - ($ - $$) db 0
dw 0xaa55

