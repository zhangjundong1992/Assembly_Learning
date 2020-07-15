;使用jne指令简化程序
assume cs:code,ds:data

data segment
	db 8,11,8,1,8,5,63,38
data ends

code segment
	start:
		mov ax,data
		mov ds,ax
		
		mov ax,0	;计数器
		mov bx,0	;data偏移地址
		mov dl,8	;用于比较的数值8
		
		mov cx,8
	s:
		cmp	[bx],dl
		jne next	;使用jne指令简化程序
		inc ax
	next:
		inc bx
		loop s
		
		mov ax,4c00h
		int 21h
code ends

end start	
		
		