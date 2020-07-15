;int 13h对磁盘扇区进行读写
;将显存内容读取到1-8扇区
assume cs:code

code segment
	start:
		mov ax,0b800h
		mov es,ax
		mov bx,0
		
		mov ah,3	;3表示写入扇区
		mov al,8	;读取8个扇区
		mov ch,0	;磁道号
		mov cl,1	;扇区号
		mov dh,0	;磁头号
		mov dl,0	;驱动器号
		int 31h
		
		mov ax,4c00h
		int 21h
code ends

end start
		
		