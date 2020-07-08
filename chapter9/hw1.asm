assume cs:code

code segment
		mov ax,4c00h	;s3
		int 21h
		
	start:
		mov ax,0
	s:	nop		;jmp short s3,赋值之后其实跳转到s3处，开始处
		nop		;因为短跳转是根据相对偏移跳转
		
		mov di,offset s
		mov si,offset s2
		mov ax,cs:[si]
		mov cs:[di],ax
	
	s0: jmp short s
	
	s1: mov ax,0
		int 21h
		mov ax,0
	
	s2:	jmp short s1
		nop
code ends

end start
		