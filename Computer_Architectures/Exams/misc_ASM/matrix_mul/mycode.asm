.MODEL SMALL 
.STACK

.DATA
S1 db 0,1,2,3,4,5,6,7,8
S2 db 0,1,2,3,4,5
D db 6 dup(?)  
M db 3
N DB 2
K DB 0
P DB 0
SISET DW 0
RESULT DB 0   
L DB 0
.STARTUP
 
LOOP3: CMP K,3        ;OUTER LOOP ITERATE FOR M TIMES WITH COUNTER K
       JGE ENDPR
       
       
LOOP2: CMP P,2            ;INTERMADIATE LOOP ITERATE FOR N TIMES WITH COUNTER P
       JL  CONT2
        
        INC K
        MOV CX,SISET
        ADD CL,M
        MOV SISET,CX   ; EACH TIME ROW COUNTER+M   
        MOV DI,0
        MOV P,0
        JMP LOOP3
                     
       
CONT2:  MOV AX,0
        MOV AL,P            ; USE P COUNTER TO INITIALIZE DI THE INDEX OF SECOND MATRIX
        MOV DI,AX
        MOV  SI,SISET 
       
        MOV L,0  
        MOV  RESULT,0        

LOOP1:  CMP L,3               ; INNER LOOP ITERATE FOR M TIMES WITH COUNTER L
        JL CONT1            
        MOV DX,0
        MOV DL,RESULT          ; SAVE RESULT TO DESTINATION
        MOV D[BX] ,DL
        INC BX         ;INC DESTINATION MATRIX INDEX
        INC P         ; INC LOOP2 COUNTER
        JMP LOOP2      


CONT1:   MOV AX,0              ;   LOAD  ELEMENTS OF MATRIX S1 AND S2 THEN MUL
         MOV AL,S1[SI]
         MOV DX,0
         MOV DL, S2[DI]
         MUL DL
         ADD RESULT,AL  
         INC SI       
         MOV AX,0
         MOV AL,N
         ADD DI,AX             ; FOR NEXT ITERATION INDEX OF SECOND MATRIX SHOULD BE ADDED TO N
         INC L    ; INC LOOP1 COUNTER
         JMP LOOP1

               
ENDPR:
 
 
.EXIT


END