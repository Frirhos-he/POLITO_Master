       		AREA constants, DATA, READONLY
inputData	DCB 3, -14, 15, -92, 65, 35, -89 				
					
		AREA variables, DATA, READWRITE
outputData space 12


        area myfunctiion,code,readonly
			
		LDR 	R0,=inputData
		LDR     R1,=outputData
		MOV R2,#7
		BL 	copyData
		
		
		LDR     R0,=outputData
		MOV R1,#7
		BL bubbleSort
;	write the copyData subroutine in ARM assembly language, which copies the content of the first area of memory to the second one. The subroutine receives in input:
;-	the address of the first area of memory
;-	the address of the second area of memory
;-	the number of elements declared in the first area of memory
		
copyData  PROC
	PUSH{R3-R12,LR}
	MOV R4,#0 ; COUNYER FOR inputData
LOOP1   CMP R4,R2
        BGE END1
	LDRB R3,[R0,R4]
	STRB R3,[R1,R4]
	ADD R4,#1
	B LOOP1
	


END1   POP{R3-R12,PC};;;;;;move pop here
          ENDP
			
;------------------------------------------------------------			
bubbleSort    PROC
           EXPORT bubbleSort
;Then, write the bubbleSort subroutine, which receives in input:
;-	the address of an area of memory (READWRITE)
;-	the number of elements in the area (7 in the previous example)
;The procedure does not return any value. It sorts the elements, rewriting the area of memory, by means of the bubble sort algorithm. The pseudocode of the bubble sort is the following (A is the array to sort):
;1.	n ? length(A)
;2.	swapped ? false
;3.	while not swapped and n > 0
;4.	        swapped ? false
;5.	        for i = 1 to n - 1
;6.	                if A[i - 1] > A[i] then
;7.	                        swap(A[i - 1], A[i])
;8.	                        swapped ? true
;9.	        n ? n - 1
           
	 PUSH{R2-R12,LR}
           MOV R2,R1;   R2=N
		   MOV R3,#1 ; SWAPPED=T
		   MOV R4,#1  ;i   =R4
		   
		
;		   
LOOPWHILE		CMP R3,#1   ;3.	while  swapped and n >1
		BNE END2
		CMP R2,#1
		BLE END2
		
LOOP2		MOV R3,#0  ; STEP4 swapped ? false
		
		   MOV R12,R2   ;C REATE N-1 =R12
		SUB R12,#1; R12=N-1
		MOV R4,#1  ;i   =R4;;------------> ADDED
		
LOOP3		CMP R4,R12   ; for i = 1 to n - 1  ;;------------>LOOP3 ADDED
		 BGT NEXT ;------->   BGE END2-->BGT NEXT 
		 ;if A[i - 1] > A[i] then
		 SUB R5,R4,#1; R5=i-1
		 
		 
		 LDRB R6,[R0,R5];A[i - 1];;------------>	[r0,r5] R0 ADDED
		 LDRB R7,[R0,R4]; A[i;;------------>	[r0,r4]     R0 ADDED

		  
	    
	    SXTB R6, R6;;------------>  ADDED
		SXTB R7, R7;;------------>  ADDED
	
		 CMP R6,R7
		BLT NEXT1; ----->BGE NEXT->BLT NEXT1

		 
		 ;swap(A[i - 1], A[i])
	    ;swapped ? true
		MOV R8,R6
		MOV R6,R7
		MOV R7,R8
		MOV R3,#1
		 STRB R6,[R0,R5];;------------>  ADDED
		 STRB R7,[R0,R4]; ------------> ADDED
NEXT1   ADD R4,#1       ;;--->ADDED
         B LOOP3   ;;--->ADDED
		 
NEXT	SUB R2,#1          ; n ? n - 1	 
		B LOOPWHILE;;------------> B LOOP2---->B LOOPWHILE
		   
		   
END2     



ENDED
        POP{R2-R12,PC}
    ENDP
			
			END