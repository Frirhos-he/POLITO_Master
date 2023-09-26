;Given a 4 x 4 matrix of bytes SOURCE  write a 8086 assembly program which rotates the columns of SOURCE from right to left by 0<=n<=4 positions, with n given by the user.
;The choice is yours about how to store the matrix in the memory. Please add significant comments to the code and instructions

.MODEL .small
.STACK
.DATA

SOURCECOL DB 'A','E','I','M','B','F','J','N','C','G','K','O','D','H','L','P'         
BUFFCOL DB 16 DUP(?)
         
.CODE
.STARTUP

XOR AX, AX  
XOR CX, CX
XOR SI, SI                  
XOR DX,DX
;dx is a counter                
;read ax 0 <= n <= 4
MOV AH, 1
INT 21H
SUB AL , '0' ;get from the ascii the number                      
;AX = 0 , CX = n   
MOV CL,AL
XOR AX,AX

CMP CX,0
JE exit
CMP CX,4
JE exit            
   
; 1-3
MOV AX,4   ;we start the shif
MUL CL
MOV DX,AX
XOR AX,AX
 
          
loopColumn:
    MOV AX, WORD PTR SOURCECOL[SI]
    MOV BX, WORD PTR SOURCECOL[SI+2]
    ADD SI,4
             
    MOV DI,12  ;we start from 16          16
                                                       
    SUB DI,DX  ; 16-8=8
    ADD DI,SI  ; 8+4 = 12
    AND DI,15 ; so it starts agian on 0 0-15
        
    MOV WORD PTR BUFFCOL[DI], AX
    MOV WORD PTR BUFFCOL[DI+2], BX 
    XOR DI,DI
    
    CMP SI,16 ; finished reading
    JE bringback
    JMP loopColumn
    
bringback:             
     
    MOV AX, WORD PTR BUFFCOL[DI]
    MOV BX, WORD PTR BUFFCOL[DI+2]  
    MOV WORD PTR SOURCECOL[DI], AX
    MOV WORD PTR SOURCECOL[DI+2], BX 
    ADD DI,4
    CMP DI,16
    JE exit
    JMP bringback  
exit:

.EXIT