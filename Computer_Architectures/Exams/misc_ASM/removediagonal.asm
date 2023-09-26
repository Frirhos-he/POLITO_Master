.MODEL small
.STACK
.DATA

SOURCE DB 1,2,3,4,5,6,7,8,9,0,9,8,7,6,5,4,3,2,1,0,7,7,7,7,7


.CODE
.STARTUP

XOR AX,AX
XOR BX,BX
XOR SI,SI

;result in 2's complement
loopi:

    MOV AL,BYTE PTR SOURCE[SI]
    ADD BX,AX
    INC SI
    CMP SI,25
    JL loopi

;now remove the diagonal    
    XOR SI,SI
loopo:
    XOR AX,AX  

    MOV AL,BYTE PTR SOURCE[SI]
    SUB BX,AX
    SUB BX,AX                 
    ADD SI,6
    CMP SI,25
    JL loopo



.EXIT