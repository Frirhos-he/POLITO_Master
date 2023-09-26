/*----------------------------------------------------------------------------
 * Name:    sample.c
 *
 * This software is supplied "AS IS" without warranties of any kind.
 *
 * Copyright (c) 2019 Politecnico di Torino. All rights reserved.
 *----------------------------------------------------------------------------*/
                  
#include <stdio.h>
#include "LPC17xx.h"                    /* LPC17xx definitions                */
#include "led/led.h"
#include "button/button.h"


/*----------------------------------------------------------------------------
  Main Program
 *----------------------------------------------------------------------------*/
extern float addFPpositiveNumbers(float r1,float r2);

int main (void)
{  
	
	float res = addFPpositiveNumbers(2,3);
	
	LED_init();					/* LED Initialization */
	if(res >= 0){
	LPC_GPIO2->FIOSET = 1;
	}
	else {
		LPC_GPIO2->FIOSET = 2;
	}
	
	
	
	LPC_SC->PCON |= 0x1;	/* power-down mode */								
	LPC_SC->PCON &= 0xFFFFFFFFD; 
	SCB->SCR |= 0x2;			/* set SLEEPONEXIT */	
	
	//ADC_start_conversion();

	__ASM("wfi");
}
