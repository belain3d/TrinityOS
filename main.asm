[org 0x7c00]

mov si, STR_0
call printf

mov si, STR_1
call printf

mov si, STR_2
call printf

jmp $

printf:
	pusha
	str_loop:
		mov al, [si]
		cmp al, 0
		jne print_char
		popa
		ret		

	print_char:
		mov ah, 0x0e
		int 0x10
		add si, 1
		jmp str_loop	

STR_0: db "Hiya World!", 0x0a, 0x0d, 0
STR_1: db "What you see here is a boot sector. And some text by me.", 0x0a, 0x0d, 0
STR_2: db "Over for now!", 0



times 510-($-$$) db 0
dw 0xAA55

times 512 db 0
