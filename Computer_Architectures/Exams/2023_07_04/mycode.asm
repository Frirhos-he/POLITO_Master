.MODEL small
.STACK
.DATA

FIELD DB 's','b','c','D','E','F','g','H',
      DB   'E','I','A','a','k','n','b','v', 	
      DB   'K','y','t','r','e','d','x','h',	
      DB   'L','L','L','L','L','L','i','i', 	
      DB   'G','g','g','g','G','G','G','Y',	
      DB   'S','Q','R','A','U','I','i','o', 	 
      DB   'W','r','y','u','i','o','p','k',	
      DB   'E','B','N','U','e','e','s','w'


.CODE
.STARTUP

XOR AX,AX ;where to store the value
XOR SI,SI ;where to store the index
XOR DI,DI ;where to store the second index


checkfirst:
   MOV AL,BYTE PTR FIELD[SI]
   CMP AL,'A'
   JE found1
   CMP AL,'a'
   JE found1
   INC SI
   CMP SI,64
   JE exit
   JMP checkfirst
   
   
found1:    
   MOV DI,SI
   INC DI   
   
checksecond:   
   MOV AL,BYTE PTR FIELD[DI]
   CMP AL,'A'
   JE found2
   CMP AL,'a'
   JE found2
   INC DI
   CMP DI,64
   JE exit
   JMP checksecond
   
found2:
   ;DI contains second found
   ;SI contains first found
   ;to check if in the column considers they must between 0-7  
   XOR DX,DX ;final result
   MOV AX,SI ;so we check the column
   AND AX,7
   MOV BX,DI
   AND BX,7
   CMP AX,BX
   JNE next
   MOV DX,2; same column flag
next:
   MOV AX,SI
   MOV BX,DI   
   MOV CX,7
   NOT CX
   ;so we get 11111...000
   AND BX,CX
   AND AX,CX
   ;to check same row we considers removing the offset each value
  ; AND AX,0xFF80
  ; AND BX,0xFF80 
   CMP AX,BX
   JE next1
   JMP exit
next1:
   CMP DX,2
   JE found3
   MOV DX,1
   JMP exit
found3:
   MOV DX,3
exit:   
   
.EXIT