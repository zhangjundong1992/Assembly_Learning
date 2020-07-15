;测试端口读取
assume cs:code

code segment
	start:
		in al,20h
		
		mov dx,3f8h	;注意，地址大于255时需要用dx保存地址
		in al,dx
		
		in al,3f8h	;错误指令
	
		mov ax,4c00h
		int 21h
code ends

end start