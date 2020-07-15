;转移地址在内存中的jmp指令
assume cs:code,ds:data

data segment
	db 16 dup (0)
data ends

code segment
	start:
		mov ax,0123h
		mov ds:[0],ax
		jmp word ptr ds:[0]		;等价于jmp ax（段内近转移）
		
		jmp dword ptr ds:[0] 	;相当于段间远转移
								;同时修改cs（高位）和ip（低位）的值
		
		mov ax,4c00h
		int 21h
code ends

end start