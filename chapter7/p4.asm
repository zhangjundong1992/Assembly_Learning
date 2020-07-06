assume cs:code,ds:data,ss:stack

data segment
	db 'ibm             '
	db 'dec             '
	db 'dos             '
	db 'vax             '
data ends

stack segment
	dw 0,0,0,0,0,0,0,0
stack ends

code segment
	start:
		mov ax,data
		mov ds,ax
		
		mov ax,stack
		mov ss,ax
		mov sp,16
		
		mov bx,0
		mov cx,4
	s:	
		mov si,0
		push cx	;使用栈暂存cx的值，实现双循环
		mov cx,3
	s1:	mov al,[bx+si]
		and al,11011111b
		mov [bx+si],al
		inc si
		loop s1
		pop cx
		
		add bx,16
		loop s
		
		mov ax,4c00h
		int 21h
				
code ends

end start
	