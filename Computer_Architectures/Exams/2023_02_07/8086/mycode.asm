.MODEL small
.stack
.data
XFIELD DB 'C', 'D', 'D', 'F', 'K', 'K', 'J', 'Z', 'A', 'B', 'A', 'B', 'D', 'H', 'G', 'R', 'K', 'K', 'O', 'O', 'P', 'U', 'Y', 'R', 'E', 'V', 'R', 'W', 'W', 'W', 'W', 'F', 'R', 'Y', 'R', 'S', 'T', 'T', 'T', 'T', 'T', 'T', 'T', 'O', 'P', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'N', 'B', 'D', 'S', 'E', 'H', 'T', 'U', 'I', 'U', 'X', 'R', 'A', 'R', 'T', 'S', 'W', 'A', 'K', 'U', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'P'
XPOSITION DW 0,0,0,0
XDIAG DB 0,0,0,0
.CODE
.STARTUP
        MOV SI, 0
        MOV AL, 'A'
        MOV DI, 0
        DEC SI
SCAN:   INC SI
        MOV BL, BYTE PTR XFIELD[SI]
        CMP BL, AL
        JNE SCAN
        MOV XPOSITION[DI], SI
        ADD DI, 2
        CMP DI, 8 ; WHEN I FOUND ALL THE  i stop SEARCHI
        JE ENDSCAN
        JMP SCAN
ENDSCAN:LEA SI, XPOSITION
        LEA DI, XDIAG
        MOV CX, 4
CHECK:  MOV AX, [WORD PTR SI]
        AND AX, 7
        CMP AX, 0
        JE FOUND
        JMP FICHECK
FOUND:  MOV [BYTE PTR DI], 1
FICHECK:INC DI
        ADD SI, 2
        DEC CX
        CMP CX, 0
        JE EDCHECK
        JMP CHECK
EDCHECK:NOP                
END