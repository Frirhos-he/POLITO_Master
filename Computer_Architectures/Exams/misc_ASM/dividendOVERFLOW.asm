.MODEL small
.STACK
.DATA
  
DIVIDEND DW 65535 
DIVISOR DB  2
RESULT DB 3 DUP(?)   ; I consider the worst case in which Dividend is the greatest value thus integer part 16bit
  
  
  
.CODE
.STARTUP

MOV AX,DIVIDEND
MOV BL, DIVISOR
XOR BH,BH 
XOR DX,DX           ; I do the division by 32 bit so that the result may be used for store 16 bit integer part
DIV BX        

MOV WORD PTR RESULT+1,AX  ; Consider little endian, flipped values
MOV AX,DX 
MOV AH,AL
XOR AL,AL
DIV BL   

MOV BYTE PTR RESULT,AL
  
; SOLUTION WITH OVERFLOW   
   
.EXIT
END