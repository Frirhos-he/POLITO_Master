.model small
.stack
.data

S DB 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
N DB 4
M DB 4
R DB 2 
D DB 16 DUP(?)  
P DB 8; R*M  
Q DW 16;M*N
.startup

;((R*M)+INDEX)%(M*N)
;ROATATE COLUMN TO LEFT: NEW_INDEX= ((R*M)+INDEX)%(M*N)
;MATRIX IS N*M
;M IS MATRIX COLUMN 
;N IS MATRIX ROW
;R IS ROATE NUMBERS  
 
MOV SI,0
MOV DI,0
MOV BX,0
MOV AX,0
MOV DX,0

;NEW_INDEX= ((R*M)+INDEX)%(M*N) 
LOOP1:    CMP SI,16  
          JGE DNPR
          MOV BL,S[SI]  
          MOV AL,P;  R*M
          ADD AX,SI; (R*M)+INDEX
          DIV  Q    ;DL=((R*M)+INDEX)%(M*N)
          MOV DI,DX
          MOV D[DI],BL
          INC SI 
          MOV BX,0
          MOV AX,0
          MOV DX,0
          JMP LOOP1



DNPR: 

.exit

end