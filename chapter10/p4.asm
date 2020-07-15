assume cs:code,ds:data

data segment
	dw 1,2,3,4,5,6,7,8
	dd 8 dup (0)
data ends

code segment
	start:
		mov ax,data
		mov ds,ax
		
		mov si,0
		mov di,16
		
		mov cx,8
	s:	mov bx,[si]
		call cube
		mov [di],ax
		mov [di+2],dx
		add si,2
		add di,4
		loop s
		
		mov 4c00h
		int 21h
		
	cube:		
		mov ax,bx	;计算N的3次方，参数N通过bx传递
		mul bx		;结果保存到ax，dx中
		mul bx
		ret
code ends

end start