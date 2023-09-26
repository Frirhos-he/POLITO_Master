.MODEL .small
.STACK
.DATA

SOURCE DB 1,2,3,4,5,6,7,8,9,0,9,8,7,6,5,4,3,2,1,0,7,7,7,7,7
;5X5

.CODE
.STARTUP

XOR AX,AX     
XOR BX,BX     
XOR CX,CX
XOR DX,DX
MOV CX,25

loopi:   

     XOR AX,AX
     MOV AL,SOURCE[BX] ;current value 
     ADD DX,AX
     INC BX
     LOOP loopi

MOV BX,0
MOV CX,5     
removediagonalx2:
     MOV AL,SOURCE[BX] ;element diagonal
     SUB DX,AX
     MOV AL,SOURCE[BX] ;element diagonal
     SUB DX,AX
     ADD BX,6
     
     LOOP removediagonalx2




.EXIT
