.MODEL small
.STACK
.DATA
EL1 DB 101, 97, 6, 33, 85, 2, 68, 86, 9, 15, 9, 2

EL2 DB 33, 85, 10, 61, 13, 99, 77, 77, 77, 68, 86, 100
 
ADDITION DB 4*2*3 DUP(?)

.CODE
.STARTUP

;consider that the intially a copy of EL1 must be made to addition
;whatever match are found
XOR AX,AX; temp index or value stored      
XOR SI,SI; index of EL1




loopcopy:
MOV AX, WORD PTR EL1[SI] 
MOV WORD PTR ADDITION[SI],AX
MOV AL, BYTE PTR EL1[SI+2]  
MOV BYTE PTR PTR ADDITION[SI+2],AL
ADD SI,3   ;0-2 3-5 6-8 9-11 12-14 
CMP SI,12
JL loopcopy

;once copied restart register 

XOR AX,AX 
XOR CX,CX 
;must perform the match and add or move to next entry
;BX to perform EL2 index
;DI to perform ADDITION indexing
;SI keep track of the new index on addition
;CX to temporarly store value of el2
loopsum:
MOV CX,WORD PTR EL2[BX]
XOR DI,DI
loopcheck:
MOV AX,WORD PTR ADDITION[DI]
CMP CX,AX
JE found
next:
ADD DI,3
CMP DI,12
JL loopcheck
;not found
MOV WORD PTR ADDITION[SI],CX
MOV CL, BYTE PTR EL2[BX+2]
MOV BYTE PTR ADDITION[SI+2],CL
ADD SI,3
ADD BX,3
CMP BX,12
JL loopsum

found:
MOV CL,BYTE PTR EL2[BX+2]
ADD BYTE PTR ADDITION[DI+2],CL
ADD BX,3  
CMP BX,12
JL loopsum
    

.EXIT