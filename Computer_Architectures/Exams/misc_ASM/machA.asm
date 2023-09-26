.MODEL .small
.STACK
.DATA

BOARD DB 'C','D','A','F','K','K','J','M','C','D','A','F','K','K','J','M','C','D','A','F','K','K','J','M','C','D','A','F','K','K','J','M','C','D','A','F','K','K','J','M','C','D','A','F','K','K','J','M','C','D','A','F','K','K','J','M','C','D','A','F','K','K','J','M'
          ;8X8
.CODE
.STARTUP

XOR AX,AX  ;store value of BOARD
XOR CX,CX  ;store position first occurance
;BRUTE FORCE SIGNIFICA CHE NON DEVO SKIPPARE
XOR DX,DX  ;store position second occurance
XOR SI,SI  ;index board


loop1:
MOV AL,BOARD[SI]

CMP AL,'A'
JE initloop
INC SI
CMP SI,81
JE notfound
JMP loop1



initloop:

   CMP CX,0
   JNE lastloop
   
   MOV CX,SI
   INC SI
   JMP loop1
    
lastloop:


   SUB SI,CX ; 
   AND SI,7  ;
   CMP SI,1
   JNE notfound
   MOV AX,0
   JMP exit
   
notfound:
    MOV AX,0
exit:   

.EXIT
