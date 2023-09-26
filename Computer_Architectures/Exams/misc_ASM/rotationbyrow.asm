.MODEL small
.STACK
.DATA
SOURCE DW 'A','B','C','D','E','F','G','H','J','K','L','M','N','O','P'
DESTINATION DW 16 DUP(?)


.CODE
.STARTUP

XOR AX,AX
XOR BX,BX
XOR SI,SI
XOR CX,CX
XOR DX,DX

;provide n

MOV AH,1
INT 21H
;RESULT IN AL (N)
XOR AH,AH
SUB AL,'0'

MOV AX,81
MOV BX,4
; to extent 1<=3 to 80<=120 
; consider that the value n should be anyway going to range 1<=3, any other values are inifluent
; 80/4 nothing 20/4 nothing 5, the idea is to remove as many 4 as possible and use the remainder
; to perform evaluation
DIV BL
MOV AL,AH
XOR AH,AH

;so I use CX as temp variable
; to get into n*4 positions I need to evaluate SI=2*((n*4) +offset)
loopi:

    MOV BX,DX
    SHL BX,1
    MOV CX,SOURCE[BX]
    MOV SI,AX
    SHL SI,2
    ADD SI,DX
    AND SI,15
    SHL SI,1
    
    MOV DESTINATION[SI],CX 
    INC DX  
    CMP DX, 16
    JNE loopi
    
    ; I use dx as index for my source (no multiplied by 2)
    ; then I use bx to do the doubling to store the result
    ; then I move n to SI, multiply by 4 and sum the offset
    ; finally I xor the result and multiply by 2 so that I get
    ; the right index, put the result on destination and go on 


.EXIT
