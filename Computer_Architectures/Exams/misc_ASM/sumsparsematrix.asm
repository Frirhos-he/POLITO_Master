.MODEL small
.STACK
.DATA

EL1 DB 101, 97, 6,  
    DB 33, 85, 2,
    DB 68, 86, 9,
    DB 15, 9, 2

EL2 DB 33, 85, 10,
    DB 61, 13, 99,
    DB 77, 77, 77,
    DB 68, 86, 100

ADDITION DB 4*2*3 DUP(?)

.CODE
.STARTUP

XOR AX,AX
XOR SI,SI ; index of the addition still available

; notice, the addition should be made on indexes which are equal
; others are just copied
copyEL1:
    MOV AL, BYTE PTR EL1[SI]
    MOV BYTE PTR ADDITION[SI], AL
    INC SI
    CMP SI, 12
    JL copyEL1

; now we do the same but doin an internal loop checking for same indexes
    ;SI is the index at first available slot
XOR BX,BX ; internal loop index addition
XOR DI,DI ; index el2      


copyEL2:
    MOV AX, WORD PTR EL2[DI]
check:
    MOV CX, WORD PTR ADDITION[BX]
    CMP AX,CX
    JE found
    INC BX
    INC BX
    INC BX
    
    CMP BX,12
    JL check
    ;in case it was not found
    MOV WORD PTR ADDITION[SI],AX
    MOV AL, BYTE PTR EL2[DI+2]  
    INC SI
    INC SI
    MOV BYTE PTR ADDITION[SI],AL
    INC SI  
    JMP goon
found:
    MOV AL, BYTE PTR EL2[DI+2]
    MOV CL, BYTE PTR ADDITION[BX+2]
    ADD CL,AL
    MOV BYTE PTR ADDITION[BX+2],CL
    
goon:                
    INC DI
    INC DI
    INC DI
    XOR BX,BX
    CMP DI,12
    JL  copyEL2
    ;done 




.EXIT