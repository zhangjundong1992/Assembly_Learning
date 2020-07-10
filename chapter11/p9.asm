;课堂练习，复制字符串
assume cs:code,ds:data

data segment
	db 'welcome to masm!'
	db 16 dup (0)
data ends

code segment
	start:
		mov ax,data	;源地址
		mov ds,ax
		mov si,0
		
		mov ax,data	;目的地址
		mov es,ax
		mov di,16
		
		cld 		;传送方向
		mov cx,16	;传送字节数
		rep movsb
		
		mov ax,4c00h
		int 21h
code ends

end start