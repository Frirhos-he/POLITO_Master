.model small
.stack
.data
  
.startup

MOV AX,8
MOV BX,3
MOV DX,0
MOV AH,AL
MOV AL,0
MOV BH,0
DIV BX
 
.exit

end
