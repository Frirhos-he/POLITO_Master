.MODEL .small
.STACK
.DATA

SOURCE DW 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
DESTINATION DW 16 DUP(?)

.CODE
.STARTUP


MOV AH,1
INT 21H
XOR DX,DX
MOV DL,AL ;store n
SHL DL,1  ;n*2

;add for the additional point



;AX = current value
;BX = buffer value
;CX = current row
;DX = n value    
;SI = index of source
;DI = index of destination

 
XOR AX,AX
XOR BX,BX
XOR CX,CX
XOR SI,SI
XOR DI,DI


loopi:

MOV SI,DI ; i
SUB SI,DX ; i-n

AND SI,7  ;[0-3]
MOV BX,CX ;buffer compuation row
SHL BX,3  ; 8*j

ADD SI,BX ; 8*j +i-n
ADD DI,BX ; 8*j +i 

MOV AX,SOURCE[SI]
MOV DESTINATION[DI],AX

INC DI
INC DI
AND DI,7
CMP DI,0   ; 
JE newrow
JMP loopi

newrow:
INC CX
CMP CX,4
JE exit  

JMP loopi


exit:



.EXIT