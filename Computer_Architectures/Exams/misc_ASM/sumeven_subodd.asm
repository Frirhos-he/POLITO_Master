.MODEL small
.STACK
.DATA

     
SOURCE DB 1,2,3,4,5
       DB 6,7,8,9,0
       DB 9,8,7,6,5
       DB 4,3,2,1,0
       DB 7,7,7,7,7
       DB 3,5,7,9,0
       DB 8,7,6,5,4
       DB 9,9,9,3,2 

.CODE
.STARTUP

XOR AX,AX ;result computation; unsigned value!!! JA and JB
XOR BX,BX ;temp
XOR SI,SI ; index matrix

loopi:
CMP SI,40
JE done
;I check if the index of the matrix is over
MOV BL, BYTE PTR SOURCE[SI]
MOV DI,SI
AND DI,1  
;retrieve the content of the matrix and look the index vlaue
CMP DI,0
JE even
;odd
SUB AX,BX
INC SI
JMP loopi
even:
ADD AX,BX
INC SI
JMP loopi
done:
     
.EXIT