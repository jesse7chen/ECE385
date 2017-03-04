// Main.c - makes LEDG0 on DE2-115 board blink if NIOS II is set up correctly
// for ECE 385 - University of Illinois - Electrical and Computer Engineering
// Author: Zuofu Cheng

int main()
{
	int i = 0;
	int flag = 0;

	volatile unsigned int *LED_PIO = (unsigned int*)0x2050; //make a pointer to access the PIO block
	volatile unsigned int *SW_PIO = (unsigned int*)0x2040; //make a pointer to access the PIO block
	volatile unsigned int *KEY_PIO = (unsigned int*)0x2030; //make a pointer to access the PIO block

	int sum = 0;

	*LED_PIO = 0; //clear all LEDs

	/*
	while ( (1+1) != 3) //infinite loop
	{
		for (i = 0; i < 100000; i++); //software delay
		*LED_PIO |= 0x1; //set LSB
		for (i = 0; i < 100000; i++); //software delay
		*LED_PIO &= ~0x1; //clear LSB
	}

	*/

	while ( (1+1) != 3) //infinite loop
	{
		if(!(*KEY_PIO & 0b0100)){
			sum = 0;
			*LED_PIO = sum;
		} else {
			if((!(*KEY_PIO & 0b1000)) && flag == 0)
			{
				flag = 1;
				sum += *SW_PIO;
				*LED_PIO = sum;
			}
			if((*KEY_PIO & 0b1000)){
				flag = 0;
			}
		}
	}
	return 1; //never gets here
}
