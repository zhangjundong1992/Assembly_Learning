;手动解决除法溢出问题
assume cs:code,ds:data

data segment
	dw 8 dup (0)
data ends

code segment
	start:
		mov ax,data
		mov ds,ax
		
		mov ax,4240h	;被除数低位
		mov dx,000fh	;被除数高位
		mov cx,0ah		;除数
		call divdw
		
		mov ax,4c00h
		int 21h
		
	divdw:
		mov ds:[0],ax
		mov ds:[2],dx
		
		mov ax,dx
		mov dx,0
		div cx
		
		mov ds:[4],ax
		mov ds:[6],dx
		
		mov ax,ds:[0]
		div cx
		
		mov cx,dx
		mov dx,ds:[4]
		ret
code ends

end start