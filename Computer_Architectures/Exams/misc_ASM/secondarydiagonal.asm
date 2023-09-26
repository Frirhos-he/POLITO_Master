.MODEL .small
.STACK
.DATA

SOURCE DB 1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, 1,1,1,1,1,1,1,1,1,1,1,1
RESULT DW 0 
; 255*11*11= 30855 
; since 2^16= 65546 is more than enough to store the value
; I chose 16 instead of 15 because it is provided by 8086
 
.CODE
.STARTUP

XOR SI,SI
XOR AX,AX
XOR DI,DI 
MOV SI,11
;since i and j are the same I would consider SI as index (both i and j)
loopi:   


XOR AX,AX
MOV AL,SOURCE[SI]

ADD RESULT,AX


INC DI 
ADD SI,11 ;so that I get to the next element of the diagonal

CMP DI,11 ; which is out of the matrix
JG exit

JMP loopi
exit:



.EXIT

