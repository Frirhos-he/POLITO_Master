.MODEL .small
.STACK
.DATA

SOURCE DW 10,20,100,10000,0,7000,1,2,9000,12345,999,30000,200,210,7,65000
MAPP DB 16 DUP(?)
CROSS DB 16 DUP(?)


.CODE
.STARTUP          

XOR SI,SI 


loopi:
CMP SI,30
JE exit
    
MOV AX,SOURCE[SI]

CMP AX,255
JLE  nooverflow
INC SI
INC SI     
JMP loopi     
     
nooverflow:

MOV BX,SI
SHR BX,1
MOV MAPP[BX],1
INC SI
INC SI

JMP loopi    

exit:


.EXIT