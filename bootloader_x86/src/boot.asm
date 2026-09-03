org 0x7c00
bits 16

_start:
	xor ax, ax
	mov es, ax

	mov ah, 0x13
	mov al, 0x01
	mov bh, 0x00
	mov bl, 0xa1
	mov cx, 13
	mov dh, 0x10
	mov dl, 0x10
	mov bp, string
	int 0x10

halt:
	jmp halt

string: db "Hello, World!"

times 510 - ($ - $$) db 0
dw 0xaa55

