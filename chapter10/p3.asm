;mul指令
assume code:cs

code segment
	mov al,100
	mov bl,10
	mul bl		;8位乘法
	
	mov ax,100
	mov bx,10000
	mul bx		;16位乘法
	
	mov ax,4c00h
	int 21h
code ends

end