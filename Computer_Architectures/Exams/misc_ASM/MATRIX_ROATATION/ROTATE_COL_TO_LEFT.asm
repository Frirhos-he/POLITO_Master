.MODEL SMALL
.STACK
.DATA
S DB 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15  
D DB 16 DUP(?)
M DB 4  ;MATIX SIZE M*M
N DB 3  ;ROATATE   
J DB 0; COL_CLOUNTER   
I DB 0; ROW_COUNTER
.STARTUP
  
  ;FOR J<N  NEW_INDEX=(M*I)+(J+M-N)
  ;FOR J>=N NEW_INDE=(M*I)+(J-N)
 
 MOV SI,0; INDEX OF S
 MOV DI,0; INDEX OF D 
 MOV CX,0
 
LOOP1:   CMP SI,16
         JE  EBDPR
         CMP J,4
         JNE BODY
         MOV J,0
         INC I

BODY:    MOV CL,S[SI]
         CMP J,3
         JL  JBELOW 
         
         MOV AL,M                 ;FOR J>=N NEW_INDE=(M*I)+(J-N)
         MUL I; AL=M*I
         ADD AL,J; M*I+J
         SUB AL,N  ; M*I+J-N
         MOV DI,AX

SAVE:    MOV D[DI],CL
         INC SI
         INC J
         MOV AX,0
         MOV CX,0
         JMP LOOP1
     
    
JBELOW:   MOV AL,M    ;FOR J<N  NEW_INDEX=(M*I)+(J+M-N)
          MUL I; AL=M*I            
          ADD AL,J   ;(M*I)+J
          ADD AL,M  ;(M*I)+J+M
          SUB AL,N   ;(M*I)+(J+M-N)
          MOV DI,AX
          JMP SAVE
            
EBDPR: 
 
  
.EXIT

END