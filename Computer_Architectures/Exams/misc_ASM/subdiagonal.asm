;2021.06.23
;Given a 5 x 5 matrix of bytes SOURCE representing unsigned numbers, write a 8086 assembly
;program which computes on 16 bits the sum of all cells excluding these on the main diagonal, i.e. upper
;left-to-lower-right diagonal, minus the sum of all the cells of the same main diagonal.
;Please add significant comments to the code and instructions.
;Friendly advice: before starting to write down the code, think at a possible (very) simple algorithm! The
;choice of the algorithm highly influences the complexity and length of the code.
;Example:
;matrix SOURCE
;1 2 3 4 5
;6 7 8 9 0
;9 8 7 6 5
;4 3 2 1 0
;7 7 7 7 7
;all cells excluding the main diagonal:
;2+3+4+5+
;6+8+9+0+
;9+8+6+5+
;4+3+2+0+
;7+7+7+7= 102
;all cells on the main diagonal
;1+7+7+1+7= 23
;Result (on 16 bits in two’s complement) = 102-23 = 79
.MODEL small
.STACK
.DATA

SOURCE DB 1,2,3,4,5,6,7,8,9,0,9,8,7,6,5,4,3,2,1,0,7,7,7,7,7


.CODE
.STARTUP
; the algorithm I applied consist of a summation of the whole matrix into the result
; minus 2 times the diagonal to get the final result
; it is possible and no overflow because the summation in the worst case would be
; 5*5*2^8 2^3*2^3*2^8 --> 8+6 = 14 no overflow since max is 16 (unsigned)

XOR AX,AX ; temp value
XOR SI,SI             
XOR BX,BX ; result
; index of matrix
loopi:
MOV AL, BYTE PTR SOURCE[SI]
ADD BX,AX      
INC SI
CMP SI,25
JE done
JMP loopi
done:           
XOR SI,SI
XOR AX,AX
loopsub:
MOV AL, BYTE PTR SOURCE[SI]
SUB BX,AX 
SUB BX,AX
ADD SI,6
CMP SI,25
JA donef
JMP loopsub
donef:

.EXIT