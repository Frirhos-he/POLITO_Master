.MODEL small
.STACK
.DATA

FIRST DW 1101010111110001B 
SECOND DB 11111011B 
RESULT DB 3 DUP(?)
.CODE
.STARTUP
 
;FIRST HAS 12 BITS FRACTIONAL PART
;SECOND HAS 2 BITS FRACTIONAL PART
;MAX PRECISION TO RESULT
;OVERALL SOLUTION SINCE DW
;16 BITS - 12 BITS PRECISION = 10 BITS INTERGER
;8 BITS - 2 BITS PRECISION = 6 BITS
; worst case for integer part 2^10-1+2^6-1 = 2^6*2^4-1 +2^6-1
; 2^6(2^4+1)-2 --> 2^11-2 --> 11bits approximally integer part
;instead 12 bits for decimal part
; 11+12 = 23 --> 3byte are sufficient

XOR AX,AX
XOR BX,BX
XOR SI,SI

MOV AX,FIRST ;first we copy the first 12 bits
AND AX,0x0FFF

MOV BL, SECOND
;SHIFT left by 12-2 positions
AND BX,0x0003
SHL BX,10
ADD AX,BX ;result of decimal on result
MOV WORD PTR RESULT, AX
;now integer

MOV AX,FIRST
AND AX,0xF000
MOV BL,SECOND
AND BX,0x00FC 
SHR AX,12
ADD AX,BX
SHL AX,4 ; because decimal of 12 bits store on RESULT+integer
;RESULT INT(carrybit) | DECIMAL
;RESULT               8+4<--
ADD WORD PTR RESULT+1,AX

.EXIT