.MODEL small
.STACK
.DATA
  
DIVIDEND DW 255 
DIVISOR DB  1
RESULT DW 0
  
  
  
.CODE
.STARTUP

MOV AX,DIVIDEND
MOV BL, DIVISOR
DIV BL        

MOV BYTE PTR RESULT+1,AL
XOR AL,AL
DIV BL   

MOV BYTE PTR RESULT,AL
  
; SOLUTION WITHOUT OVERFLOW   
   
.EXIT
END