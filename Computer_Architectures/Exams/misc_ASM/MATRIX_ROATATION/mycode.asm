.model small
.stack
.data
S DB 0,1,2,3,4,5,6,7,8,9,10,11  
D DB 12 DUP(?)
N DB 4
M DB 3
R DB 1 
P DB 12 
.startup

             ;NEW_INDEX=(R*M)+INDEX]% (M*N)

LOOP1:   CMP SI,12
         JGE ENDPR
         MOV AX,0
         MOV AL,M
         MUL R ;   AL=R*N
         MOV AH,0
         ADD AX,SI; (R*N)+INDEX
         DIV P    ;AH=(R*N)+INDEX]% (M*N) 
         MOV BX,0
         MOV BL,AH     
         MOV AX,0
         MOV AL,S[SI]
         MOV D[BX],AL
         INC SI
         JMP LOOP1
         

ENDPR: 
.exit

end