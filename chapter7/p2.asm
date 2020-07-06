assume cs:code,ds:data

data segment
	db 'wlecome to masm!'
	db '0123456789abcdef'
data segment

code segment
	start:
		mov ax,data
		mov ds,ax
		
		mov si,0
		mov di,16
		mov bx,0
		
		mov cx,16
	s: 	mov al,[si+bx]
		mov [di+bx],al
		inc bx
		loop s
		
		mov ax,4c00h
		int 21h
code ends

end start