#include "button.h"
#include "lpc17xx.h"
int binaryvalue;
int counter;
extern int restoringSquareRoot(int,int);

void EINT0_IRQHandler (void)	  
{
	int result;
	result = restoringSquareRoot(binaryvalue,counter);
	LPC_GPIO2->FIOCLR|=0xFF;
	result&=0xFF;
	LPC_GPIO2->FIOSET|=result;
	LPC_SC->EXTINT |= (1 << 0);     /* clear pending interrupt         */
}


void EINT1_IRQHandler (void)	  
{
	counter++;
	binaryvalue= binaryvalue*2;
	LPC_SC->EXTINT |= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void)	  
{
	counter++;
	binaryvalue= binaryvalue*2;
	binaryvalue+=1;
	
	LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */    
}


