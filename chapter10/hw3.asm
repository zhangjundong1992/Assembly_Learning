;将内存中的数值以二进制形式显示到dos界面
assume cs:code,ds:data,ss:stack

data segment
	db 10 dup (0)
data ends

stack segment
	db 10 dup (0)
stack ends

code segment
	start:
		mov ax,data
		mov ds,ax
		mov ax,stack
		mov ss,ax
		mov sp,10
		
		mov ax,12666	;将值12666转为字符串
		mov si,0		;目标存储地址
		call dtoc
		
		mov dh,8	;显示在第8行
		mov dl,3	;第3列
		mov cl,2	;绿色
		call show_str
	
		mov ax,4c00h
		int 21h
	
	dtoc:
		mov bx,10	;用于取余的除数
		mov si,0	;计数器，统计字符数目
		
	s:	
		mov dx,0
		div bx
		
		add dx,30h	;转ascii码
		push dx
		inc si
		
		mov cx,ax	;循环结束判断
		jcxz ok
		
		jmp s	
	ok:
		mov cx,si
		mov di,0
	s_1:
		pop [di]
		inc di
		loop s_1
		
		mov byte ptr [di],0	;字符串结尾标志
		ret
		
	show_str:
		mov bx,0b800h	;从第8行开始显示，地址保存到es中
		mov al,10
		dec dh
		mul dh
		add bx,ax		
		mov es,bx		
		
		
		mov dh,0	;从第3列开始显示，地址保存到di中
		dec dx
		add dx,dx
		mov di,dx	
		
		mov al,cl	;把颜色数据存储到al中
		
		mov si,0	;源字符串的偏移地址
	s_2:
		mov cl,[si]
		mov ch,0
		jcxz ok_1
		
		mov bl,[si]
		mov es:[di],bl
		mov es:[di+1],al
		inc si
		add di,2
		jmp s_2
	ok_1: 
		ret
code ends

end start