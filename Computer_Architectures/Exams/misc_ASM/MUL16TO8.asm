.model small
.stack
.data
  
.startup

MOV AX,0
MOV BX,150
MOV CL,7
MOV AL,BL
MUL CL
MOV DX,AX
MOV AX,0
MOV AL,BH
MUL CL
ADD DH,AL
ADC AH,0
 
.exit

end