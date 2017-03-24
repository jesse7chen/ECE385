/*---------------------------------------------------------------------------
  --      hello_world.c                                                    --
  --      Christine Chen                                                   --
  --      Fall 2013														   --
  --																	   --
  --      Updated Spring 2015 											   --
  --	  Yi Liang														   --
  --																	   --
  --      For use with ECE 385 Experiment 9                                --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/
// We'll probably want to rename this to main.c

#include <stdio.h>
#include <stdlib.h>
#include "system.h" // We include this so we can use the base addresses defined below - Jesse
#include "aes.c"

/*
#define to_hw_port (volatile char*) 0x00000000 // actual address here
#define to_hw_sig (volatile char*) 0x00000000 // actual address here
#define to_sw_port (char*) 0x00000000 // actual address here
#define to_sw_sig (char*) 0x00000000 // actual address here
*/

#define to_hw_port		(volatile char*) 	TO_HW_PORT_BASE
#define to_hw_sig		(volatile char*)	TO_HW_SIG_BASE
#define to_sw_port		(char*)		TO_SW_PORT_BASE
#define to_sw_sig		(char*)		TO_SW_SIG_BASE  // Not sure if these should be volatile int or char? - Jesse


char charToHex(char c)
{
	char hex = c;

	if (hex >= '0' && hex <= '9')
		hex -= '0';
	else if (hex >= 'A' && hex <='F')
	{
		hex -= 'A';
		hex += 10;
	}
	else if (hex >= 'a' && hex <='f')
	{
		hex -= 'a';
		hex += 10;
	}
	return hex;
}

char charsToHex(char c1, char c2)
{
	char hex1 = charToHex(c1);
	char hex2 = charToHex(c2);
	return (hex1 << 4) + hex2;
}

void hextoChar(char c) {
	printf("%x", c);
}

// Maybe write char to int and int to char converters?

uint chartoInt(uchar* input){
	uint temp0 = (uint)input[0];
	uint temp1 = (uint)input[1];
	uint temp2 = (uint)input[2];
	uint temp3 = (uint)input[3];

	uint output = (temp0 << 24) & (temp1 << 16) & (temp2 << 8) & (temp3);
	return output;
}

// TODO: AES Encryption related function calls

void rotWord(uchar* input){ // Very naive implementation, may change later
	uchar temp = input[0];
	for(int i = 0; i < 3; i++){
		input[i] = input[i+1];
	}
	input[3] = temp;
}

void subWord(uchar* input){
	for(int i = 0; i < 4; i++){
		uchar c = input[i];
		input[i] = aes_sbox[(c >> 4)& 0x0F][c&0x0F];
	}
}

void Rcon(uchar* input, int i){
	uint value = Rcon[i];
	uchar temp[4];
	temp[0] = (uchar)((value >> 24) & 0x000000FF);
	temp[1] = (uchar)((value >> 16) & 0x000000FF);
	temp[2] = (uchar)((value >> 8) & 0x000000FF);
	temp[3] = (uchar)(value & 0x000000FF);
	for(int i = 0; i < 4; i++){
		input[i] = input[i] ^ temp[i];
	}
}

void XOR(uchar* input1, uchar* input2){
	for(int i = 0; i < 4; i++){
		input1[i] = input1[i] ^ input2[i];
	}
}

void storeWord(uchar* store, uchar* data){
	for(int i = 0; i < 4; i++){
		store[i] = data[i];
	}
}

void KeyExpansion(uchar* key, uchar* keySchedule){
	// Maybe use a temp word here?
	uchar temp[4];
	for(int i = 0; i <(4*4); i++) {
		keySchedule[i] = key[i];
	}

	for(int i = (4*4); i < (4*44); i++){
		storeWord(&temp, keySchedule[i-(4*1)]);
		if(i%4 == 0){
			subWord(rotWord(&temp));
			Rcon(&temp, (i/16)-1);
		}
		XOR(&temp, keySchedule[i-(4*4)]);
		storeWord(keySchedule[i], &temp);
	}
}

int main()
{
	int i;
	unsigned char plaintext[33]; //should be 1 more character to account for string terminator
	unsigned char key[33];

	// Start with pressing reset
	*to_hw_sig = 0;
	*to_hw_port = 0;
	printf("Press reset!\n");
	while (*to_sw_sig != 3);

	while (1)
	{
		*to_hw_sig = 0;
		printf("\n");

		printf("\nEnter plain text:\n");
		scanf ("%s", plaintext);
		printf ("\n");
		printf("\nEnter key:\n");
		scanf ("%s", key);
		printf ("\n");

		// TODO: Key Expansion and AES encryption using week 1's AES algorithm.

		// TODO: display the encrypted message.
		printf("\nEncrypted message is\n");

		// Transmit encrypted message to hardware side for decryption.
		printf("\nTransmitting message...\n");

		for (i = 0; i < 16; i++)
		{
			*to_hw_sig = 1;
			*to_hw_port = encryptedMsg[i]; // encryptedMsg is your encrypted message
			// Consider to use charToHex() if your encrypted message is a string.
			while (*to_sw_sig != 1);
			*to_hw_sig = 2;
			while (*to_sw_sig != 0);
		}
		*to_hw_sig = 0;

		// Transmit encrypted message to hardware side for decryption.
		printf("\nTransmitting key...\n");

		//TODO: Transmit key

		printf("\n\n");

		while (*to_sw_sig != 2);
		printf("\nRetrieving message...\n");
		for (i = 0; i < 16; ++i)
		{
			*to_hw_sig = 1;
			while (*to_sw_sig != 1);
			str[i] = *to_sw_port;
			*to_hw_sig = 2;
			while (*to_sw_sig != 0);
		}

		printf("\n\n");

		printf("Decoded message:\n");

		// TODO: print decoded message
	}

	return 0;
}
