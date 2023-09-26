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

extern  unsigned coprime(unsigned int,unsigned int);
extern  unsigned radical(unsigned int);


int main (void)
{ 
	unsigned int a,b,c;
	unsigned int countersolution= 0;
	unsigned int counterexception= 0;
	
	unsigned result;
	
	a = 27;
	b = 1;
	c = a+b;
	
	LED_init();                           /* LED Initialization    */
	
	do {
			result = 0;
			result+= coprime(a,b);
			result+= coprime(b,c);
			result+= coprime(c,a);
			if(result == 3) {
				countersolution++;
				if(c > radical(a*b*c)) counterexception++;
			}
			b++;
			c = a+b;
	
	} while (countersolution < 100);
	
	counterexception&= 0xFF;
	
	LPC_GPIO2->FIOSET = counterexception;
	
	
	LPC_SC->PCON |= 0x1;		/* power-down mode */								
	LPC_SC->PCON &= 0xFFFFFFFFD; 
	SCB->SCR |= 0x2;				/* set SLEEPONEXIT */
	
	__ASM("wfi");
}
