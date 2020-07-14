;在a-z的字符显示之间插入一段时间
assume cs:code

stack segment
	db 128 dup (0)
stack ends

code segment	
	start:
		mov ax,stack
		mov ss,ax
		mov sp,128
		
		mov ax,0b800h
		mov es,ax
		mov ah,'a'
	s:
		mov es:[160*12+2*40],ah
		call delay
		inc ah
		cmp ah,'z'
		jna s
		
		mov ax,4c00h
		int 21h
	
	delay:
		push ax
		push dx
		mov dx,8	;dx循环次数高位
		mov ax,0		;ax低位
	s1:
		sub ax,1		
		sbb dx,0		;带借位减法控制循环次数
		cmp ax,0
		jne s1
		cmp dx,0
		jne s1
		pop dx
		pop ax
		ret
code ends
 
end start
		
		
		
		