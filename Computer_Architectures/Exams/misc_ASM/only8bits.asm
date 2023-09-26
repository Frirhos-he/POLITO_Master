.MODEL small
.STACK
.DATA

SOURCE DW 10,20,100,10000
       DW 0,7000,1,2
       DW 9000,12345,999,30000
       DW 200,210,7,65000
MAP DB 16 DUP(?)
CROSS DW 0


.CODE
.STARTUP  

XOR AX,AX
XOR BX,BX
XOR SI,SI ; INDEX OF source

loopi:                           
    MOV SI,BX
    SHL SI,2
    MOV AX,SOURCE[SI]  
    MOV CX,AX
    AND CX,255
    CMP CX,AX
    JNE no8bit
8bit:
    MOV MAP[BX],1
    ADD CROSS,AX
    JMP continue    
no8bit:
    MOV MAP[BX],0

continue:
    INC BX
    CMP BX,16
    JNE loopi



.EXIT
