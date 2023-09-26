#include "button.h"
#include "LPC17xx.h"
#include "../led/led.h"


extern unsigned int currentLED;
// Exercise 6

void EINT0_IRQHandler (void) {  /*INT 0 */
		
	/*
	By pressing button INT0, get back to original
	configuration, with LED 8 on.
	*/
	if(time-20000000>0){
	time = 	0;
	LED_Off(currentLED);
	LED_On(3);
	}	
  LPC_SC->EXTINT |= (1 << 0);     /* clear pending interrupt         */
}

void EINT1_IRQHandler (void) {  /* key 1 */
/*
	By pressing button KEY1, power off the
current LED and power on the LED on the left
(when arrived to LED 4, jump to LED 11).
*/	
			if(time-20000000>0){
			time = 	0;
		LED_Off(currentLED);
		if( currentLED == 7){
				LED_On(0);
		} else {
				LED_On(currentLED+1);
		}
	}
	
	LPC_SC->EXTINT |= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void) {  /* key 2 */

	/*
	By pressing button KEY2, power off the
	current LED and power on the LED on the
	right (when arrived to LED 11, jump to LED
	4).	
	*/
		if(time-20000000>0){
			time = 	0;
			LED_Off(currentLED);
		if( currentLED == 0){
				LED_On(7);
		} else {
				LED_On(currentLED-1);
		}
	
	}
	
  LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */    
}
