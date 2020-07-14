;程序入口地址的直接定址表,类似中断向量表
assume cs:code

code segment
	mov ah,0	;将子程序的编号参数放入ah中
	call setscreen
	
	mov ax,4c00h
	int 21h
	
	;设置屏幕程序
	setscreen:
		jmp short set
		table dw sub0,sub1,sub2,sub3
	
	set:
		push bx
		
		cmp ah,3
		ja sret
		mov bl,ah
		mov bh,0
		add bx,bx
		
		call word ptr table[bx]
	
	sret:
		pop bx
		ret
	
	sub0:
		nop
		ret
	sub1:
		nop
		ret
	sub2:
		nop
		ret
	sub3:
		nop
		ret
code ends

end start
		