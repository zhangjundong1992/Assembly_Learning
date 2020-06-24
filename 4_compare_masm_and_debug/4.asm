assume cs:codesg

codesg segment

start:	mov ax,2000H
		mov ds,ax
		mov al,[0]
		mov bl,[1]
		mov cl,[3]
		mov dl,[4]
		
		mov ax,4c00H
		int 21H
		
codesg ends

end start