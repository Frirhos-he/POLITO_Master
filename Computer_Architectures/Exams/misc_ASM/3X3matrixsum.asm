N EQU 6

.MODEL .small               
.STACK
.DATA

SOURCE DW 1,2,3, 4,5,6, 7,8,9
DESTINATION DW 9 DUP(?) 
 
.CODE
.STARTUP

MOV CX,9
XOR SI,SI
XOR BX,BX

loop:     
  
    MOV AX, N
    ADD AX, SI
    MOV DX, 16
    DIV DL
    XOR BX,BX
    MOV BL,AH    
    MOV DX, SOURCE[SI] 
    ADD DX, SOURCE[BX]
    MOV DESTINATION[SI],DX
    INC SI
    INC SI
    
    LOOP loop 
    
    .EXIT
    END
    
      


