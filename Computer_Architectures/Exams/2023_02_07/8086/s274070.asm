.MODEL SMALL
.STACK
.Data   
XFIELD   db 'C', 'D', 'D', 'F', 'K', 'K', 'J', 'Z', 'A', 'B', 'A', 'B', 'D', 'H', 'G', 'R', 'K', 'K', 'O', 'O', 'P', 'U', 'Y', 'R', 'E', 'V', 'R', 'W', 'W', 'W', 'W', 'F', 'R', 'Y', 'R', 'S', 'T', 'T', 'T', 'T', 'T', 'T', 'T', 'O', 'P', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'N', 'B', 'D', 'S', 'E', 'H', 'T', 'U', 'I', 'U', 'X', 'R', 'A', 'R', 'T', 'S', 'W', 'A', 'K', 'U', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'P'
XPOSITION DB 4 DUP(?)  ;INDEX OF 'A'
XDIAG DB DB 4 DUP(?)   ;IF IT IS IN SECOND DIAGONAL  
N DB 9   ;MarTRIX SIZE
I DB 0 ;ROW COUNTER    
J DB 0; CONTROL ROW  
M DB 0
.startup                                               

    ;SECOND DIAGONAL CAN FIND IN INDEX=(N-1)*(I+1)
      
      MOV SI,0; INDEX OF   XFIELD
      MOV DI,0; INDEX OF XPOSITION  
      MOV BX,0; INDEX OF   XDIAG   
      MOV AX,0
      MOV AL, N
      SUB AL,1;  
      MOV M,AL  ; HERE CREATE N-1
      MOV AX,0   ; CKLEAN AX
      
LOOP1:  CMP SI,81   ;;;;; 9--->>16
        JGE ENDPR      
         
         CMP J,9
         jne CONT      ; FOR EACH TIME J==9 THEN RESET and INC I   ;;;;;;;;;;;;   jge-->jne
          
          MOV J,0
          INC I
         
CONT:      MOV AL,XFIELD[SI]  
      CMP AL,'A' 
      JNE NEXT  ;NOT FOUND GO TO NEXT CELL
      MOV AX, SI
      MOV XPOSITION[DI],AL 
      INC DI 
      MOV AX,0
      MOV AL, M  ;  AL=N-1
      MOV DX,0
      MOV DL,I
      ADD DL,1; DL=I+1   
      MUL DL;AL= (N-1)*(I+1)
      CMP AX, SI; IF INDEX= (N-1)*(I+1) MEANS IT IS IN SECOND DIAGONAL
      JNE SET0    
      MOV AX,0
      MOV AL,1 
      
SAVE:     ; HERE SAVE TO XDIAG 
       MOV XDIAG[BX] ,AL
      INC BX; SET NEXT ITERATION OF  XDIAG   
      JMP NEXT
      
       
      
SET0:   MOV AX,0         ; NOT IN SECOND DIGONAL  
         JMP SAVE

NEXT:   INC SI        ;SET INDEX FOR NEXT ITERATION  
        INC   J
        JMP LOOP1      
 
 
 
ENDPR: 
 
.exit

end