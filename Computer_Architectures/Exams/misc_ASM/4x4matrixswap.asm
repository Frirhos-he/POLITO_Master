N EQU 3

.MODEL small
.STACK
.DATA
SOURCE DB 1,2,3,4, 5,6,7,8 ,9,10,11,12, 13,14,15,16
.CODE
.STARTUP

MOV CX, 8  ; 2*4
XOR SI, SI

loop:
     MOV AL, 4 	;store 4 in AL
     XOR DX,DX 	;zeroing DX
     MOV DL,N
     MUL DL    	;multiply AL*DL = AX	
     ADD AX, SI   ;add 4*N+x   
     AND AX,15  
     MOV BX,AX
     MOV DL, SOURCE[BX]    ;DX = Source(4*N+x)
     XOR DL, SOURCE[SI]    ;
     XOR SOURCE[SI],DL
     XOR DL, SOURCE[SI] 
     MOV SOURCE[BX],DL
     INC SI 
     LOOP loop
     .EXIT
     END