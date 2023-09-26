.MODEL small
.STACK
.DATA

XFIELD DB 'C', 'D', 'D', 'F','K','K','J','Z','A','B','A','B','D','H','G','R','K','K','O','O','P','U','Y','R','E','V','R','W','W','W','W','F','R','Y','R','S','T','T','T','T','T','T','T','O','P','Z','X','C','V','B','N','M','N','B','D','S','E','H','T','U','I','U','X','R','A','R','T','S','W','A','K','U','Q','W','E','R','T','Y','U','I','P'
XPOSITION DB 4 DUP (?)
XDIAG DB 4 DUP (?)


.CODE
.STARTUP

XOR AX,AX ; temp store
XOR BX,BX ; index

XOR DI,DI ; index diag  
XOR DX,DX ; counter

loopi:
MOV AL,BYTE PTR XFIELD[BX]
CMP AL,'a'
JE found
CMP AL,'A'
JE found


repeat:
INC BX
CMP BX,81
JNE loopi
JMP done

found:
INC DX
MOV BYTE PTR XPOSITION[DI],BL

; bx is the valu of 
MOV AX,BX
AND AX,7
CMP AX,0
JNE checkDX
MOV BYTE PTR XDIAG[DI],1


checkDX:

INC DI
CMP DX,4
JE done
JMP repeat

done:


.EXIT