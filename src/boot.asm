bits 16
org 0x7c00

xor ax, ax
mov ds, ax

mov si, msg

print:
mov al, [si]
cmp al ,0
je end
mov ah, 0x0e
int 0x10
inc si
jmp print
end:

jmp $

msg: db "Hello, Ley!",0

times 510-($-$$) db 0
dw 0xAA55
