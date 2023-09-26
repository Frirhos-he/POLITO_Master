.MODEL small
.STACK
.DATA

SOURCE DB 1,2,3,-120,1,2,3,4,1,2,3,-63 
DESTINATION DB 12 DUP(?)
;source and destination are cut by row

.CODE
.STARTUP

;if value doenst exceed 120 means it 
XOR AX,AX
XOR SI,SI ; index
XOR DI,DI ; index destination

;I store in AL, the current value
; use neg
; store in the evaluated transpose
; consider that i and j --> j and i means that
; index d = i*3 +j
; index s = j*4 +i
; saving i and j would be helpful

XOR BX,BX ; i  [0-3]
XOR CX,CX ; j  [0-2]

loopi: 
;INDEX EVALUTATION       
MOV SI,CX
SHL SI,2
ADD SI,BX

MOV DI,BX ; destination
SHL DI,1
ADD DI,BX 
ADD DI,CX


MOV AL,BYTE PTR SOURCE[SI]
NEG AL
MOV BYTE PTR DESTINATION[DI],AL

INC BX
AND BX,3
CMP BX,0 ; which means another row
JE nextrow
;if not 

JMP loopi 

nextrow:
INC CX
CMP CX,3
JNE loopi
;done

.EXIT