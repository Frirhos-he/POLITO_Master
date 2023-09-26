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


                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
;Example: parameter1 = 0100 0010 0100 1011 0000 0000 0000 0000
         ;parameter2 = 0100 0001 1010 0100 0000 0000 0000 0000	

				LDR R0,=0X424B0000
				LDR R1,=0X41A40000
				BL addFPpositiveNumbers 
				B   .
                ENDP
addFPpositiveNumbers   PROC
				PUSH{R2-R12,LR}

;1.	take the mantissa of the two parameters
;mantissa1 = 0000 0000 0100 1011 0000 0000 0000 0000
;mantissa2 = 0000 0000 0010 0100 0000 0000 0000 0000
					LDR R4,=0X007FFFFF;TO GEERATE MANTISSA AND FIRST 22 BITS BY 1 LAST 9 BITS BY 0 WHICH IS 0X007FFFFF
					AND R2, R0,R4;0x004B0000 R2 MANTISA OF R0
					AND R3,R1,R4;0x00240000  R3 MANTISA OF R1
				
;-----------------------------------------------------------------
;2.	set bit 23 of the mantissa to 1
;mantissa1 = 0000 0000 1100 1011 0000 0000 0000 0000
;mantissa2 = 0000 0000 1010 0100 0000 0000 0000 0000

					MOV R5,#1
					LSL R5,#23;set bit 23 of the mantissa to 1
					ORR R2,R5;0x00CB0000
					ORR R3,R5;0x00A40000

;-----------------------------------------------------------------
;3.	compare the two exponents. If they are equal, the exponent of the result is the same. 
;If they are different:
;a)	the exponent of the result is the highest one
;b)	shift right the mantissa of the number with the lower exponent by 
;as many position as the difference between the two exponents.
;3)	exponent1 = 1000 0100
;exponent2 = 1000 0011
;a)	exponentResult = 1000 0100
;b)	mantissa2 = 0000 0000 0101 0010 0000 0000 0000 0000
                 LDR R5,=0XFF800000; GENERATE EXPONENT LAST 9 BITS ARE 1 OTHER BITS ARE 0
				 AND R8,R0,R5;   R8 IS THE EXPONENT OF R0
				 AND R7,R1,R5;   R7 IS THE EXPONENT OF R1
				 LSR R8,#23; 0x00000084  EXPONENT1
				 LSR R7,#23; 0x00000083  EXPONENT2
				 CMP R8,R7
				 MOVEQ R6,R8;exponent of the result is IN R6
				 BEQ STEP4; IF EXPONENTS EQUAL DO NOTHING. ELSE R9 IS HIGHSER R10 IS SMALLER
				 MOVGT R9,R8
				 MOVGT R10,R7
				 MOVLT R9,R7
				 MOVLT R10,R8
				 MOV R6,R9; exponent of the result is IN R6
				 SUB R9,R10; DIF IS IN R9
				 CMP R6,R8;COMPARE HIGHER WITH R0 EXPONENT
;shift right the mantissa of the number with the lower exponent by 
;as many position as the difference between the two exponents.
				 LSREQ R3,R9;0x00520000
				 LSRNE R2,R9
				 
				 ; exponent of the result is IN R6=0x00000084
				 
;-----------------------------------------------------------------


;4.	sum the two mantissas: this is the mantissa of the result. 
;If bit 24 of the mantissa of the result is 1:
;a)	shift right the mantissa of the result by one position
;b)	increment the exponent of the result by one.
;4)	mantissaResult = 0000 0001 0001 1101 0000 0000 0000 0000
;a)	mantissaResult = 0000 0000 1000 1110 1000 0000 0000 0000
;b)	exponentResult = 1000 0101

;R2:MANTISSA0  R3:MANTISSA1   R8:EXPO0  R7:EXPO1  R6:RESULT_EXPO=0x00000084
;R4:GENERATE_MANTISSA  R5:GENERATE_EXPO
				
STEP4				ADD R9,R2,R3;R9 IS mantissaResult ;0x011D0000
                    LDR R11,=0X01000000 ; GENERATE THIS TO CHECK BIT 24
					AND R10,R9,R11;CHECK BIT 24
					CMP R10,R11
					LSREQ R9,#1;AFTER SHIFT R9=0x008E8000=0000 0000 1000 1110 1000 0000 0000 0000
;0000 0000 1000 1110 1000 0000 0000 0000
;0000 0001 0001 1101 0000 0000 0000 0000

;1000 0101

;-----------------------------------------------------------------


;5.	set bit 23 of the mantissa of the result to 0.
;5)	mantissaResult = 0000 0000 0000 1110 1000 0000 0000 0000
;-----------------------------------------------------------------


;6.	combine the mantissa and the exponent to get the final result.
;6)	result = 0100 0010 1000 1110 1000 0000 0000 0000
				
				
				
				
				
				POP{R2-R12,PC}
	
						ENDP

; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler               [WEAK]
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
