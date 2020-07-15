;of溢出标志位(overflow)，对于有符号数而言讨论
assume cs:code

code segment
	start:
		mov al,01100010b
		add al,01100011b	;溢出但不进位
		
		mov al,10001000b
		add al,11110000b	;溢出且进位
		
		mov ax,4c00h
		int 21h
code ends

end start