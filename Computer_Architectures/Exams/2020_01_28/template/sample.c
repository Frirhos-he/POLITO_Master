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



/*----------------------------------------------------------------------------
  Main Program
 *----------------------------------------------------------------------------*/
extern int coprime(int,int);
extern int radical(int);
int main (void)
{  
	int a;
	int b;
	int c;
	int cop=0;
	int adm=0;
	int exception=0;
	// Uncomment the instructions (and add others) according to your needs
	LED_init();					/* LED Initialization */
	//BUTTON_init();				/* BUTTON Initialization */
	//init_timer(0,0x0EE6B280);		/* TIMER0 Initialization */
	//enable_timer(0);
	//ADC_init();
	//DAC_init();

	a=27;
	b=1;
	c = a+b;
	while(adm<100){
		cop=0;
		cop+=coprime(a,b);
		cop+=coprime(a,c);
		cop+=coprime(b,c);
		if(cop == 3){
			adm++;
			if(c>radical(a*b*c)) exception++;
		}
				b++;
		c=a+b;
	}
	
	if(exception==0) LPC_GPIO2->FIOSET|=0x80;
	else if(exception ==1)LPC_GPIO2->FIOSET|=0x40;
	else if(exception ==2)LPC_GPIO2->FIOSET|=0x20;
	else if(exception ==3)LPC_GPIO2->FIOSET|=0x10;
	else if(exception ==4)LPC_GPIO2->FIOSET|=0x08;
	else if(exception ==5)LPC_GPIO2->FIOSET|=0x04;
	else if(exception ==6)LPC_GPIO2->FIOSET|=0x02;
	else if(exception ==7)LPC_GPIO2->FIOSET|=0x01;
	
	LPC_SC->PCON |= 0x1;	/* power-down mode */								
	LPC_SC->PCON &= 0xFFFFFFFFD; 
	SCB->SCR |= 0x2;			/* set SLEEPONEXIT */	
	
	//ADC_start_conversion();

	__ASM("wfi");
}
