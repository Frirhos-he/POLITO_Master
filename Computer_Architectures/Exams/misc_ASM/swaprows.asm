.MODEL .small
.STACK
.DATA

SOURCE DB 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
DESTINATION DB 16 DUP


.CODE
.STARTUP

XOR AX,AX
XOR BX,BX
XOR SI,SI


loopi:

  MOV AX, WORD PTR SOURCE[SI]
  XOR DI,DI
  MOV DI,SI
  ADD DI,4
  CMP DI,11
  JG mod
  
continue:
 
  MOV WORD PTR DESTINATION[DI],AX
  
  ADD SI,2
  
  CMP SI,12
  JE exit
  
JMP loopi


mod:
   SUB DI,12
   JMP continue
         
         
exit:         
       

.EXIT