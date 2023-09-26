.model small
.stack
.data
d dw 16 dup(?)   

.startup


mov ax,300
mov dh,0
mov dl,ah
mov ah,al
mov al,0
mov bh,0    
mov bl,7
div bx


    
.exit

end