.model small
.stack
.data
 
 DIVIDEND dw    300
 DIVISOR  db   7
  
.startup
 
mov ax, DIVIDEND
mov bh,0
mov bl,DIVISOR
mov dh,0
mov   dl,ah
mov ah,al
mov al,0
div bx

 
.exit

end


