.data
  ar1 dw 1,0,0,1,1,0,1,0,0,0,1,1,1,1,1,0
  ar2 db 9 dup(?)
.code
start:
      
   mov si,01  
   mov di,01
   xor bp,bp
  l1:     cmp bp,12
          jz comp
          cmp si,di
          jnz N
          add ax,ar1[bp]
          jmp cont
  N:      add bx,ar1[bp]
  cont:   inc bp
          inc di
          cmp di,4
          jnz l1
          inc si
          mov di,1
          jmp l1
 comp:    sub bx,ax
        

.exit

end start