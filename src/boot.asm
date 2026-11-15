bits 16
org 0x7c00

mov AH, 0x0E
mov AL, 'H'
int 0x10

jmp $

times 510-($-$$) db 0
dw 0xAA55
