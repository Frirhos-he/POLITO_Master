.MODEL small
.STACK
.DATA
SOURCE DB 'A','E','I','M','B','F','J','N','C','G','K','O','D','H','L','P'
DESTINATION DB 16 DUP(?)

.CODE
.STARTUP

;I stored the matrix by column
;read the n BY THE USER

XOR AX,AX
MOV AH,1
INT 21H
;result in al
XOR AH,AH
SUB AL,'0'

CMP AL,0
JE done
CMP AL,4
JE done
;to check


;BX to store values
;SI to store index
XOR BX,BX
XOR SI,SI
XOR DI,DI

;n is the index of rotation left to right
;starting from 4 I decrease the value to get the final
;result, so that from index 0 I cross the rotation


XOR DI,DI

MOV SI,4
SUB SI,AX
SHL SI,2
; so we got the final position
; from 0 the offset is evaluated

loopi:
MOV BX,WORD PTR SOURCE[DI]
MOV WORD PTR DESTINATION[SI],BX

MOV BX,WORD PTR SOURCE[DI+2]
MOV WORD PTR DESTINATION[SI+2],BX

ADD DI,4
ADD SI,4
AND SI,15

CMP DI,15
JAE done
JMP loopi
done:







.EXIT