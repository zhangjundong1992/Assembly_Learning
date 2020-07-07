;段内转移：短转移和近转移
assume cs:code

code segment
	start:
		mov ax,0
		jmp short s		;对应的机器指令为EB03，
						;在执行指令ip自增之后
						;ip再增加03,实现跳转
						;short为长度为8位补码，
						;段内转移,只修改ip
						
		jmp near ptr s	;near为长度为16位补码，
						;段内转移,只修改ip
		
		add ax,1
	s:	inc ax
	
		mov ax,4c00h
		int 21h
code ends

end start