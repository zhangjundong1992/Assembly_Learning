;课堂练习，使用int 16h读取键盘输入
assume cs:code

code segment
	start:
		mov ah,0
		int 16h
		
		call change_color
		
		mov ax,4c00h
		int 21h
	
	change_color:
		push ax
		push bx
		push cx
		push es
		
		cmp al,'r'
		je r
		cmp al,'g'
		je g
		cmp al,'b'
		je b
		jmp change_color_end
	r:
		mov al,00000100b
		jmp short next
	g:
		mov al,00000010b
		jmp short next	
	b:
		mov al,00000001b
		jmp short next
		
	next:
		mov bx,0b800h
		mov es,bx
		mov bx,1
		mov cx,2000
	s
		and byte ptr es:[bx],11111000b
		or es:[bx],al
		add bx,2
		loop s
	
	change_color_end:
		pop es
		pop cx
		pop bx
		pop ax
	ret	
code ends

end start