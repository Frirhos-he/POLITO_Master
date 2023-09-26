.MODEL SMALL

.STACK

.DATA
 
S DB   4,5,9,9,10,8,1,6,3,2
TEMP DB 0  
SORT DW 'A';'D' ;'A' 

.START UP

 
 
;FOR (I=1;I<N;I++)
;{
;   INDEX=I;
;   TEMP=S[I]
;   FOR (J=I+1;J<N;J++)
;   {
;     IF SORT='A' THEN CHECK IF (S[J]=<TEMP) 
;     IF SORT='D' THEN CHECK IF (S[J]>=TEMP)  
;       {
;        TEMP=S[J]
;         INDEX=J
;       }     
;   }  
;   S[INDEX]=S[I]
;   S[I]=TEMP
;}

MOV BX,0; INDEX
MOV SI,0;I
MOV DI,0;J     

LOOP1: CMP SI,10
       JGE ENDPR  
       MOV BX,SI  ;INDEX=I;
       MOV AX,0
       MOV AL,S[SI] ;TEMP=S[I]   
       MOV TEMP,AL   
       
       MOV DI,SI  ; J=I+1
       INC DI
LOOP2: CMP DI,10
       JGE SWAP 
       MOV DX,0
       MOV DL,S[DI] ;S[J]
       CMP SORT,'A'   
       JE ASC 
              
DESC:  MOV CX,0
       MOV CL,TEMP
       CMP DX,CX  ;IF SORT='D' THEN CHECK IF (S[J]>=TEMP) 
       JLE SAVE  
       
NEXTJ:  INC DI
       JMP LOOP2

ASC:   MOV CX,0
       MOV CL,TEMP
       CMP DX,CX  ;IF SORT='A' THEN CHECK IF (S[J]=<TEMP)
     JGE SAVE
     JMP NEXTJ 

SAVE:  MOV DX,0
       MOV DL,S[DI]
       MOV TEMP,DL  ;TEMP=S[J]
      MOV BX,DI      ;INDEX=J
      JMP NEXTJ
 
SWAP:    MOV DX,0
         MOV DL,S[SI]
         MOV S[BX],DL      ;   S[INDEX]=S[I]  
         MOV DL,TEMP
         MOV S[SI],DL;;   S[I]=TEMP
         INC SI
         JMP LOOP1


ENDPR:
.EXIT


END