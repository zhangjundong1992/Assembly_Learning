;bios中断例程应用
;int 10h的第2号子程序，设置光标位置
assume cs:code

code segment
	start:
		mov ah,2	;2号子程序
		mov bh,0	;第0页
		mov dh,5	;第5行
		mov dl,12	;第12列
		
		int 10h
		
		mov ax,4c00h
		int 21h
code ends

end start