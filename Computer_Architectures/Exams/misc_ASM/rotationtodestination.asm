.MODEL .small
.STACK
.DATA

SOURCE DB 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
DESTINATION DW 16 DUP(?)

.CODE
.STARTUP


MOV AH,1
INT 21H
XOR DX,DX
MOV DL,AL ;store n
SUB DL,'0'

XOR DI,DI ;use DI as index source
XOR SI,SI ;use SI as index destination
storedestination:
XOR AX,AX
MOV AL,SOURCE[SI]       
MOV DESTINATION[DI],AX
INC DI
INC DI
INC SI
CMP SI,16
JE continue
JMP storedestination


continue:
;now that the content of the destination 
;are the one of the source I procede to swap
CMP DX,0
JE exit
CMP DX,4
JE exit

column:  
XOR SI,SI
XOR DI,DI 
XOR AX,AX ;content
XOR CX,CX
       
MOV AX,DESTINATION[SI]   ;we put on stack the content of first column
PUSH AX
ADD SI,2
MOV AX,DESTINATION[SI] 
PUSH AX
ADD SI,2
MOV AX,DESTINATION[SI]
PUSH AX  
ADD SI,2
MOV AX,DESTINATION[SI]
PUSH AX
ADD SI,2

swapcolumn:
MOV AX,DESTINATION[SI]   ;we swap the column till the last
MOV DESTINATION[DI],AX
ADD SI,2
ADD DI,2
CMP DI,24
JE changecolumn
JMP swapcolumn

changecolumn: 
ADD DI,6
POP AX
MOV DESTINATION[DI],AX 
POP AX
SUB DI,2
MOV DESTINATION[DI],AX 
POP AX
SUB DI,2
MOV DESTINATION[DI],AX  
POP AX
SUB DI,2
MOV DESTINATION[DI],AX

DEC DX
CMP DX,0
JE exit
JMP column



exit:



.EXIT