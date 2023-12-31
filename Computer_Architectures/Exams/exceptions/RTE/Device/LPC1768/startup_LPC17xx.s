;/**************************************************************************//**
; * @file     startup_LPC17xx.s
; * @brief    CMSIS Cortex-M3 Core Device Startup File for
; *           NXP LPC17xx Device Series
; * @version  V1.10
; * @date     06. April 2011
; *
; * @note
; * Copyright (C) 2009-2011 ARM Limited. All rights reserved.
; *
; * @par
; * ARM Limited (ARM) is supplying this software for use with Cortex-M
; * processor based microcontrollers.  This file can be freely distributed
; * within development tools that are supporting such ARM based processors.
; *
; * @par
; * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
; * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
; * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
; * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
; * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
; *
; ******************************************************************************/

; *------- <<< Use Configuration Wizard in Context Menu >>> ------------------

; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000200

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000000

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors

__Vectors       DCD     __initial_sp              ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     MemManage_Handler         ; MPU Fault Handler
                DCD     BusFault_Handler          ; Bus Fault Handler
                DCD     UsageFault_Handler        ; Usage Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     DebugMon_Handler          ; Debug Monitor Handler
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

                ; External Interrupts
                DCD     WDT_IRQHandler            ; 16: Watchdog Timer
                DCD     TIMER0_IRQHandler         ; 17: Timer0
                DCD     TIMER1_IRQHandler         ; 18: Timer1
                DCD     TIMER2_IRQHandler         ; 19: Timer2
                DCD     TIMER3_IRQHandler         ; 20: Timer3
                DCD     UART0_IRQHandler          ; 21: UART0
                DCD     UART1_IRQHandler          ; 22: UART1
                DCD     UART2_IRQHandler          ; 23: UART2
                DCD     UART3_IRQHandler          ; 24: UART3
                DCD     PWM1_IRQHandler           ; 25: PWM1
                DCD     I2C0_IRQHandler           ; 26: I2C0
                DCD     I2C1_IRQHandler           ; 27: I2C1
                DCD     I2C2_IRQHandler           ; 28: I2C2
                DCD     SPI_IRQHandler            ; 29: SPI
                DCD     SSP0_IRQHandler           ; 30: SSP0
                DCD     SSP1_IRQHandler           ; 31: SSP1
                DCD     PLL0_IRQHandler           ; 32: PLL0 Lock (Main PLL)
                DCD     RTC_IRQHandler            ; 33: Real Time Clock
                DCD     EINT0_IRQHandler          ; 34: External Interrupt 0
                DCD     EINT1_IRQHandler          ; 35: External Interrupt 1
                DCD     EINT2_IRQHandler          ; 36: External Interrupt 2
                DCD     EINT3_IRQHandler          ; 37: External Interrupt 3
                DCD     ADC_IRQHandler            ; 38: A/D Converter
                DCD     BOD_IRQHandler            ; 39: Brown-Out Detect
                DCD     USB_IRQHandler            ; 40: USB
                DCD     CAN_IRQHandler            ; 41: CAN
                DCD     DMA_IRQHandler            ; 42: General Purpose DMA
                DCD     I2S_IRQHandler            ; 43: I2S
                DCD     ENET_IRQHandler           ; 44: Ethernet
                DCD     RIT_IRQHandler            ; 45: Repetitive Interrupt Timer
                DCD     MCPWM_IRQHandler          ; 46: Motor Control PWM
                DCD     QEI_IRQHandler            ; 47: Quadrature Encoder Interface
                DCD     PLL1_IRQHandler           ; 48: PLL1 Lock (USB PLL)
                DCD     USBActivity_IRQHandler    ; 49: USB Activity interrupt to wakeup
                DCD     CANActivity_IRQHandler    ; 50: CAN Activity interrupt to wakeup


                IF      :LNOT::DEF:NO_CRP
                AREA    |.ARM.__at_0x02FC|, CODE, READONLY
CRP_Key         DCD     0xFFFFFFFF
                ENDIF

HradFaaultStatusRegister  EQU 0xE000ED2C
SystemHandlerControl      EQU 0xE000ED24	
BusFaultStatusRegister    EQU 0xE000ED29 	
BusFaultAddressRegister   EQU 0xE000ED38
	
;SYS_TICK
SysControlAndStatusRegister EQU 0xE000E010
SysReloadValueRegister      EQU 0xE000E014
SysCurrentValueRegister      EQU 0xE000E018
	
;		        AREA ,PSTACK,READWRITE, ALIGN 3
;			    SPACE   800
;initial_psp  ; POINTS TO THE START OF THIS AREA					
					
                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
			
;-----------------------SystemHandlerControl---------------------------
;1
				LDR R0,=SystemHandlerControl
				LDR R1,[R0]
				;FORCE BIT 18 TO BE 1
				MOV R2,#2_111; BINARY 111
				LSL R3,R2,#16; WE WANT TO SET BITS 16 17 18  SO 111 WILL BE SHIFTED 16 BITS TO THER LEFT AND CAN SET BITS 16 17 18
				ORR R1,R3; USAGE FAULT ENABLED
				STR R1,[R0]	
;-------------------------------SVC------------------------------------------	
;2
				;move to user level
				MRS R5,CONTROL
				ORR R5,#1; FORCE FIRST BIT TO 1 TO ENABLE IT
				MSR CONTROL,R5; NOW WE ARE IN USER LEVEL
				
;4				;ONCE WHEN WE WENT TO THE USER LEVEL IF WE TRY TO COME BACK TO THE PRIVILEDGE LEVEL IT IS NOT POSSIBLE
				;move to PRIVILEDGE LEVEL
				MRS R5,CONTROL
				BIC R5,#1; FORCE FIRST BIT TO 0 TO GO TO PRIVILEDGE LEVEL
				MSR CONTROL,R5; THIS INSTRUCTION WILL NOT WORK THIS TIME BECAUSE WE ARE IN USER LEVEL AND CAN NOT GO BACK TO PRIVILEDGE LEVEL
				
;5				;SOLUTION TO MOVE TO PRIVILEDGE LEVEL WHEN WE ARE IN USER LEVEL IS USING SUPERVISOR CALLS
                SVC 16; AS AN EXAMPLE WHEN WE CALL SVC 16 WE CAN GO BACK TO PRIVILEDGE LEVEL
				SVC 25; AS AN EXAMPLE WHEN WE CALL SVC 25 WE CAN GO BACK TO USER LEVEL
				; WE JUMP TO SUPERVISOR HANDLER
				
				;WHEN WE EXECUTE INSTRUCTIONS FROM ABOVE THAT WE HAVE SystemHandlerControl 
				;AND THEN WE ENABLE USER LEVEL HERE A BUASFAULT WILL HAPPEN 
				;BECAUSE SystemHandlerControl IS IN PRIVILEDGE LEVEL 
;3				
				LDR R0,=SystemHandlerControl
				LDR R1,[R0]
			    ; AFTER THIS INSTRUCTION WE WILL JUMP TO BAUSFAULT
				
				
;--------------------------------------------------					
				
				MRS R8,CONTROL
				ORR R8,#2;0010;force bit 2 to 1
				MSR CONTROL,R8
				
;				LDR R0,=initial_psp
;				MSR PSP,R0
				
				PUSH {R1}
			
			
;--------------------HradFaault------------------------------					
;HradFaault              
               ADRL R0,Label
			   BX R0
			   
			   

;------------------SYS_TICK-------------------------------------------			   
	
			LDR R0,=SysControlAndStatusRegister
			
			;1-FORCE FIRST BIT OF TO 0 TO STOP THE TIMER AT FIRST:
			MOV R1,#0
			STR R1,[R0]
			
			;2-SET INITIAL VALUE TO THE TIMER
			LDR R0,=SysReloadValueRegister
			MOV R1,1023 ; AS EXAMPLE INITIAL TIMER BY 1023
			STR R1,[R0]
			
			;3-SET SysCurrentValueRegister TO THE INITIAL VALUE
			LDR R0,=SysCurrentValueRegister
			STR R1,[R0]
			
			;4- SET BIT 0 TO ENABLE TIMER SET BIT 1 TO ENABLE EXCEPTION SET BIT 2 TO USE INTERNAL SYS CLOCK SO WE SET 7 MEANS 111
			LDR R0,=SysControlAndStatusRegister
			MOV R1,#7
			STR R1,[R0]; HERE TIMER STARTS COUNTING
			
			;EXAMPLE WE WANT TO EXECUTE 10 TIMES THIS LOOP TO HAVE INFINITE LOOP BUT WE UPDATE R4 IN SYS_TICK HANDLER
			MOV R4,#0
			
TIMERLOOP		CMP R4,#10
				BNE TIMERLOOP
				; AFTER PASSING 1023 CLOCK CYCLE WE WILL BE IN SYS_TICK HANDLER
				
; SO AFTER 10 TIMES THE INFINITE LOOP WILL END BECAUSE EACH TIME WE INC R4 +1 SO AFTER 10 TIMES IT WILL RWACH TO 10 AND THE LOOP WILL BE FINISHED
					
					
					
STOP           B   STOP

Label        MOV R0,R1

                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                LDR R0,=HradFaaultStatusRegister
				
				LDR R1,[R0]
				
				;HERE WE ARE SURE THE VALUE OF R1 IS 0X40000000 OR 0X80000000
				;WE NEED A MASK TO CHECK BIT 30
				TEQ R1,#0X40000000; IF RESULT IS NOT ZERO MEANS THE RESULT IS SET
				BEQ NotEnableDException
				
				;WE NEED A MASK TO CHECK BIT 31
				TEQ R1,#0X80000000; IF RESULT IS NOT ZERO MEANS THE RESULT IS SET
				BEQ DebugException
				
NotEnableDException  				
				
				
DebugException				
				
				B  .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
				
				LDR R1,=BusFaultStatusRegister  ;  WE WANT TO SEE WHAT WAS THE REASON OF THE FAULT SO WE LOAD BusFaultStatusRegister
				;EXAMPLE: 82: 10000010--> SECOND BIT IS SET SO IT IS A PRECIZE FAULT, BIT 7 IS SET MEANS THAT THE BusFaultAddressRegister CONNTAINS A VALID ADDRESS BUS
				LDRB R2,[R1]; BusFaultStatusRegister  IS A BYTE SO WE NEED TO USE LDRB  
				; R2 CONTAINS THE EXPLANATIONS OF BUSFAULT
				
				LDR R0,=BusFaultAddressRegister; CONTAINS THE ADDRESS OF THE REASON THAT CAUSE THIS EXCEPTION
				LDR R3,[R0] ;  THIS IS A WORD SO WE USE LDR 	
				; R3 CONTAINS THE OFFENDING ADDRESS IF THE FAULT WAS PRECIZE
					
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler               [WEAK]
					
				;THRED MODE CAN USE BOTH MAIN AND PSP STACK
				;HANDLER MODE ALWAYS USE MAIN STACK

				; IF BIT 2 OF LR IS 0 MEANS IT USES MSP OTHERWISE IT USES PSP
				TST LR,#2
				MRSEQ R6,MSP
				MRSNE R6,PSP
				
				;NOW R6 IS THE STACK POINTER WHERE REGISTERS SAVED
;STACK:
;PSR +28		
;PC  +24
;LR  +20
;R12 +16
;R3  +12
;R2  +8
;R1  +4
;R0   0
				LDR R5,[R6,24]; IN THE STACK ABOVE START FROM R0 WE NEED TO GO UP 6 CELLS TO GET PC, EACH CELL IS 4 BYTE SO WE ADD R6+(6*4)
				; SVC IS THUMB INSTRUCTION, NOW PC PONITS TO NEXT INSTRUCTION WE NEED TO GO BACK 2 BYTES TO FE0TCH CURRENT INSTRUCTION
				LDRB R4,[R5,-2]; READ INSTRUCTION POINTED BY PC
				
				CMP R4,#16; AT FIRST WE CALLED SVC 16 TO GO BACK TO PRIVILEDGE LEVEL
				BEQ MOVETOPRIVILEDGE
				
				;ELSE IF 25--> CMP R4,#25   ; AT FIRST WE CALLED SVC 25 TO GO TO USER LEVEL
				
MOVETOPRIVILEDGE    ;move to PRIVILEDGE LEVEL
						MRS R5,CONTROL
						BIC R5,#1; FORCE FIRST BIT TO 0 TO GO TO PRIVILEDGE LEVEL
						MSR CONTROL,R5;
					;HERE WE WILL BE IN PRIVILEDGE LEVEL
					
				BX LR; RETURN ABOVE TO WHERE WE CALEED SVC AT FIRST

                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler           [WEAK]
				; WHEN WE ENTER HERE SOME CLOCK CYCLE HAS PASSED 
				ADD R4,#1
				BX LR ;RETURN BACK ABOVE TO TIMERLOOP AND R4 IS INCREASED +1
					
					
					
                B       .
                ENDP

Default_Handler PROC

                EXPORT  WDT_IRQHandler            [WEAK]
                EXPORT  TIMER0_IRQHandler         [WEAK]
                EXPORT  TIMER1_IRQHandler         [WEAK]
                EXPORT  TIMER2_IRQHandler         [WEAK]
                EXPORT  TIMER3_IRQHandler         [WEAK]
                EXPORT  UART0_IRQHandler          [WEAK]
                EXPORT  UART1_IRQHandler          [WEAK]
                EXPORT  UART2_IRQHandler          [WEAK]
                EXPORT  UART3_IRQHandler          [WEAK]
                EXPORT  PWM1_IRQHandler           [WEAK]
                EXPORT  I2C0_IRQHandler           [WEAK]
                EXPORT  I2C1_IRQHandler           [WEAK]
                EXPORT  I2C2_IRQHandler           [WEAK]
                EXPORT  SPI_IRQHandler            [WEAK]
                EXPORT  SSP0_IRQHandler           [WEAK]
                EXPORT  SSP1_IRQHandler           [WEAK]
                EXPORT  PLL0_IRQHandler           [WEAK]
                EXPORT  RTC_IRQHandler            [WEAK]
                EXPORT  EINT0_IRQHandler          [WEAK]
                EXPORT  EINT1_IRQHandler          [WEAK]
                EXPORT  EINT2_IRQHandler          [WEAK]
                EXPORT  EINT3_IRQHandler          [WEAK]
                EXPORT  ADC_IRQHandler            [WEAK]
                EXPORT  BOD_IRQHandler            [WEAK]
                EXPORT  USB_IRQHandler            [WEAK]
                EXPORT  CAN_IRQHandler            [WEAK]
                EXPORT  DMA_IRQHandler            [WEAK]
                EXPORT  I2S_IRQHandler            [WEAK]
                EXPORT  ENET_IRQHandler           [WEAK]
                EXPORT  RIT_IRQHandler            [WEAK]
                EXPORT  MCPWM_IRQHandler          [WEAK]
                EXPORT  QEI_IRQHandler            [WEAK]
                EXPORT  PLL1_IRQHandler           [WEAK]
                EXPORT  USBActivity_IRQHandler    [WEAK]
                EXPORT  CANActivity_IRQHandler    [WEAK]

WDT_IRQHandler
TIMER0_IRQHandler
TIMER1_IRQHandler
TIMER2_IRQHandler
TIMER3_IRQHandler
UART0_IRQHandler
UART1_IRQHandler
UART2_IRQHandler
UART3_IRQHandler
PWM1_IRQHandler
I2C0_IRQHandler
I2C1_IRQHandler
I2C2_IRQHandler
SPI_IRQHandler
SSP0_IRQHandler
SSP1_IRQHandler
PLL0_IRQHandler
RTC_IRQHandler
EINT0_IRQHandler
EINT1_IRQHandler
EINT2_IRQHandler
EINT3_IRQHandler
ADC_IRQHandler
BOD_IRQHandler
USB_IRQHandler
CAN_IRQHandler
DMA_IRQHandler
I2S_IRQHandler
ENET_IRQHandler
RIT_IRQHandler
MCPWM_IRQHandler
QEI_IRQHandler
PLL1_IRQHandler
USBActivity_IRQHandler
CANActivity_IRQHandler

                B       .

                ENDP


                ALIGN


; User Initial Stack & Heap

                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE

                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap
__user_initial_stackheap

                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR

                ALIGN

                ENDIF


                END
