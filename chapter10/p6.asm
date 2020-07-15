assume cs:code,ds:data

data segment
	db 'conversation',0
data ends

code segment
	start:
		mov ax,data
		mov ds,ax
		mov si,0
		
		call capital
		
		mov ax,4c00h
		int 21h
		
	capital:			;相当于while循环
		mov cl,[si]
		mov ch,0
		jcxa ok
		
		and byte ptr [si],11011111b
		inc si
		jmp short capital	
			
	ok:	ret
code ends

end start