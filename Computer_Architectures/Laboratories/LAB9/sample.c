/*----------------------------------------------------------------------------
 * Name:    sample.c
 * Purpose: to control led through EINT buttons
 * Note(s):
 *----------------------------------------------------------------------------
 *
 * This software is supplied "AS IS" without warranties of any kind.
 *
 * Copyright (c) 2019 Politecnico di Torino. All rights reserved.
 *----------------------------------------------------------------------------*/
                  
#include <stdio.h>
#include "LPC17xx.h"                    /* LPC17xx definitions                */
#include "led/led.h"
#include "button/button.h"

/*----------------------------------------------------------------------------
  Main Program
 *----------------------------------------------------------------------------*/
int main (void)
{
	unsigned int i;
  int time;
	int lastime;
	
  LED_init();                            /* LED Initialization                 */
  BUTTON_init();						             /* BUTTON Initialization              */
	
	/* Exercise 1 */
	led4and11_On();
	
		/* Exercise 2 */
	led4_Off();
	
		/* Exercise 3 */
	ledEvenOn_OddOff();
	
		/* Exercise 4 */
	for(i = 0; i < 8; ++i) {
		LED_On(i);
	}
	
		/* Exercise 5 */
	for(i = 0; i < 8; ++i) {
		LED_Off(i);
	}
	
		/* Exercise 6 */
	LED_On(3);

	
	time = 0;
	
  while (1) {time+=1;}                        /* Loop forever                       */	
}
