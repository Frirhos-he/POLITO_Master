.model small
.stack
.data
d dw 16 dup(?)   

.startup
 
 
 
mov ax, 129
test al,1
jz even
jmp odd   

even:    mov bx,2
  
jmp     endpr

odd:     mov bx,1  

jmp     endpr

mov ax,300
mov dh,0
mov dl,ah
mov ah,al
mov al,0
mov bh,0    
mov bl,7
div bx


endpr:
    
.exit

end