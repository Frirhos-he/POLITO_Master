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
#include "timer/timer.h"


extern addFPpositiveNumbers (float,float);
/*----------------------------------------------------------------------------
  Main Program
 *----------------------------------------------------------------------------*/
int main (void)
{  
	// Uncomment the instructions (and add others) according to your needs
	LED_init();					/* LED Initialization */
	//BUTTON_init();				/* BUTTON Initialization */
	//init_timer(0,0x0EE6B280);		/* TIMER0 Initialization */
	//enable_timer(0);
	//ADC_init();
	//DAC_init();
	
//if(addFPpositiveNumbers(1.2,3.2)>=0){
//		LPC_GPIO2->FIOSET&=0xFFFFFF00;
//		LPC_GPIO2->FIOSET|=0x80;
//	} else {
//		LPC_GPIO2->FIOSET&=0xFFFFFF00;
//		LPC_GPIO2->FIOSET|=0x40;
//	}
		if(addFPpositiveNumbers(-1.2,-3.2)>=0){
		LPC_GPIO2->FIOSET&=0xFFFFFF00;
		LPC_GPIO2->FIOSET|=0x80;
	} else {
		LPC_GPIO2->FIOSET&=0xFFFFFF00;
		LPC_GPIO2->FIOSET|=0x40;
	}
	
	LPC_SC->PCON |= 0x1;	/* power-down mode */								
	LPC_SC->PCON &= 0xFFFFFFFFD; 
	SCB->SCR |= 0x2;			/* set SLEEPONEXIT */	
	
	//ADC_start_conversion();

	__ASM("wfi");
}
