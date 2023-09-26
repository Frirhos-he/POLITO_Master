#include "button.h"
#include "lpc17xx.h"

 int value=0;
 int counter=0;
 
extern int  restoringSquareRoot (int r1,int count);
 
void EINT0_IRQHandler (void)	 /*INT 0 */ 
{
	int res;
	res = restoringSquareRoot(value,counter);
	res &= 0xFF;
	LPC_GPIO2->FIOSET|= (unsigned int)res;
	
	LPC_SC->EXTINT |= (1 << 0);     /* clear pending interrupt         */
}


void EINT1_IRQHandler (void)	  /*key 1*/
{
	value|= 1<<counter;
	counter++;
	LPC_SC->EXTINT |= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void)	  
{
	counter++;
	LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */    
}


