.model small
.stack
.data
S DB 7,8,0,10,2,0,9,4,5,3
MAX1 DB 0
MAX2 DB 0  
.startup
       
 ;   IF( S[0]>=S[1]  )
;   {
;       MAX1=S[0];
 ;      MAX2=S[1]
  ; }
 ;  ELSE
    ;{
;       MAX1=S[1];
 ;      MAX2=S[0]
  ; }
       
;FOR (I=2;I<N;I++)
;{

  
    ; IF(S[I]>=MAX1)
    ;{   
       ; MAX2=MAX1
      ; MAX1=S[I]  
         
    ;}
    ; ELSE IF(S[I]>=MAX2)
       ;{
          ; MAX2=S[I] 
       ;}                  
  
;}     

 MOV AX,0 
 MOV BX,0
 MOV AL, S[SI] 
 INC SI
 MOV BL,S[SI] 
 INC SI 
 CMP AX,BX
 JL SET
 MOV MAX1,AL
 MOV MAX2,BL 
 JMP LOOP1
 
SET: MOV MAX2,AL
     MOV MAX1,BL
 
 
LOOP1: CMP SI,10
          JGE ENDPR
           MOV AL,S[SI] 
           CMP AL,MAX1
           JL  ELSE
           MOV BL,MAX1
           MOV MAX2,BL
           MOV MAX1,AL
NEXT:      INC SI 
           JMP LOOP1

ELSE:      CMP AL,MAX2
           JL  NEXT
           MOV MAX2,AL
           JMP NEXT

ENDPR: 
.exit

end