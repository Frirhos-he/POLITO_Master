.MODEL .small
.STACK
.DATA

SOURCE DB 1,2,3,4,5,6,7,8,9
DESTINATION DW 9 DUP(?)


.CODE                  
.STARTUP               

;AX current value
;BX
;CX
;DX
;SI index scanning the matrix
;DI

;notice destination in 16bit

XOR SI,SI
XOR SI,SI
XOR AX,AX
XOR BX,BX

loopi:

MOV DI,SI
ADD DI,3
CMP DI,9
JGE scaleup
continue:


MOV AL,SOURCE[SI]; current value
MOV BL,SOURCE[DI]; below value
ADD AX,BX        ;perform the summation 
XOR BX,BX
MOV BX,SI                                
SHL BX,1         ;2*SI because it is word
MOV DESTINATION[BX],AX

INC SI
CMP SI,9
JG exit
JMP loopi

         
scaleup:
    SUB DI,9
    JMP continue

exit:






.EXIT
