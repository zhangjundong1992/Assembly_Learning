assume cs:code,ss:stack,ds:data

stack segment
	db 128 dup (0)
stack ends

data segment
	dw 0,0
data ends

code segment
	start:
		mov ax,stack
		mov ss,ax
		mov sp,128
		
		mov ax,data
		mov ds,ax
		
		mov ax,0
		mov es,ax
		
		push es:[9*4]
		pop ds:[0]
		push es:[9*4+2]
		pop ds:[2]	;保存原int 9入口地址
		
		mov word ptr es:[9*4],offset int9
		mov word ptr es:[9*4+2],cs	;设置新的int 9入口地址
			
		mov ax,0b800h
		mov es,ax
		mov ah,'a'
	s:
		mov es:[160*12+2*40],ah
		call delay
		inc ah
		cmp ah,'z'	
		jna s	;显示a-z
		
		mov ax,0
		mov es,ax
		
		push ds:[0]
		pop es:[9*4]
		push ds:[2]
		pop es:[9*4+2]	;恢复原本的int 9的入口地址
		
				
		mov ax,4c00h
		int 21h
	
	delay:
		push ax
		push dx
		mov dx,8	
		mov ax,0		
	s1:
		sub ax,1		
		sbb dx,0		
		cmp ax,0
		jne s1
		cmp dx,0
		jne s1
		pop dx
		pop ax
		ret
	
	int9:
		push ax
		push bx
		push es
		
		in al,60h	;读取
		
		pushf	;标志寄存器入栈
		
		pushf
		pop bx
		and bh,11111100b
		push bx
		popf	;TF、IF置0
		
		call dword ptr ds:[0]	;调用原本的9号中断
		
		cmp al,1	;根据扫描码判断是否按键为esc键
		jne int9ret
		
		mov ax,0b800h
		mov es,ax
		inc byte ptr es:[160*12+2*40+1]			;改变颜色
		
	int9ret:
		pop es
		pop bx
		pop ax
		iret
code ends

end start