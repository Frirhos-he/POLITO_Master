#include "button.h"
#include "LPC17xx.h"
#include "../led/led.h"


// Exercise 8
extern int i;

void EINT0_IRQHandler (void) {  /*INT 0 */
		
	/*
	The INT0 button controls the third reel and
  determines if victory has happened:
  ? It randomly powers on either LED 8 or LED 9.
  ? Based on the result, it powers on LED 10 or 11
	*/
	if(i%2 == 0) LED_On(2);
	else LED_On(3);
	
	
	if(LPC_GPIO2->FIOSET == 0x54) LED_On(0);
		else if(LPC_GPIO2->FIOSET == 0x28) LED_On(1);
			
  LPC_SC->EXTINT |= (1 << 0);     /* clear pending interrupt         */
}

void EINT1_IRQHandler (void) {  /* key 1 */
/*
The KEY1 button starts a new game and
controls the first reel:
? It powers off all the LEDs
? It randomly powers on either LED 4 or LED 5
*/	

	all_LED_off();
	if(i%2 == 0) LED_On(6);
	else LED_On(7);
	
	LPC_SC->EXTINT |= (1 << 1);     /* clear pending interrupt         */
}

void EINT2_IRQHandler (void) {  /* key 2 */

	/*
		The KEY2 button controls the second reel:
		? It randomly powers on either LED 6 or LED 7.
	*/
	if(i%2 == 0) LED_On(4);
	else LED_On(5);

  LPC_SC->EXTINT |= (1 << 2);     /* clear pending interrupt         */    
}
