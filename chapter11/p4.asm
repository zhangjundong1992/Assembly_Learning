;128位加法运算
assume cs:code,ds:data

data segment
	db 16 dup (88h)
	db 16 dup (11h)
data ends

code segment
	start:
		mov ax,data
		mov ds,ax
		
		mov si,0
		mov di,16
		mov cx,8
		
		call add128
		
		mov ax,4c00h
		int 21h
		
	add128:
		sub ax,ax	;主要是将cf置0
	s:
		mov ax,[si]
		adc ax,[di]
		mov [si],ax
		inc si		;只能用inc,不改变cf的值,add si,2改变cf
		inc si
		inc di
		inc di
		loop s
		ret
		
code ends

end start
		