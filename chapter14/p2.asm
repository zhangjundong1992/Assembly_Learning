;逻辑移位指令shl，shr
assume cs:code

code segment
	start:
		mov al,01010001b
		mov cl,3	;移位大于1时，必须用cl存储
		shl al,cl
		
		shl al,1	;正确指令
		shl al,3	;错误指令
code ends

end start