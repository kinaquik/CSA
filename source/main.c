#include <avr/io.h>
//

void delayMs()
{
	int i,j;

	for(i=0;i<=184;i++)
	{
		for(j=0;j<=184;j++);
	}
}

int main (void)
{
//initialization
	
	DDRA = 0xff;
	long i;
	
	while(1)
	{
	
		PORTA = 0x00;
		for (i=0; i<=184; i++)
		{
			delayMs();
		}
		
		PORTA = 0x01;
		for (i=0; i<=184; i++)
		{
			delayMs();
		}
		
	}
	return 0;
}
