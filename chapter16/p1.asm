;标号表示数据长度，称之为数据标号
assume cs:code

code segment
	a db 1,2,3,4,5,6,7,8
	b dw 0
	
	start:
		mov si,0
		mov cx,8
	s:
		mov al,a[si]	;a标号既表示了地址，
						;也表示了数据长度
						;类似数组？？？
		mov ah,0
		add b,ax
		inc si
		loop s
		
		mov ax,4c00h
		int 21h
code ends

end start