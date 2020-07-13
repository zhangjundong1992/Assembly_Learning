assume cs:code

code segment
	start:
		mov al,2
		out 70h,al
		
		in al,71h	;读取2号单元的数据
		
		mov al,2
		out 70h,al
		mov al,0
		out 71h,al	;将0写入2号单元
		
		mov 4c00h
		int 21h
code ends

end start