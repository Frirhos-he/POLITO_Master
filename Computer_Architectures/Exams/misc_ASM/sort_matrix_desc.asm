.model small

.stack

.data

s db  2,5,8,1,3,0,8,9,10,9
max db 0  
db n 10 
index dw 0
.startup
 ; sort a db array in desc order

;for (i=0,i<n,i++)
;{
 ;max=s[i];  
 ;index=i;
   ;for(j=i+1;j<n;j++)
  ; {
       ;if(s[j]>=max)   
      ; {
           ;max=s[j] 
           ;index=j
       ;}
   ;}
   ;s[index]=s[i]
   ;s[i]=max
;}     
 
mov ax,0
mov bx,0
mov si,0  ;i
mov di,0  ;j 


loop1: cmp si,10 
       je  endpr
       mov al,s[si]   
       mov max,al ;   max=s[i];
       mov index,si;;index=i
       mov di,si
       inc di   ;j=i+1
loop2: cmp di,10
       je swap
       mov al,s[di]  ;al=s[j]
       cmp al,max
       jge setmax
nextj: inc di
       jmp loop2   
       
setmax:  mov al,s[di]  ;;max=s[j] 
         mov max,al
         mov index,di;index=j 
         jmp nextj
       
swap:   mov al,s[si] 
        mov bl,max
        mov s[si],bl ;s[i]=max 
        mov bx,index
        mov s[bx],al ;s[index]=s[i]
        inc si
        jmp loop1
                  
    
endpr: 
  
.exit


end


