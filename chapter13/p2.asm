;安装7ch的中断例程,求word型数据的平方
assume cs:code

code segment
	start:
		mov ax,code		;源地址
		mov ds,ax
		mov si,offset do7c
		
		mov ax,0		;目的地址
		mov es,ax
		mov di,200h
		
		mov cx,offset do7cend - offset do7c	;传送字符串长度
		
		cld		;正向传送
		
		rep movsb
		
		mov ax,0	;设置中断向量
		mov es,ax
		mov word ptr es:[7ch*4],0	
		mov word ptr es:[7ch*4+2],200h
		
		mov ax,4c00h
		int 21h
		
	do7c:
		mul ax
		iret
	do7cend:
		nop
code ends

end start