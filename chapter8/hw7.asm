;实验七，将数据段中的数据转存
assume cs:code,ds:data

data segment
	db '1975','1976','1977','1978','1979'
	db '1980','1981','1982','1983','1984'
	db '1985','1986','1987','1988','1989'
	db '1990','1991','1992','1993','1994'
	db '1995'
	
	dd 16,22,382,1356,2390
	dd 8000,16000,24486,50065,97479
	dd 140417,197514,345980,590827,803530
	dd 1183000,1843000,2759000,3753000,4649000
	dd 5937000
	
	dw 3,7,9,13,28
	dw 38,130,220,476,778
	dw 1001,1442,2258,2793,4037
	dw 5635,8226,11542,14430,15257
	dw 17800
data ends

table segment
	db 21 dup ('year summ ne ?? ')
table ends

code segment
	start:
		mov ax,data
		mov ds,ax
		mov ax,table
		mov es,ax
	
		mov bx,0	;定位目的结构中的每条结构型数据，递增10h
		mov bp,0	;定位源数据中年份和收入的偏移地址,递增4
		mov si,0	;定位源数据中雇员数的偏移地址，递增2
		
		mov cx,21
	s:	mov ax,ds:[bp]						;年份
		mov es:[bx],ax
		mov ax,ds:[bp+2]
		mov es:[bx+2],ax
		mov byte ptr es:[bx+4],' '			;空格
		mov ax,ds:[84+bp]					;收入
		mov es:[bx+5],ax
		mov ax,ds:[86+bp]
		mov es:[bx+7],ax
		mov byte ptr es:[bx+9],' ' 			;空格	
		mov ax,ds:[168+si]					;雇员数
		mov es:[bx+10],ax
		mov byte ptr es:[bx+12],' '			;空格
		mov word ptr ax,es:[bx+5]			;人均收入
		mov word ptr dx,es:[bx+7]
		div word ptr es:[bx+10]
		mov es:[bx+13],ax		
		mov byte ptr es:[bx+15],' '			;空格
		
		add bx,10h	
		add bp,4
		add si,2
		loop s
	
		mov ax,4c00h
		int 21h
code ends

end start		
