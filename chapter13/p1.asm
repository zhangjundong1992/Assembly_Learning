;int指令
assume  cs:code

code segment
	start:
		mov ax,0b800h
		mov es,ax
		mov byte ptr es:[12*60+40*2],'!'
		
		int 0
code ends

end start