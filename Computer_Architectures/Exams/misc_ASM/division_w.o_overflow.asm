.MODEL .small
.STACK
.DATA
DIVIDEND DW 3001
DIVISOR DB 3
RESULT DB DUP 3


.CODE
.STARTUP


;assumption division no overflow

MOV AX,DIVIDEND  ;store current value of dividend
XOR BX,BX
MOV BL,DIVISOR   ;store current value of divisor

DIV BL           ;rest in AH, result in AL

MOV BYTE PTR RESULT+1,AL

MOV AL,0        ;add additional zeroes       

DIV BL

MOV BYTE PTR RESULT,AL  ; 8 bit integer, 8 bit fractional


;solution with overflow

MOV WORD PTR RESULT,0 
MOV BYTE PTR RESULT+2,0


MOV AX,DIVIDEND  ;store current value of dividend
XOR BX,BX
MOV BL,DIVISOR   ;store current value of divisor 
XOR DX,DX        ;upper part of dividend
DIV BX           ;result in AX, rest in DX


MOV WORD PTR RESULT+1,AX


MOV AH,DL
MOV AL,0



DIV BL           ;remember divisor was a byte anyway

MOV BYTE PTR RESULT,AL
     







.EXIT