;int 21h的显示字符串功能
assume cs:code,ds:data

data segment
	db 'assembly$'
data ends

code segment
	start:
		mov ah,2	;2号子程序
		mov bh,0	;第0页
		mov dh,5	;第5行
		mov dl,12	;第12列
		
		int 10h		;光标移动
	
		mov ax,data	
		mov ds,ax
		mov dx,0
		
		mov ah,9
		int 21h		;显示字符串
		
		mov ax,4c00h
		int 21h
code ends

end start
		
