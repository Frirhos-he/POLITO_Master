#include "button.h"
#include "lpc17xx.h"

extern int iterativeCollatz(int);
int result;
void EINT0_IRQHandler (void)	  
{

	int currentvalue = (int)LPC_TIM0->TC;
	result = iterativeCollatz(currentvalue);
	if(result >255) result = 255;
	LPC_GPIO2->FIOCLR|= 0xFF;
	LPC_GPIO2->FIOSET|= result;
	LPC_SC->EXTINT |= (1 << 0);     /* clear pending interrupt         */
}


void EINT1_IRQHandler (void)	  
{
	LPC_SC->EXTINT |= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void)	  
{
	LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */    
}


