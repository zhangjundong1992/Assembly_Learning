assume cs:codesg

codesg segment

start:	mov ax,2
		mov cx,11
s:		add ax,ax
		loop s
		
		mov ax,4c00H
		int 21H
		
codesg ends

end start