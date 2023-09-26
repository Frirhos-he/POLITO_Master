.MODEL small
.STACK
.DATA

SOURCE DB 1,2,3,4,5
       DB 6,7,8,9,0
       DB 9,8,7,6,5
       DB 4,3,2,1,0
       DB 7,7,7,7,7
       DB 3,5,7,9,0
       DB 8,7,6,5,4
       DB 9,9,9,3,2

.CODE
.STARTUP

 XOR AX,AX
 XOR BX,BX
 XOR CX,CX 
 XOR DX,DX
 ;ax is the result
 ;cx is the temp varaible
 ;bx is the index
 ;dx is used to evaluate if the index is even
loopi: 
        MOV CL,SOURCE[BX]
        MOV DX,BX
        AND DX,1
        CMP DX,0
        JE addition
        SUB AX,CX
        JMP continue
addition:        
        ADD AX,CX  
        
continue:        
        INC BX
        CMP BX,40
        JNE loopi



.EXIT