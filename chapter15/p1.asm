;将a-z写入显存
assume cs:code

code segment
	start:
		mov ax,0b800h
		mov es,ax
		mov ah,'a'
	s:
		mov es:[12*160+40*2],ah
		inc ah
		cmp ah,'z'
		jna s
		
		mov ax,4c00h
		int 21h
code ends

end start