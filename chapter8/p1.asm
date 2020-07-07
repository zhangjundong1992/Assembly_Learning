;除法指令div
assume cs:code

code segment
	start:
		mov dx,1h
		mov ax,86a1h
		mov bx,100	;除数16位，被除数32位
		div bx
		
		mov ax,1001
		mov bl,100	;除数8位，被除数16位
		div bl
		
		mov ax,4c00h
		int 21h
code ends

end start