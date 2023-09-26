MAX     EQU  50  
k       EQU  5  
OCC     EQU  6  
ENTER   EQU  13

.MODEL small
.STACK
.DATA  
   
line  DB MAX DUP(?) 
index DW 0

.CODE
.STARTUP                                
     

setup:
        XOR DI,DI 
        MOV index, DI
        
                  
read:       
     
        MOV AH,1
        INT 21H                       ; read a character store it in AL

	    MOV line[DI], AL        ; store the character                  
         
        
        
        CALL check                                
        INC DI
        
        CMP DI,MAX
        JNZ read                  ; continue to read till max   
        JMP exit


check:                                
        CMP AL, ENTER                 ; check if enter was pressed    
        JE occ                   ; jump if equal  
        RET   
  
occ:     

        MOV index, DI    
        XOR DI,DI 
        JMP occured


occured:
        
        MOV BL, line[DI] 
        ADD BL, k
        CMP BL, 90H
        JG  lowercase
        
        
        
         
        MOV AH,2 
        MOV DL,BL
        INT 21H    
        
        INC DI                  ; go to next element    
        CMP DI,index
        JNZ occured
        RET      


lowercase:
        CMP BL,7AH
        JG  overbound
        
        MOV AH,2 
        MOV DL,BL
        INT 21H    
        
        INC DI                  ; go to next element    
        CMP DI,index
        JNZ occured
        RET
                                 
overbound:
        XOR AX,AX
        MOV AL,BL
        MOV CL,51
        DIV CL
        MOV BL,AL 
        ADD BL,41H
        CMP BL, 90H
        JG  lowercase
         
        MOV AH,2 
        MOV DL,BL
        INT 21H    
        
        INC DI                  ; go to next element    
        CMP DI,index
        JNZ occured
         
                   
exit:


.EXIT
END    