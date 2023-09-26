.model small
.stack
.data
  
y db 5
x db 6
.startup
           
 ;x=c/9+(3a)/4-8b  
mov ax,0
mov bx,0 
mov dx,0 
mov cx,0
mov al,87 
mov dl,9
div  dl;al/9 
mov  cl,al ;c/9
shl ax,1; 2a
add al,al;3a
shr al,2;(3a)/4  
shl bl,3  ;8b
add al,cl   ;  c/9+(3a)/4
sub al,bl; c/9+(3a)/4-8b



mov ax,0
mov bx,0 
mov dx,0 
mov cx,0
;z=6Y-(7x)/8  
mov al,y
shl al,2;4y
mov bl,y
shl bl,1;2y
add al,bl;4y+2y=6y
mov dl,x
shl dl,2;4x
mov cl,x
shl cl,1;2x
add dl,cl;4x+2x=6x
add dl,x ;6x+x=7x
shr dl,3;(7x)/8
sub al,dl; 6Y-(7x)/8




 
.exit

end

