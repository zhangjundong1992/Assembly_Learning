assume cs:code

code segment
	start:
		mov ax,3
		
		mov dx,ax
		shl dx,l
		
		mov cl,3
		mov ax,cl
		
		add ax,dx
code ends

end start