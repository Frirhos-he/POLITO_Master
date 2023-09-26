#include "button.h"
#include "lpc17xx.h"
extern void startSysTickTimer();
extern int stopSysTickTimer();
extern int squareRoot(int);
int squared;
extern int squareRoot(int);


void EINT0_IRQHandler (void)	  
{
	LPC_SC->EXTINT |= (1 << 0);     /* clear pending interrupt         */
}


void EINT1_IRQHandler (void)	  
{
	startSysTickTimer();
	LPC_SC->EXTINT |= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void)	  
{
	int result;
	result=stopSysTickTimer();
	squared =squareRoot(result);
	LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */    
}


