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
				

STR_0: db "Loading in 16-bit Real Mode to memory location 0x7c00", 0x0a, 0x0d, 0
STR_1: db "These messages use the BIOS interrupt 0x10 with the ah register set to 0x0e", 0x0a, 0x0d, 0
STR_2: db "TrinityOS test booting was successful.", 0x0a, 0x0d, 0

times 510-($-$$) db 0
dw 0xAA55
