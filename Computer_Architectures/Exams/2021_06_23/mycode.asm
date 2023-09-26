.MODEL small
.STACK
.DATA

SOURCE DW 1,2,3,4,5
       DW 6,7,8,9,0
       DW 9,8,7,6,5
       DW 4,3,2,1,0
       DW 7,7,7,7,7


.CODE
.STARTUP

XOR AX,AX
XOR BX,BX
XOR CX,CX
XOR DX,DX

XOR SI,SI
XOR DI,DI


loopi:      

    MOV AX, SOURCE[SI]
    ADD BX,AX
    

    ADD SI,2
    CMP SI,50
    JL loopi
    
    XOR SI,SI
    
    
loopsub:

    MOV AX, SOURCE[SI]
    SUB BX,AX
    SUB BX,AX
    
    
    ADD SI, 10
    ADD SI,2
    CMP SI,50
    JL loopsub
    

.EXIT