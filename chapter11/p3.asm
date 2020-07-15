;课堂作业，adc指令实现32位加法
assume cs:code

code segment
	start:
		mov bx,0f000h
		mov ax,1eh
		
		add bx,1000h
		adc ax,20h	;adc指令自动添加cf的值
		
		mov ax,4c00h
		int 21h
code ends

end start
		