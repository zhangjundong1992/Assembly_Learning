;条件跳转指令je、jne、jb、jnb、ja、jna
assume cs:code

code segment
	start:
		mov ah,2
		mov bh,3
		
		cmp ah,bh
		je equal	;je指令，相等跳转（检测zf=1跳转）
		add ah,bh
		
	re:	mov ax,4c00h
		int 21h
		
	equal:
		add ah,ah
		jmp short re
	
code ends

end start
		