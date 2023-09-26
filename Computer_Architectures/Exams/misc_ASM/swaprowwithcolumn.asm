.MODEL .small
.STACK
.DATA 

SOURCE DB 1,2,3,4,5,6,7,8,9,10,11,12
MATHELP DB 12 DUP(?)

.CODE
.STARTUP

XOR AX,AX  ;store current value
XOR BX,BX  ;buffer value
XOR CX,CX  ;new column
XOR SI,SI  ;source index
XOR DI,DI  ;destination index


;ax as variable


loopi:


MOV AL,BYTE PTR SOURCE[SI]
MOV BYTE PTR MATHELP[DI],AL


INC SI
MOV DI,SI
AND DI,3

CMP DI,0
JE newcolumn

continue:

MOV CX,DI
SHL CX,1
ADD DI,CX  ; SI*3
ADD DI,BX

CMP SI,12
JGE exit
JMP loopi

newcolumn:
INC BX 
JMP continue




exit:

.EXIT