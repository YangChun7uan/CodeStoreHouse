;assume cs:code, ds:data, ss:stack
;stack segment
;    dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
;stack ends
;data segment
;    dw 012h, 0456h
;data ends
;
;code segment
;start:  mov ax, stack
;	mov ss,ax
;	mov sp,16
;	mov ax,data
;	mov ds,ax
;	push ds:[0]
;	push ds:[2]
;	pop ds:[2]
;	pop ds:[0]
;	mov ax,4c00h
;	int 21h
;code ends
;end start		 

;code segment 
;start: 
;    mov ax,stack
;    mov ss,ax
;    mov sp,16
;    mov ax,data
;    mov ds,ax
;    push ds:[0]
;    push ds:[2]
;    pop ds:[2]
;    pop ds:[0]
;    mov ax,4c00h
;    int 21h
;code ends
;data segment
;    dw 0123h, 0456h
;data ends
;stack segment
;    dw 0,0
;stack ends
;end start
assume cs:code
;a segment 
;db 1,2,3,4,5,6,7,8
;a ends
;b segment
;db 8,7,6,5,4,3,2,1
;b ends
;c segment
;db 0,0,0,0,0,0,0,0
;c ends
;code segment
;start:	mov cx,8
;	mov bx,0
;	mov ax,a
;	mov ds,ax
;	mov ax,b
;	mov es,ax
;	mov ax,c
;	mov ss,ax
;s:	mov al,[bx];mov al,a:[bx]
;	mov ah,es:[bx];mov ah,b:[bx]
;	add ah,al
;	mov ss:[bx],ah
;	add bx,1
;	loop s
;	mov ax,4c00h
;	int 21h
;code ends
;end start

;a segment
;    dw 0,1,2,3,4,5,6,7,8
;a ends
;b segment
;    dw 0,0,0,0,0,0,0,0,0
;b ends
;code segment
;start:	mov ax,b
;	mov ss,ax
;	mov sp,18
;	mov ax,a
;	mov ds,ax
;	mov cx,10
;	mov bx,0
;s:	push [bx]
;	add bx,2
;	loop s
;	mov ax,4c00h
;	int 21h
;code ends
;end start
;
;
;assume cs:code
;    mov ax,2000h
;    mov ds,ax
;    mov bx,1000h
;    mov ax,[bx]
;    mov cx,[bx+1]
;    mov cx,[bx+2]
;    mov ax,4c00h
;    int 21h
;code ends
;end
;
;assume cs:code,ds:data
;data segment
;    db 'welcome to masm!'
;    db '................'
;data ends
;code segment
;start:	
;    mov ax,data
;    mov ds,ax
;    mov si,0
;    mov di,16
;    mov cx,8
;s:
;    mov ax,[si]
;    mov [di],ax
;    add si,2
;    add di,2
;    loop s
;    mov ax,4c00h
;    int 21h
;code ends
;end start
;
;assume cs:code
;code segment
;start:
;    ;mov dx,1
;    mov ax,03e9h
;    mov bl,100
;    div bl
;code ends
;end start
;
;assume ds:data,cs:code
;data segment
;    dd 100001
;    dw 100
;    dw 0
;data ends
;code segment
;start:
;    mov ax,data
;    mov ds,ax
;    mov ax,ds:[0]
;    mov dx,ds:[2]
;    mov bx,ds:[4]
;    div word ptr ds:[4]
;    mov ds:[6],ax
;code ends
;end start
;

;寻址方式在结构化数据访问中的运用
;assume cs:code
;data segment
;    db '1975','1976',
;

;assume cs:code
;code segment
;start:
;    mov ax,0
;    mov bx,0
;    jmp short s
;    add ax,1
;    mov bx,ax
;s:  inc ax
;code ends
;end start
;
;assume cs:code
;code segment
;start:
;    mov ax,2000h
;    mov ds,ax
;    mov bx,0
;s:
;    mov dl,[bx]
;    mov cx,dx
;    jcxz ok
;    inc bx
;    jmp short s
;ok:
;    mov dx,bx
;    mov ax,4c00h
;    int 21h
;code ends
;end start
;    mov es,ax
;    jmp dword ptr es:[1000h]
;code ends
;end 
;    
;在屏幕中间显示彩色字符串"welcome to masm!"
;测试过了解到显存显示的位置大概在 b800:66h 这个位置，这个位置的字符能够显示在第一行第一列
;assume cs:code,ds:data
;data segment
;    ;db 'welcome to masm!'
;    db '123,12666,1,8,3,38'
;data ends
;code segment
;start:
;    mov ax,data
;    mov ds,ax
;    mov ax,0b800h
;    mov es,ax
;    mov si,58
;    mov bx,0
;    mov cx,18
;w:
;    mov al,[bx]
;    mov es:050h[si+22],al
;;    mov es:0820h[si],al
;    inc si
;    mov byte ptr es:050h[si+22],02h
;;    mov byte ptr es:0820h[si],71h
;    inc bx
;    inc si
;    loop w
;    mov ax,4c00h
;    int 21h
;code ends
;end start
;

;assume cs:code
;stack segment
;    db 16 dup(0)
;stack ends
;
;code segment
;    mov ax,4c00h
;    int 21h
;start:
;    mov ax,stack
;    mov ss,ax
;    mov sp,16
;    mov ax,0
;    call s 
;    inc ax
;s:
;    pop ax
;    push cs
;    push ax 
;    mov bx,0
;    ret
;code ends
;end start


;子程序的使用，关于参数的传递和结果返回、寄存器冲突：    
;assume cs:code
;data segment
;    db 'Welcome to masm!',0
;data ends
;
;code segment
;start:
;    mov dh,8
;    mov dl,3
;    mov cl,2
;    mov ax,data
;    mov ds,ax
;    mov si,0
;    call show_str
;    mov ax,4c00h
;    int 21h
;show_str:
;    push dx
;    push cx
;    push ax
;    push si
;    push bx
;    push es
;    push di
;change:
;   
;
;assume cs:code
;data segment
;    ;db '123','12666','1','8','3','38'
;    dw 123,12666,1,8,3,38
;data ends
;code segment
;start:
;    mov ax,data
;    mov ds,ax
;    mov ax,0b800h
;    mov es,ax
;    mov cx,13
;    mov bx,0
;    mov si,0
;s:
;    mov al,[bx]
;    mov es:090h[si+18],al
;    inc si
;    mov byte ptr es:090h[si+18],02h
;    inc si
;    inc bx
;    mov al,[bx]
;    mov es:[si],al
;    mov byte ptr es:[si+1],02h 
;    add bx,2
;    loop s
;    mov ax,4c00h
;    int 21h
;code ends
;end start
;
;assume cs:code
;code segment
;    sub ax,ax
;    mov ah,-128
;    mov al,-1
;    add ah,al
;code ends
;end

;
;assume cs:code
;data segment
;    db "Beginner's All-purpose Symbolic Instruction Code.",0
;data ends
;code segment
;start:
;    mov ax,data
;    mov ds,ax
;    mov bx,0
;    mov ax,0
;s:
;    mov al,[bx]
;    mov cx,ax
;    jcxz ok
;    cmp al,61h
;    jb c
;    cmp al,7ah
;    ja c
;    and al,0dfh
;    mov [bx],al
;c:
;    inc bx
;    jmp short s
;ok:
;    mov ax,4c00h
;    int 21h
;code ends
;end start

;assume cs:code
;code segment
;    mov ax,1000h
;    mov bh,1
;    div bh
;    mov ax,4c00h
;    int 21h
;code ends
;end
;
;assume cs:code
;stack segment
;    db 16 dup(0)
;stack ends
;
;code segment
;start:
;    mov ax,stack
;    mov ss,ax
;    mov ax,0
;    mov sp,ax
;    mov ax,4c00h
;    int 21h
;code ends
;end start   

assume cs:code
code segment
start:   
    mov ax,cs
    mov ds,ax
    mov si,offset do0
    mov ax,0
    mov es,ax
    mov di,200h
    mov cx,offset do0end-offset do0
    cld
    rep movsb
    mov ax,0
    mov ds,ax
    mov bx,0h
    mov word ptr [bx],200h
    mov word ptr [bx+2],0h
    mov ax,4c00h
    int 21h
do0:
    jmp short do0start
    db "OverFlow!"
do0start:
    mov ax,cs
    mov ds,ax
    mov si,202h
    mov ax,0b800h
    mov	es,ax
    mov di,12*160+36*2
    mov cx,9
s:
    mov al,[si]
    mov es:[di],al  
    inc di
    mov byte ptr es:[di],02h
    inc si
    inc di
    loop s
    mov ax,4c00h
    int 21h
do0end:
    nop
code ends
end start
