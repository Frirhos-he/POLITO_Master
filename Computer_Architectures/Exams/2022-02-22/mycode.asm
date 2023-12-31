.model small
.stack
.data
 
SOURCE db 1,2,-3,4,-5,6,-7,8,-9,0,3,-1
DESTINATION   DB 12 DUP(?)
M DW 3
N DB 4
P DB 12  ;M*N
I DB 0   ; ROW COINTER  
J DB 0; COL COUNTER
.startup

MOV CX,0
MOV BX,0
MOV AX,0
MOV DI,0; COUNTER OF SOURCE  MATRIX
MOV SI,0;COUNTER OF DEST MATROX
 
;FOR I=0  NEWINDEX=INDEX*M
;FOR I>0  NEWINDEX=((INDEX*M)%P)+I 
 
LOOP1: CMP SI,12  ; IF SI=12 WE HAVE PARSED ALL SOURCE CELLS
       JE  ENDPR 

        CMP J,4    ;FOR EACH J=4 INC I AND RESET J
        JNE LOAD
        MOV J,0
        INC I
     
LOAD:   MOV CL,SOURCE[SI]  ;LOAD ELEMENT OF SOURCE
        NEG CL; COMPUTE NEGATIVE OF LOADED ELEMENT   
        
        ;FOR I=0  NEWINDEX=INDEX*M
        MOV AX,SI
        MUL M; AX= INDEX*M 
        MOV DI,AX
        CMP I,0
        JE SAVE 
        
        ;FOR I>0  NEWINDEX=((INDEX*M)%P)+I 
        DIV P; AX/P --> AH=(INDEX*M)%P
        MOV BL,AH
        ADD BL,I;((INDEX*M)%P)+I
        MOV DI,BX 
 
SAVE: MOV DESTINATION[DI],CL ;SAVE NEG ELEMENT IN DEST
      INC SI
      INC J
      JMP LOOP1


ENDPR:

               
.exit

end