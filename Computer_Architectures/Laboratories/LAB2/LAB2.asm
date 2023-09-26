 N   EQU 5    ;row num first matrix
 M   EQU 5    ;row dim first matrix, column dim second matrix
 P   EQU 5   ;column num second matrix 
 T   EQU 25  ;to refresh N+P

.MODEL small
.STACK
.DATA 
  
 matrix_one     DB 1,-1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
                               ;N+M DUP(?)
 matrix_two     DB 1,-1,1,1,1,-1,1,1,1,1,1,1,-1,1,1,1,-1,1,1,-1,1,1,-1,1,1
                                ;M+P DUP(?)
 matrix_res     DW T DUP(?)  
 
 columnindex    DW ?
 
 rowindex       DW ?
  

.CODE
.STARTUP
        
        
        
setup:
        XOR CX,CX       
        XOR DI,DI
        MOV CX,T 
        ADD CX,T
        
        CALL zeroing  ;zeroing matrix_res  
        XOR  DI,DI
        XOR  AX,AX 
        XOR  BX,BX
        XOR  CX,CX
        XOR  DX,DX  
        XOR  SI,SI 
        
        
        MOV  CX,M  
        CALL  shiftbycolumn 
        
        MOV AH, 0
        INT 21H
        
            
        
zeroing:
        MOV matrix_res[DI],0
        INC DI
        INC DI   
        CMP DI, CX
        JL  zeroing
        RET    
        
overflowmanage: 
        JO  overflowman 
        
overflowman:
        NEG matrix_res[SI]
        RET      
        
shiftbycolumn: ;DI,BX,SI indexes, CX limit, columnindex  rowindex
        
       
        MOV AL,matrix_one[DI]
        IMUL matrix_two[BX]         ;use different indexes (P)    
        ADD matrix_res[SI],AX      ;store operation
        
        CALL overflowmanage
        
        
        ADD BX, P
        INC DI               ;counter till M =DI
        CMP DI, CX
        JL shiftbycolumn
        
        ;shiftbycolumnoperation
        
        MOV BX, columnindex  ;move to another column 
        ;make multiplication TO FIX INDEX OF DI
        MOV AX,M
        MUL rowindex  
        MOV DI,AX
        
        INC SI                ;increment index of resulting matrix
        INC SI
        INC columnindex
        CMP columnindex, P    ;check if it is needed to move by column
        JL shiftbycolumn 
         
         
        INC rowindex
        MOV columnindex, 0    ;reset columnindex 
        MOV BX,0
        ADD CX, M             ;refresh limit
        MOV AX,M
        MUL rowindex  
        MOV DI,AX   
         
        
         
        CMP rowindex,N          ;check if it is needed to go down by row
        JL shiftbycolumn
        
        RET        