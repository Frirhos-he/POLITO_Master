.MODEL small
.STACK
.DATA

SOURCE DB 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P'
.CODE
.STARTUP


XOR AX,AX
XOR SI,SI
XOR BX,BX
XOR CX,CX

MOV AH,1
INT 21H 
;AL n
SUB AL,'0'
CMP AL,0
JE done
CMP AL,4
JE done
;AX is used as a counter
;BX hold values
;CX hold values
;DX counter
MOV DX,0
store:
MOV BX,WORD PTR SOURCE[SI]
MOV CX,WORD PTR SOURCE[SI+2]
PUSH CX                   
PUSH BX
INC DX
ADD SI,4

CMP DX,4
JE rotated
JMP store 

rotated:
;when I should start?
;from last index so if ax is 1
MOV SI,3
ADD SI,1
AND SI,3
MOV DX,0
;so start from 4-->0
SHL SI,2
rotate:                   
POP BX
POP CX
MOV WORD PTR SOURCE[SI],BX
MOV WORD PTR SOURCE[SI+2],CX
SUB SI,4
AND SI,15
INC DX  
CMP DX,4
JE done
JMP rotate

done:








.EXIT