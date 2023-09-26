.MODEL small
.STACK
.DATA

SOURCE DB 'A','B','C','D',          ;cut by row  upward
       DB 'E','F','G','H',
       DB 'I','J','K','L'
       DB 'M','N','O','P'

;rotates the column

.CODE
.STARTUP 

XOR AX,AX
XOR BX,BX
XOR SI,SI
XOR CX,CX


MOV DX,1

storematrix:
MOV AX,WORD PTR SOURCE[SI]
MOV BX,WORD PTR SOURCE[SI+2]
PUSH BX
PUSH AX
ADD SI,4
CMP SI,16
JE done
JMP storematrix
done:

;evaluate where to put last insertion
MOV SI,3
SUB SI,DX

SHL SI,2

rotate:                 
POP AX
POP BX
MOV WORD PTR SOURCE[SI],AX
MOV WORD PTR SOURCE[SI+2],BX 
SUB SI,4
AND SI,15
INC CX
CMP CX,4
JE doned
JMP rotate
doned:

.EXIT