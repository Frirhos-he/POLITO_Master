.model small
.stack
.data 

R DB 0
Q DB 0
TEMP DW 0
NUMBER DW 22522  
TEN DB 10
SUM DW 0  
RESULT DB 0

.startup
MOV AX,NUMBER 
MOV TEMP,AX   

LOOP1:
MOV AX,NUMBER
DIV TEN  ;NUMBER/10

MOV Q,AL    ;NUMBER/10
MOV R,AH    ;NUMBER%10

MOV AX,0
MOV AL,Q
MOV NUMBER,AX

MOV AX,SUM
MUL TEN; AX=SUM*10

MOV SUM,AX 
MOV BX,0
MOV BL,R
ADD SUM,BX; ;SUM*10+R

MOV BX,0
MOV BL,TEN
CMP NUMBER,BX; CHECK IF NEXT NUMBER CAN BE DIVIDED BY 10
JG LOOP1    
MOV AX,SUM      ; DIV FINISHED SO WE NEED TO COMPARE SUM*10+NUMBER TO ORIGINAL_NUMBER
MUL TEN; AX=SUM*10
ADD AX,NUMBER

CMP AX,TEMP
JNE ENDPR 
INC RESULT

ENDPR:

.exit

end