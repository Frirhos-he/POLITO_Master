.MODEL small
.STACK
.DATA

SOURCE DW 10,20,100,10000
       DW 0,7000,1,2
       DW 9000,12345,999,30000
       DW 200,210,7,65000

MAPP DB 16 DUP(?)
CROSS DW 0

.CODE
.STARTUP

XOR AX,AX
XOR BX,BX ; masking and storing mapp
XOR SI,SI
XOR DI,DI

;to see if a value is on 8 bit I can just mask to 0xFF
;observing if the value is the same

;si index of the matrix (DI shifted)
loopi:
MOV SI,DI
SHL SI,1

MOV AX,WORD PTR SOURCE[SI]
MOV BX,AX
AND BX,0xFF
CMP AX,BX ;8 bits
JNE not8bits
; 8 bits 
MOV BX,1
MOV BYTE PTR MAPP[DI],BL 
ADD CROSS, AX

JMP goon
not8bits:
MOV BX,0
MOV BYTE PTR MAPP[DI],BL     
     
goon:
INC DI
CMP DI,16
JNE loopi



.EXIT