assume cs:code,ds:data

data segment
	dd 100001
	dw 100
	dw 0
data ends

code segment
	start:
		mov ax,data
		mov ds,ax
		
		mov ax,ds:[0]
		mov dx,ds:[2]	;将被除数赋值到ax，dx中
		mov bx,ds:[4]	;将除数赋值到bx中	
		div bx
		mov ds:[6],ax	;将商保存到数据段中
		
		mov ax,4c00h
		int 21h
code ends

end start
	
	