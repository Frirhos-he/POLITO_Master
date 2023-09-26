.model small
.stack
.data
  
.startup

MOV AX,200
MOV BX,47
MOV DX,0
MOV DH,AH
MOV DL,AL
MOV AL,0
MOV AH,0
MOV BH,0
DIV BL
 
.exit

end