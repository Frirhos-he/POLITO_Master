.model small
.stack
.data
dah dw 10 
flag db 0   
result db 0
.startup

mov cx,0
mov ax,0
mov ax,1;22;25952;32723;252    
push ax
   
loop1:  
mov dx,0 
cmp dah,ax
jg jenas
div dah     ;ax/10  
push ax    ;keep next ax 
push dx 
cmp ax,dah   
jg compute  
inc flag 
jmp compute
 
compute: 
         mov ax,0
         mov ax,cx 
         mul dah;   old_r*10
         mov cx,ax
         pop dx
         add  cx,dx   ; final number is: each time old_r*10  + new_r
         
         pop ax ;reitrive ax 
         cmp flag,0
         je loop1  
  ; last time no more div just add last al to get final number :
         mov bx,0
         mov bx,ax
         mov ax,0
         mov ax,cx 
         mul dah;   old_r*10  
         add ax,bx
 
          
        pop cx
        cmp  ax,cx
        jne   notjenas
jenas:   inc result   ;jenas ok
         jmp endpr
         
notjenas: mov al,1  
         jmp endpr         

endpr:
.exit

end