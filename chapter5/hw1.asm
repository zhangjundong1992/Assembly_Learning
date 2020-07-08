assume cs:code

code segment
	mov ax,0
	mov ds,ax
	mov bx,200h
	mov al,0
	
	mov cx,64
s:	mov [bx],al
	inc bx
	inc al
	loop s
	
	mov ax,4c00h
	int 21h
code ends

end