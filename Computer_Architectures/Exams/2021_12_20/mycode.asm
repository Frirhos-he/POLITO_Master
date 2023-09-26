.MODEL small
.STACK
.DATA

SOURCE DB 1,2,3,	4,	5
       DB 6,	7,	8,	,9	,0
       DB        9	,8	,7	,6	,5	
       DB        4	,3	,2	,1	,0
       DB        7	,7	,7	,7	,7
       DB        3	,5	,7	,9	,0
       DB        8	,7	,6	,5	,4
       DB        9	,9	,9	,3	,2


.CODE
.STARTUP

XOR AX,AX ; temporary result
XOR BX,BX ; index
XOR CX,CX ;temp value;
XOR DX,DX ;even evaluation
                           

loopi:
CMP BX,40
JE exit     
MOV CL, BYTE PTR SOURCE[BX]

MOV DX,BX
AND DX,1
CMP DX,0 ; even
JE even
;odd 
SUB AX,CX ; MINUS
JMP next
even:
ADD AX,CX ; ADDITION

next:
INC BX
JMP loopi
exit:

.EXIT