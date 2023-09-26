.data
  ar1 db 01H,02H,03H,04H,05H,06H,07H,08H,09H,10H,11H,12H
  ar2 db 9 dup(?)
.code
start:
          lea si,ar1
          lea di,ar2
      
      xor si,si
      xor di,di
      mov bp,12
      
   l2: mov cx,3
       mov al,ar1[si]
       mov bx,si
   l1: add bx,3
       cmp bx,11
       jl l3
       sub bx,12
       
   l3: dec cx
       jnz l1
       mov ar2[bx],al
       inc si
       dec bp
       jnz l2
          

.exit

end start