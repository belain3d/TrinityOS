mov ah, 0x0e

mov al, "H"
int 0x10
mov al, "a"
int 0x10
mov al, "l"
int 0x10
mov al, "i"
int 0x10
mov al, "!"
int 0x10

jmp $

times 510-($-$$) db 0

dw 0xAA55
