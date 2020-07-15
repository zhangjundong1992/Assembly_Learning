assume cs:code,ds:data

data segment
	db 'welcome to masm!'
data ends

code segment
	start:
		mov ax,data
		mov ds,ax
		mov ax,0b872h
		mov es,ax
		mov di,0
		mov bx,0
		
		mov cx,16
	s:	mov al,[bx]
		mov es:[di],al
		mov al,00000010b
		mov es:[di+1],al
		inc bx
		add di,2
		loop s

		mov ax,4c00h
		int 21h
code ends

end start