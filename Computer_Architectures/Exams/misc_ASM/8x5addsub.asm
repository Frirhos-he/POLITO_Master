

.MODEL small
.STACK
.DATA

SOURCE DW -2,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1

.CODE
.STARTUP
    
XOR SI,SI
XOR BX,BX
MOV CX, 20
loop:

    ADD BX,SOURCE[SI]
    SUB BX,SOURCE[SI+2]
    ADD SI,4
    LOOP loop


.EXIT
END