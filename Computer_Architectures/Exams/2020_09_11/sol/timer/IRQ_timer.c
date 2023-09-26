/*********************************************************************************************************
**--------------File Info---------------------------------------------------------------------------------
** File name:           IRQ_timer.c
** Descriptions:        interrupt handlers of Timer/Counter 0 and 1
** Correlated files:    timer.h
**--------------------------------------------------------------------------------------------------------
*********************************************************************************************************/
#include "lpc17xx.h"
#include "timer.h"
#include "../led/led.h"

void TIMER0_IRQHandler (void)
{
	static int flag = 0;	/* static variables are initialized just once, when the program begins. */
	if (flag < 8)
	{
		LED_On(flag);
		flag ++;
	}
  LPC_TIM0->IR = 1;			/* clear interrupt flag */
  return;
}

void TIMER1_IRQHandler (void)
{
  LPC_TIM1->IR = 1;			/* clear interrupt flag */
  return;
}

