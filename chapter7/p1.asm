assume cs:code,ds:data

data segment
	db 'unIX'
	db 'foRK'
data ends

code segment
	start:
		mov al,'a'	;使用字符串赋值，赋值为对应的asc码
		mov bl,'b'
		
		mov ax,4c00h
		int 21h
code ends

end start