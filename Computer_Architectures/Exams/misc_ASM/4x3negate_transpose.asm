.MODEL .small
.STACK
.DATA  

SOURCE DB 1,4,7,10,2,5,8,11,3,6,9,12
DESTINATION DB 12 DUP(?)   

.CODE
.STARTUP
    
XOR BX,BX ; counter to 0-3   
XOR CX,CX ; counter to 4
XOR DI,DI ; index source
JMP loopi


newloop:
    INC CX
    CMP CX,3
    JE exit

loopi:
    
    MOV DI,CX         ;buffer
    SHL DI,2          ;i = 4*CX
    ADD DI,BX         ;i = 4*CX+counter
    
    XOR AX,AX
    MOV AL,SOURCE[DI] ;current source value
    NOT AL
    INC AL
    XOR SI,SI         ;index destination  
    MOV SI,BX
    SHL SI,1
    ADD SI,BX         ;j = 3*counter
    ADD SI,CX         ;j = 3*counter+CX
    
    MOV DESTINATION[SI],AL
    
    INC BX 
    AND BX,3
    CMP BX,0
    JE  newloop
    JMP loopi    
        
exit:        

.EXIT