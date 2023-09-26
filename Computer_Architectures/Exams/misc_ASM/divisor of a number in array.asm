.model small
.stack
.data
m db 7 dup(?)   
i db 0 
flag db 0
.startup
         
           
           
mov   si,0  
loop2:   
inc i
cmp i,9
je ended
mov ax,0
mov al,9     
mov bx,0
mov bl,i    
div i
cmp ah,0 
jne loop2  
mov cx,0
mov cl,al  
mov flag,1
jmp check

cont1:

mov cx,0
mov cl,bl
mov flag,2
jmp check   
cont2:
jmp loop2 
  
  
check: mov di,0  
lp:    cmp di,7
       je  write 
      mov ch,m[di]  
      cmp ch,cl
      je chflag 
      inc di
      jmp lp
       
write:      mov m[si],cl    
       inc si
         jmp chflag
  
chflag:  cmp flag,1
        je cont1
        jmp cont2


 
 
 
 
 
 
 

  
  
ended  :
.exit

end       