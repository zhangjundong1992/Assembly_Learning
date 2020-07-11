;将自定义的0号中断处理程序写入内存
;并设置终端向量表
assume cs:code

code segment
	start:
		mov ax,code		;源地址
		mov ds,ax
		mov si,offset do0
		
		mov ax,0		;目的地址
		mov es,ax
		mov di,200h
				
		mov cx,offset do0end - offset do0	;传送字节数
		
		cld				;正向传送
		
		rep movsb
		
		mov ax,0		;设置中断向量
		mov es,ax
		mov word ptr es:[0],200h
		mov word ptr es:[2],0
		
		mov ax,4c00h
		int 21h
		
	do0:
		jmp short do0start
		db 'welcome to masm!'
	
	do0start:
		mov ax,0
		mov ds,ax
		mov si,202h
		
		mov ax,0b800h
		mov es,ax
		mov di,12*160+36*2
		
		mov cx,16
	s:
		mov al,[si]
		mov es:[di],al
		mov byte ptr es:[di+1],02h
		inc si
		add di,2
		loop s
		
		mov ax,4c00h
		int 21h
	do0end:
		nop
code ends

end start	