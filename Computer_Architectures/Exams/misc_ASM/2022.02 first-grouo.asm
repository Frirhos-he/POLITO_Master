N EQU 4

.MODEL small
.STACK

.DATA
SOURCE DB 1,2,3,4,5,6,7,8,9,10,11,12
DESTINATION DB 10 DUP(?)

.CODE
.STARTUP                

MOV CX,3  ;loop outer index
XOR DI,DI  ;index matrix colomns
     

oloop:          

   MOV DX,3
   SUB DX,CX ;offset
   
   PUSH CX
   MOV CX, 4 ;inner loop 
   XOR DI,DI
   
iloop:
    
    MOV BX,DX
    SHL BX,2
    ADD DI,BX   ; DI = DI+ offsetrow*4
    MOV AL,SOURCE[DI]
    NOT AL
    INC AL  
    SUB DI,BX   ; DI = DI - offsetrow*4 -> used as local index
    
    MOV BX,DI   ; BX = DI
    SHL BX,1    
    ADD BX,DI   ; BX = 3*DI
    
    ADD BX,DX  ;bx =offsetrow+3*DI
    MOV DESTINATION[BX],AL        

    INC DI
    LOOP iloop
   
    POP CX
    LOOP oloop
   
.EXIT
END