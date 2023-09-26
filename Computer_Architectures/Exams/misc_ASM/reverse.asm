.model small
.stack
.data

number dw 22522

ten db 10  
r db 0
q db 0
                 
temp dw 0

sum dw 0
                 
.startup
       
mov ax,number
mov temp,ax


loop1:
mov ax,number
div ten

mov r,ah
mov q,al

mov ax,sum
mul ten 
        
mov bx,0
mov bl,r        
        
add ax, bx

mov sum,ax   

mov ax,0  
mov al,q
mov number,ax
cmp ax,0
jne loop1      

mov ax,sum   

cmp ax,temp
je equal
mov ax,0
jmp endprog
equal:
mov ax,1 

endprog:

.exit
end