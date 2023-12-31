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
int i;
int main (void)
{  

  LED_init();                           /* LED Initialization                 */
  BUTTON_init();						/* BUTTON Initialization              */

i = 0;
  while (1){
		i++;
		if(i>10)i=0;
	}                        	/* Loop forever                       */	
}
