;ret、retf指令
assume cs:code,ss:stack

stack segment
	db 16 dup (0)
stack ends

code segment
		mov ax,4c00h
		int 21h
	
	start:
		mov ax,stack
		mov ss,ax
		mov sp,16
		
		mov ax,0
		push ax
		
		mov bx,0
		ret			;将栈顶元素赋值给ip
					;等价于pop ip
code ends

end start