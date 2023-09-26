.MODEL small
.STACK
.DATA

SOURCE DB 3x3 DUP 1,2,3,4,5,6,7,8,9

DESTINATION DW 9 DUP(?)


.CODE
.STARTUP


XOR AX,AX ;temp value
XOR BX,BX ;index result
XOR SI,SI ;index row  
XOR DI,DI ;row below
XOR CX,CX ; temp value
; so I store the value with index the destination index below
;8, 9 10 11 12 NOP 
loopi:
MOV DI,SI
ADD DI,3
CMP DI,9
JB goon
SUB DI,9
goon:

XOR AX,AX
MOV AL, BYTE PTR SOURCE[SI] 
MOV CL, BYTE PTR SOURCE[DI]
ADD AX,CX

MOV BX,SI 
SHL BX,1
MOV WORD PTR DESTINATION[BX],AX

INC SI
CMP SI,9 
JNE loopi
                     
                     
                     


.EXIT