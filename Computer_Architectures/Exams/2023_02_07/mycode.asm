.MODEL small
.STACK
.DATA

XFIELD DB 'C','D','D','F','K','K','J','Z','A'
       DB   'B', 'A', 'B', 'D', 'H', 'G', 'R', 'K', 'K'
DB 'O', 'O', 'P', 'U', 'Y', 'R', 'E', 'V', 'R'
DB 'W', 'W', 'W', 'W', 'F', 'R', 'Y', 'R', 'S'
DB 'T', 'T', 'T', 'T', 'T', 'T', 'T', 'O', 'P'
DB 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'N', 'B'
DB 'D', 'S', 'E', 'H', 'T', 'U', 'I', 'U', 'X'
DB 'R', 'A', 'R', 'T', 'S', 'W', 'A', 'K', 'U'
DB 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'P'

XPOSITION DB 4 DUP(?)
XDIAG DB 4 DUP(?)


.CODE
.STARTUP

XOR AX,AX
XOR BX,BX
XOR CX,CX
XOR DX,DX

XOR DI,DI
XOR SI,SI

loopi: 


    MOV AL, BYTE PTR XFIELD[SI]  ;CHECK LITTLE ENDIAN
    CMP AL,'A'
    JE found
    CMP AL,'a'
    JE found
    JMP continue
found:          
    MOV DX, SI
    MOV BYTE PTR XPOSITION[DI],DL 
    AND DX,7
    CMP DX,0
    JE multiple
    MOV BYTE PTR XDIAG[DI],0
    JMP continue1
    
multiple:
    MOV BYTE PTR XDIAG[DI],1
     
continue1:    
    INC DI
        
continue:
    
    INC SI
    CMP SI,81
    JL loopi


.EXIT