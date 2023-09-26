.model small

.stack

.data
d  db 10 dup(?)
.startup    
 
 mov si,0
 mov ax,0
 mov bx,0  
 mov al, 
 
 loop1: 
 mov bl,10
 div bl
 cmp al,bl
 jg save 
 
 
 

 mov si,0
 mov bl,d[si]   
 cmp   al,bl
 je  endpr
 
 
save: mov d[si],ah
 inc si  
 mov ah,0
 jmp loop1
 
 
 
endpr: 

.exit


end




