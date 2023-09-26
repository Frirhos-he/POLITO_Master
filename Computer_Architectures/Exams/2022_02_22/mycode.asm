.MODEL small
.STACK
.DATA
SOURCE DB 0,1,2,3
       DB 4,5,6,7
       DB 7,6,5,4
DESTINATION DB 12 DUP(?)

.CODE
.STARTUP

XOR AX,AX; used to store the current value
;ABSOLUTE VALUE DO NOT EXCEED 120
XOR SI,SI;index of source i 
XOR DX,DX;index of source j
XOR BX,BX; contains the refer to the next columns



loopi:
;where computation takes place
MOV AL,BYTE PTR SOURCE[SI]    
;once stored
CBW ;so we extend the value to AX
;negate the value of ax
NEG AX

;store back
MOV DI,SI
AND DI,3 ; so we store the value till 3
MOV BX,DI; TEMP
SHL DI,1
ADD DI,BX
ADD DI,DX ; so it is i*3+j
MOV BYTE PTR DESTINATION[DI],AL

                 
INC SI 
MOV BX,SI
AND BX,3
CMP BX,0  
JE next
JMP loopi
next:
INC DX
CMP DX,3
JNE loopi

 
 
.EXIT