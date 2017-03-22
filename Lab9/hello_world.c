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


#include <stdio.h>
#include <stdlib.h>

#define to_hw_port (volatile char*) 0x00000000 // actual address here
#define to_hw_sig (volatile char*) 0x00000000 // actual address here
#define to_sw_port (char*) 0x00000000 // actual address here
#define to_sw_sig (char*) 0x00000000 // actual address here

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

// TODO: AES Encryption related function calls

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

