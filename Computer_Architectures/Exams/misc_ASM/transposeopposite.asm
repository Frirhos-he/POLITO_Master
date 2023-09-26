.MODEL small
.STACK
.DATA

SOURCE DB 1,2,3,4
       DB 4,3,2,1
       DB 1,2,3,4
DESTINATION DB 12 DUP(?)   

.CODE
.STARTUP 

XOR AX,AX
XOR BX,BX
XOR CX,CX
XOR SI,SI
XOR DX,DX

loopi:          

MOV SI,CX
SHL SI,2
ADD SI,DX ;to create I

MOV AL,BYTE PTR SOURCE[SI]
NEG AL   ;automatically add 1
MOV BX,DX
SHL BX,1
ADD BX,DX ;consider multiple by (2 +1)  summing the i
ADD BX,CX ;j


MOV BYTE PTR DESTINATION[BX],AL
INC DX
CMP DX,4
JNE loopi
CMP CX,2
JE exit
MOV DX,0
INC CX
JMP loopi
;evaluate index transposed
exit:


.EXIT
