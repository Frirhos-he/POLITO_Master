#include "LPC17xx.h"
#include "led.h"

unsigned unsigned int currentLED;

void led4and11_On(void){
		LPC_GPIO2->FIOSET |= 0b10000001;
}


void led4_Off(void){
			LPC_GPIO2->FIOCLR |= 0x1;
}

void ledEvenOn_OddOff(void){
	LPC_GPIO2->FIOPIN = 0x55;
}

void LED_On(unsigned int num){
	LPC_GPIO2->FIOSET |= (1 << num);
	currentLED = num;
}

void LED_Off(unsigned int num){
	LPC_GPIO2->FIOCLR |= (1 << num);
}