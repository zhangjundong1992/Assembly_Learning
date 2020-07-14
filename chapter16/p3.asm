;使用查表法显示字符
assume cs:code,ds:data

data segment
	a db '0123456789ABCDEF'
data ends

code segment
	start:
		mov ax,data
		mov ds,ax
		
		mov al,6Bh	;要显示的字符
		
		mov bx,0b800h
		mov es,bx
		mov di,[12*160+40*2]	;显存显示位置
		
		mov bl,al
		mov cl,4
		shr bl,cl
		mov bh,0
		mov dl,a[bx]
		mov es:[di],dl	;显示高位
		
		mov bl,al
		and bl,00001111b
		mov bh,0
		mov dl,a[bx]
		mov es:[di+2],dl	;显示低位
		
		mov ax,4c00h
		int 21h
code ends

end start