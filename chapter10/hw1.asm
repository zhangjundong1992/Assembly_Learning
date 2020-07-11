;将字符串显示到dos界面
assume cs:code,ds:data

data segment
	db 'welcome to masm!',0
data ends

code segment
	start:
		mov ax,data
		mov ds,ax
		
		mov dh,8	;屏幕第8行
		mov dl,3	;第3列
		mov cl,2	;绿色
		call show_str
		
		mov ax,4c00h
		int 21h
	
	show_str:
		mov bx,0b800h	;从第8行开始显示，地址保存到es中
		mov al,10
		dec dh
		mul dh
		add bx,ax		
		mov es,bx		
		
		
		mov dh,0
		dec dx
		add dx,dx
		mov di,dx	;从第3列开始显示，地址保存到di中
		
		mov al,cl	;把颜色数据存储到al中
		
		mov si,0	;源字符串的偏移地址
	s:
		mov cl,[si]
		mov ch,0
		jcxz ok
		
		mov bl,[si]
		mov es:[di],bl
		mov es:[di+1],al
		inc si
		add di,2
		jmp s
		
	ok: 
		ret
code ends

end start
		