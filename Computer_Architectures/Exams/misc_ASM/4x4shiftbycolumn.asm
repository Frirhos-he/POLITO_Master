.MODEL .small
.STACK
.DATA   

matrix DB 'A','E','I','M','B','F','J','N','C','G','K','O','D','H','L','P'
buffer DB 4 DUP(?)

.STARTUP
  
XOR SI,SI ; index matrix 
XOR DI,DI ; index second   
                        
MOV AH,1
INT 21H  ;store result in AL

SUB AL,48

CMP AL,0 ;the operation gives the same result
JE exit
CMP AL,4 ;the operation gives the same result
JE exit

MOV BL,4
XOR AH,AH
MUL BL    ;store second index start  
SUB AX,1
MOV DI,15
SUB DI,AX

MOV CX,3
loopo:

PUSH CX        
MOV CX,2           ;loop counter
loopi:
                                   
    MOV AX, WORD PTR matrix[SI]  ;first 2 content of the matrix
    MOV BX, WORD PTR matrix[DI]  ;second content of the matrix
    MOV WORD PTR matrix[SI],BX
    MOV WORD PTR matrix[DI],AX  ;swap content
    ADD SI,2
    ADD DI,2
    LOOP loopi
POP CX         
AND SI,15
AND DI,15
LOOP loopo

exit:   

.EXIT
END