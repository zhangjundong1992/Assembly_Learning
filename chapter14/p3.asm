;课堂练习，从cmos ram中读取当前月份，显示到屏幕中间
assume cs:code

code segment
	start:
		mov al,8	
		out 70h,al
		
		in al,71h	;从8号单元读取月份
		
		mov bx,0b800h
		mov es,bx
		mov di,12*160+40*2	;显存目的地址
		
		mov ah,al
		and al,00001111b
		add al,30h
		mov cl,4
		shr ah,cl
		add ah,30h
		mov es:[di],ah
		mov es:[di+2],al	;转ascii码，写入显存
		
		mov ax,4c00h
		int 21h
code ends

end start