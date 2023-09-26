.MODEL SMALL
.STACK
.DATA   
FIELD DB "0","0","0","0","0","0","0","0",
    DB "0","5","2","3","4","5","7","0",
    DB "0","4","2","2","2","2","2","0",
    DB "0","6","5","4","9","8","9","0",
    DB "0","7","4","1","2","4","7","0",
    DB "0","9","9","9","9","9","9","0",
    DB "0","4","5","6","7","6","5","0",
    DB "0","0","0","0","0","0","0","0"
RES DB ?

.CODE
.STARTUP        

     XOR AX,AX
     XOR CX,CX
     MOV SI,10 ;k 
     MOV CL, BYTE PTR FIELD[SI]
     SUB CX,'0'
     CMP CX,0   ; border must return 0
     JE return0
     
     ; SI contains the * position
     ; avoiding brute force thus crossing the whole matrix just
     ;consider the sum of the cells
     
     MOV AX,0
     SUB SI,1
     MOV CL, BYTE PTR FIELD[SI]
     SUB CX,'0'
     
     ADD AX,CX
     ADD SI,2 
     MOV CL, BYTE PTR FIELD[SI]
     SUB CX,'0'
     ADD AX,CX
     SUB SI,1

     
     
          
     SUB SI,8
     MOV CL, BYTE PTR FIELD[SI]
     SUB CX,'0' 
     ADD AX,CX
     ADD SI,16
     MOV CL, BYTE PTR FIELD[SI]
     SUB CX,'0' 
     ADD AX,CX
     
     MOV RES, AL
     JMP exit


return0:          
    MOV AX,0
    MOV RES, AL
exit:

.EXIT