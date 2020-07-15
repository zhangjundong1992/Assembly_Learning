;cf进位标志位（carry flag），对于无符号数而讨论
assume cs:code

code segment
	start:
		mov al,98h
		add al,al	;产生进位，cf为1
		add al,al
		
		mov al,97h
		sub al,98h	;产生借位，cf为1
		sub al,al
		
		mov ax,4c00h
		int 21h
code ends

end start