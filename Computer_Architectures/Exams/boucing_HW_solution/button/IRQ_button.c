#include "button.h"
#include "lpc17xx.h"
#include "../timer/timer.h"

extern int clicked;
void EINT0_IRQHandler (void)	  /*INT0*/ 
{

	LPC_SC->EXTINT |= (1 << 0);     /* clear pending interrupt         */
}


void EINT1_IRQHandler (void)	  /*KEY1*/
{

	if(!clicked | LPC_TIM0->TC>1000 ){

		if(!clicked) {
			enable_timer(0);
			//LPC_TIM0->TCR=1; //so enable
			clicked =1;
		}
		else {
			//LPC_TIM0->TCR=0; //disable
			//LPC_TIM0->TCR=2; //so reset
			
			disable_timer(0);
			LPC_TIM0->TCR=2;
			clicked =0;
			LPC_TIM0->TCR=0;
		}
	}
	
	LPC_SC->EXTINT |= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void)	 /*KEY1*/ 
{

	LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */    
}


