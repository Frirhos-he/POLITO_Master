.MODEL .small
.STACK
.DATA

SOURCE DB 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
RESULT DW 0



.CODE
.STARTUP

XOR AX,AX ; current value
XOR SI,SI ; current index



loopi:
CMP SI,28
JG exit

MOV AL,SOURCE[SI]        
MOV BX,SI ;buffer
SHR BX,1  ;value of CF determine if even or odd
JC  odd   

;even
ADD RESULT,AX
INC SI
JMP loopi


odd:
SUB RESULT,AX
INC SI
JMP loopi    
exit:
          
     

.EXIT