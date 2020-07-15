;读取多个字符输入并显示
assume cs:code,ds:data

data segment
	db 128 dup (0)
data ends

code segment
	start:
		mov ax,data		
		mov ds,ax
		mov si,0	;缓存区
		mov dh,12	;行
		mov dl,30	;列
		
		call getstr
		
		mov ax,4c00h
		int 21h
	
	;显示键盘输入子程序
	getstr:
		push ax
	getstrs:
		mov ah,0
		int 16h		;读取键盘输入
		
		cmp al,20h	
		jb nochar 	;小于20h的为控制字符
		
		mov ah,0
		call charstack	;字符入栈
		mov ah,2
		call charstack 	;显示字符
		
		jmp getstrs
		
	nochar:
		cmp ah,0eh	;退格键
		je backspace
		cmp ah,1ch	;enter键
		je enter_key
		
		jmp short getstrs	;循环接受输入
	
	backspace:
		mov ah,1
		call charstack	;字符出栈
		mov ah,2
		call charstack 	;显示字符
		jmp short getstrs
	
	enter_key:
		mov al,0
		
		mov ah,0
		call charstack	;0入栈
		mov ah,2
		call charstack	;显示字符
		
		pop ax
		ret		;结束子程序
	
	;字符串栈子程序
	charstack:
		jmp short charstart
		
	table 	dw charpush,charpop,charshow
	top 	dw 0	;top既指向栈顶的上一个空位
					;又表明了字符串的长度
	
	charstart:
		push bx
		push dx
		push di
		push es
		
		cmp ah,2
		ja sret		;参数判断，只接收0，1，2
		
		mov bl,ah
		mov bh,0
		add bx,bx
		jmp word ptr table[bx]
	
	charpush:
		mov bx,top
		mov [si][bx],al
		inc top
		jmp sret
		
	charpop:
		cmp top,0	
		je sret		;字符串非空判断，top为字符个数
		dec top
		mov bx,top
		mov al,[si][bx]
		jmp sret
		
	charshow:
		mov bx,0b800h
		mov es,bx
		mov al,160
		mov ah,0
		mul dh
		mov di,ax
		add dl,dl
		mov dh,0
		add di,dx	;计算偏移地址
		
		mov bx,0	;使用个数控制循环次数
	charshows:
		cmp bx,top
		jne noempty
		mov byte ptr es:[di],' '
		jmp sret
	noempty:
		mov al,[si][bx]
		mov es:[di],al
		mov byte ptr es:[di+2],' '
		inc bx
		add di,2
		jmp short charshows
	
	sret:
		pop es
		pop di
		pop dx
		pop bx
		ret
	
code ends

end start