MAX     EQU  50  
MIN     EQU  20 
OCC     EQU  6 
ENTER   EQU  13 
NWL     EQU  10
ALP     EQU  52 
OFF     EQU  41H     ;A
ALPH    EQU  26
OFF1    EQU  60H 
OFFNUM  EQU  48 


.MODEL small
.STACK
.DATA  

first_line  DB MAX DUP(?) 
alphabet    DB ALP DUP(?) 
index1      DW ?   
numtimes    DB ?  
chartimes   DB ?

.CODE
.STARTUP                                
     
 
setup:
        MOV AH, 2           ; new line
        MOV DL, NWL
        INT 21H  

        MOV BX, MIN         ; to consider the minimum insertion                                                     
        MOV CX, MAX         ; to decrement vector intex to 50    

        MOV AH, 1           ; set AH for reading propedeutic for 21H
        
   
lab1:   

        INT 21H                       ; read a character store it in AL
        XOR DI,DI
	    MOV first_line[DI], AL        ; store the character
        INC index1                    ; go to next element
                                       
        DEC BX
        DEC CX   
        
        
        CALL check                                
        
        
        CMP DI,MAX
        JNZ lab1                  ; continue to read till max   
        JMP EXIT
         

check:                                
        CMP AL, ENTER                 ; check if enter was pressed    
        JE decision                   ; jump if equal  
        RET   
             
        
decision:                         ; check if >20
        CMP BX, 0                 ; jump if not equal (so got the min) A-B=RES
        JLE occurence1
        RET

            
               

occurence1:

        XOR DI, DI 
        CALL zeroing 
        
        MOV AH, 2       ;print new line
        MOV DL, NWL
        INT 21H
                      
                      
        XOR AL,AL              
        XOR DI,DI         ;logica
        CALL counter1
        
           
                     
        MOV BX, OFF       ;print 
        XOR DI, DI          
        
        CALL printhigh 
        
        ADD BX,OCC
        
        CALL printlow
        
        MOV numtimes, 0       ;max occurance  
        MOV chartimes, 0
        XOR DI,DI   
        CALL maxtime         
        
        MOV AH,2
        MOV DL,numtimes
        CALL convNUMtoASCI
        
        MOV AH,2
        MOV DL,chartimes      ;character appearing more times
        INT 21H                                              
        
                                
        XOR AH,AH
        MOV AL, numtimes      ;halve the content of numtimes 
        MOV BL,2
        DIV BL
        MOV numtimes, AL 
        
        
        MOV AH, 2           ; new line
        MOV DL, NWL
        INT 21H                        
        
        
        XOR DI,DI
        XOR BX,BX                   
        CALL moretimes                  
        
         
        
        JMP EXIT
        
        RET         
        
moretimes:                     ;;for max/2 occurances
        MOV BL,alphabet[DI] 
        CMP numtimes,BL
        JLE charconversionprint  
        INC DI                  ; go to next element    
        CMP DI,ALP
        JNZ moretimes
        RET      
      
maxtime:                   
        MOV BL,alphabet[DI] 
        CMP numtimes,BL
        JL  swap  
        INC DI                  ; go to next element    
        CMP DI,ALP
        JNZ maxtime
        RET       

swap:
        MOV numtimes,BL         ; Move number occurances

        CALL charconversion    
        
        INC DI
        CMP DI,ALP
        JNZ maxtime
        RET       

charconversionprint:

            CALL charconversion             
            MOV AH, 2                  ; word supposed to be written
            MOV DL, chartimes          ;char to be written 
            INT 21H
            
            INC DI
            CMP DI,ALP
            JNZ moretimes 
            JMP EXIT
 
charconversion:
            
            MOV AX,DI
            MOV chartimes, AL 
            ADD chartimes,OFF  
            CMP chartimes,5aH    
            JGE lowercaseconversion

            RET
          


lowercaseconversion:       

         ADD chartimes, OCC                   
         RET


        
printlow:
        MOV AH, 2           ; word supposed to be written
        
        MOV DL, BL          ;char to be written 
        INC BX 
        INT 21H
        
        MOV DL, ':'          ;: to be written  
        INT 21H  
            
        XOR DH,DH    
        MOV DL, alphabet[DI]     ;occurances to be written  
        CALL convNUMtoASCI 
        INC DI
        
        
        
        MOV DL, ' '     ;occurances to be written 
        INT 21H                                  
        
        CMP DI,ALP                    ;higher case
        JNZ printlow  
        RET


        
        
printhigh:    
        MOV AH, 2           ; word supposed to be written
        
        MOV DL, BL          ;char to be written works
        INC BX 
        INT 21H
        
        MOV DL, ':'          ;: to be written  works
        INT 21H  
            
        XOR DH,DH    
        MOV DL, alphabet[DI]     ;occurances to be written  
        CALL convNUMtoASCI 
        INC DI
        
        
        
        MOV DL, ' '     ;occurances to be written 
        INT 21H                                  
        
        CMP DI,ALPH                    ;higher case
        JNZ printhigh   
        RET
        
convNUMtoASCI:
        
        
        PUSH BX
        
        MOV BH,10        ;denominator
        XOR AH,AH
        MOV AL,DL        ;numerator
        DIV BH    
        
        MOV BL,AL        ;move the quotient to BL  
        MOV BH,AH        ;move the remainder to BH
        MOV AH,2       

        MOV DL, BL       ;Store the quotient to be printed
        ADD DL,OFFNUM 
        INT 21H                                            
         
        MOV DL, BH       ;store the remainder to be printed
        ADD DL,OFFNUM 
        INT 21H   
        POP BX   
        RET 

               

counter1:
                           
                            
        MOV BL, first_line[DI] 
        SUB BL,OFF                  ; VALUE-OFFSET   
      
        CMP BL,0                    ;upper case
        JL ignore
        CMP BL,30H                  ;lower case
        JG ignore
        CMP BL, 19H                 ;uppercase char
        JLE uppercase
        CMP BL,20H
        JGE lowercase               ;lowercase char
      
        INC DI                      ;ignoring middle exceptions
        CMP DI,index1
        JNZ counter1
        RET 
        
ignore:
        INC DI
        CMP DI, index1
        JNZ counter1 
        RET

uppercase: 
        XOR BH, BH
        INC alphabet[BX]            ;found a correspondance
        INC DI 
        CMP DI, index1
        JNZ counter1 
        RET   
        
lowercase:
        
        XOR BH, BH 
        SUB BL, OCC
        INC alphabet[BX]            ;found a correspondance
        INC DI 
        CMP DI, index1
        JNZ counter1 
        RET
        
        
zeroing:  
        
        MOV alphabet[DI], 0     ; store the occurences
        INC DI                  ; go to next element    
        CMP DI,ALP
        JNZ zeroing
        RET       

exit:                                

.EXIT
END   
            