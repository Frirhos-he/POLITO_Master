.MODEL small
.STACK
.DATA  

SOURCE DB 1,2,3,4,5
       DB 5,4,3,2,1
       DB 1,2,3,4,5
       DB 5,4,3,2,1
       DB 1,2,3,4,5
RESULT DW 0
;cut by columns      

.CODE
.STARTUP       


XOR AX,AX ;temp variable
XOR BX,BX ;counter           
XOR SI,SI ;index
;consider that i and j are just index of matrix actually
;there is not need to keep track of them
loopi:
   
   MOV AX,SI
   SHR AL,1 ;so i+j = i*2--> i 
   MUL AL   ;so i*i
    
   MOV BL,BYTE PTR SOURCE[SI]
   MUL BL
   ADD RESULT,AX
   
   ADD SI,13
   CMP SI,144
   JLE loopi
   ;it should be the index 



.EXIT