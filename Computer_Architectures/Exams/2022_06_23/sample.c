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


extern int coprime(int,int);
extern int radical(int);


/*----------------------------------------------------------------------------
  Main Program
 *----------------------------------------------------------------------------*/
int main (void)
{  
	int a =27;
	int b = 1;
	int c;
	int cop;
	int admis = 0;
	int except=0;
	// Uncomment the instructions (and add others) according to your needs
	LED_init();					/* LED Initialization */
	//BUTTON_init();				/* BUTTON Initialization */
	//init_timer(0,0xFF);		/* TIMER0 Initialization */
	//enable_timer(0);
	//ADC_init();
	//DAC_init();
	
	while(admis != 100){
		cop = 0;
		c = a+b;
		cop+=coprime(a,b);
		cop+=coprime(a,c);
		cop+=coprime(b,c);
		if(cop == 3){
			admis++;
				if(c>radical(a*b*c)){
					except++;
				}	
		}
		b++;	
	}
	
	if(except==0) 	LPC_GPIO2->FIOSET|=1 << 7;
	if(except==1) 	LPC_GPIO2->FIOSET|=1 << 6;
	if(except==2) 	LPC_GPIO2->FIOSET|=1 << 5;
	if(except==3) 	LPC_GPIO2->FIOSET|=1 << 4;
	if(except==4) 	LPC_GPIO2->FIOSET|=1 << 3;
	if(except==5) 	LPC_GPIO2->FIOSET|=1 << 2;
	if(except==6) 	LPC_GPIO2->FIOSET|=1 << 1;
	if(except==7) 	LPC_GPIO2->FIOSET|=1 << 0;
	
	
	
	LPC_SC->PCON |= 0x1;	/* power-down mode */								
	LPC_SC->PCON &= 0xFFFFFFFFD; 
	SCB->SCR |= 0x2;			/* set SLEEPONEXIT */	
	
	//ADC_start_conversion();

	__ASM("wfi");
}
