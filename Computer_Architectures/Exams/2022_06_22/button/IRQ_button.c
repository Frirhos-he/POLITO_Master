#include "button.h"
#include "lpc17xx.h"
#include "../led/led.h"
extern void startSysTickTimer();
extern int stopSysTickTimer();
extern int squareRoot(int,int);
int volatile static result=0;
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
	int value;
	
	value = stopSysTickTimer();
	result =squareRoot(value,24);
	LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */    
}


