assume cs:code

code segment
	s:	mov ax,bx
		mov si,offset s		;offset指令取得标号s的偏移地址
		mov di,offset s1
		mov ax,cs:[si]
		mov cs:[di],ax
	
	s1:	nop		;nop占一个字节
		nop
		
		mov ax,4c00h
		int 21h
code ends

end