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
#define to_sw_sig		(char*)		TO_SW_SIG_BASE

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

// Naive implementation, may change later. Other implementations call for a
// a temp array, but then we have to copy that, and that takes time and space...
void rotWord(uchar* input){
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
	uint value = Rcon[i]; // Double check that this fits the endianness of the computer
	uchar temp[4];
	temp[0] = (uchar)((value >> 24) & 0x000000FF); // This value should be 0x01, 0x02, etc.
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
	uchar temp[4];
	// Initialize first key
	for(int i = 0; i <(4*4); i++) {
		keySchedule[i] = key[i];
	}

	for(int w = 4; w < 44; w++){ // iterates through words
		storeWord(&temp, keySchedule[4*(w-1)]);
		if(w%4 == 0){
			subWord(rotWord(&temp));
			Rcon(&temp, (w/4)-1);
		}
		XOR(&temp, keySchedule[4*(w-4)]);
		storeWord(keySchedule[4*w], &temp);
	}

void addRoundKey(uchar* state, uchar* key_schedule, int round){
	for(int w = 0; w < 4; w++){
		XOR(state[4*w], key_schedule[4*(w+4*round)]);
	}
}

void mixColumns(uchar* state){

}

void shiftRows(uchar* state){
	// Storing values for later correction. See below.
	uchar temp[3];
	for(int i = 0; i < 3; i++){
		temp[i] = state[i+1];
	}
	for(int w = 0; w < 4; w++){
		for(int i = 1; i < 4; i++){
			// Checking if in row 1,2,3. Row 0 is not worried about
			if((4*w + i) % 4 == 1) {
				//The modulus ensures that the column never overflows
				state[4*w+i] = state[4*((w+1)%4) + i];
			}
			else if((4*w+i) % 4 == 2){
				// We use w+2 here since we are shifting by two columns now
				state[4*w+i] = state[4*((w+2)%4) + i];
			}
			else if((4*w+i) % 4 == 3) {
				state[4*w+i] = state[4*((w+3)%4) + i];
			}
		}
	}
	// These states will be incorrectly set by the above function
	// because when we set state[13] = state[0], state[0] has already changed
	// its value to state[5]. Therefore we store the original value of state[0]
	// and fix those errors here. We can also just make temp arrays for all
	// of these, but again, more space and time.
	state[13] = temp[0];
	state[10] = temp[1];
	state[7] = temp[2];
}

void subBytes(uchar* state){
	for(int w = 0; w < 4; w++){
		subWord(state[4*w]);
	}
}

void encrypt(uchar* state, uchar* key_schedule){
	int round = 0;
	addRoundKey(state, key_schedule, round);
	for(round = 1; round < 11; round++) {
		subBytes(state);
		shiftRows(state);
		mixColumns(state);
		addRoundKey(state, key_schedule, round);
	}

	subBytes(state);
	shiftRows(state);
	addRoundKey(state, key_schedule, round);
}

}

int main()
{
	int i;
	unsigned char plaintext[33]; //should be 1 more character to account for string terminator
	unsigned char key[33];
	unsigned char encryptedMsg[16];
	unsigned char key_hex[16];
	unsigned char key_schedule[176];

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

		// Convert ASCII string to char
		for(int i = 0; i < 32; i++){
			if(i%2 == 0){
				encryptedMsg[i/2] = charstoHex(plaintext[i], plaintext[i+1]);
				key_hex[i/2] = charstoHex(key[i], key[i+1]);
			}
		}

		// TODO: Key Expansion and AES encryption using week 1's AES algorithm.

		keyExpansion(&key_hex, &key_schedule);
		encrypt(&encryptedMsg, &key_schedule);

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
