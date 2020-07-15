;call指令
;call 标号，使用ret返回
;call far ptr 标号，使用retf返回
;call reg
;call word ptr [bx]、call dword ptr [bx]

assume cs:code,ss:stack

stack segment
	db 8 dup (0)
	db 8 dup (0)
stack ends

code segment
	start:
		mov ax,stack
		mov ss,ax
		mov sp,16
		
		mov ax,1000
		call s		;调用s段
		
		mov ax,4c00h
		int 21h
	s:	add ax,ax
		ret			;返回return
code ends

end start