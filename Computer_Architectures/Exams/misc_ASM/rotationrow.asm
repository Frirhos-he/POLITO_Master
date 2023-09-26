.MODEL .small
.STACK
.DATA

MATRIX_ROW DB 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P'

.CODE
.STARTUP

MOV AH,1
INT 21H
XOR DX,DX  ;n
MOV DL,AL  ;n 
SUB DL,'0'

XOR CX,CX  

LEA SI,MATRIX_ROW

MOV DI,SI

loopo:
MOV BH,BYTE PTR[DI]
XOR CL,CL  ;counter movements columns

loopi:
MOV BL,BYTE PTR[DI+1]
MOV BYTE PTR[DI],BL
INC DI 
INC CL      
CMP CL,3
JE substitute
JMP loopi


substitute:
MOV BYTE PTR[DI],BH

INC DH
CMP DL,DH  
JE  nextrow
MOV DI,SI
JMP loopo

nextrow:
 
INC DI
MOV SI,DI    
XOR DH,DH
INC CH  ;counter movements rows
CMP CH,4
JE exit
JMP loopo

exit:


.EXIT