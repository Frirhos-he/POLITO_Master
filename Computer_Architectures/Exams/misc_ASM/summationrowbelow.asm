.MODEL small
.STACK
.DATA

SOURCE DB 1,2,3,4,5,6,7,8,9
DESTINATION DW 9 DUP(?)


.CODE
.STARTUP

XOR AX,AX
XOR BX,BX
XOR SI,SI
XOR CX,CX



loopo:
   MOV BX,SI
   ADD BX,3 ; the idea is first retrieve the value below the row
   CMP BX,9
   JGE anding ; anding in case out of border
continue:
   MOV AL,BYTE PTR SOURCE[BX]   ;store the value in ax
   MOV CL,BYTE PTR SOURCE[SI]   ;store the indexed value in cx
   ADD AX,CX           ;make the sum 
   MOV BX, SI          ;taking the index
   SHL BX,1            ;shift because of dw
   MOV DESTINATION[BX],AX ;store the result
   INC SI              ;increment the index
   CMP SI,9            ;checking if loop end
   JNE loopo
   JMP exit            ;avoid perfoming anding again 
anding:
   SUB BX,9
   JMP continue
   
exit:
    
.EXIT