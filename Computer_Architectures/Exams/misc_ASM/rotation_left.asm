.MODEL small
.STACK
.DATA  

SOURCE DB 'A','E','I','M','B','F','J','N','C','G','K','O','D','H','L','P'

.CODE
.STARTUP



XOR AX,AX
MOV AH,1
INT 21H
;AL


XOR AH,AH

;first evaluate the offset
SUB AL,'0'
;so if 0 or 4 is same
CMP AL,0
JE ended
CMP AL,4
JE ended
                
XOR SI,SI 
XOR DI,DI
XOR DX,DX
;that is the offset
;having a counter till 4 



loopo:
    SUB AX,1
    CMP AX,0
    JL ended  
    MOV DX,3 
MOV SI,DX 
SHL SI,2
MOV DI,SI ; what we do is to use 2 indexes
;SI used for the index previous to DI
;we move ascii value 2 at a time with BX and CX,
;exchaging one another till we get to the point where
;SI is below to 0 then I just fill it with 12
;and once DI is below to 0 just decrement the user m and do again
;till the 0 is reached to m and I can exit 
loopi:


                           
MOV BX,WORD PTR SOURCE[DI]
SUB SI,4
AND SI,15
MOV CX,WORD PTR SOURCE[SI]
MOV WORD PTR SOURCE[SI],BX
MOV WORD PTR SOURCE[DI],CX
 
MOV BX,WORD PTR SOURCE[DI+2]
MOV CX,WORD PTR SOURCE[SI+2]
MOV WORD PTR SOURCE[SI+2],BX
MOV WORD PTR SOURCE[DI+2],CX


SUB DX,1
CMP DX,0
JL loopo
 
JMP loopi

ended:



.EXIT