.MODEL .small
.STACK
.DATA

SOURCE DB 1,2,3,4,5,6,7,8,9,0,9,8,7,6,5,4,3,2,1,0,7,7,7,7,7,3,5,7,9,0,8,7,6,5,4,9,9,9,3,2
RESULT DW 0



.CODE
.STARTUP

XOR AX,AX
XOR SI,SI
XOR DI,DI
XOR BX,BX
XOR DX,DX ; counter to final loop
loopi:
      
      MOV BX,DI
      SHL BX,3  ;8*j 
      ADD BX,SI ;8*j + i
      
      MOV AL,SOURCE[BX] 


;check before ending
      MOV DX,SI
      ADD DX,DI 
      
      MOV CX,DX
      SHR CX,1
      JNC  even
      ;odd
      XOR AH,AH   
      SUB RESULT,AX
      JMP continue
      
even:
      ADD RESULT,AX
      
      
continue:
      CMP DX,11 ; i+j = 11 last case
      JE exit 


;increment next loop     

      INC SI
      AND SI,7
      CMP SI,0    ;found new row
      JE newrow
      
      JMP loopi
      
newrow:
   INC DI
   JMP loopi
      
exit:      


.EXIT