//
//  Local Includes
//
#include "project.h"

//
//	Local Definitions
//
#define BAUD 115200
#define MYUBRR F_CPU/16/BAUD-1
unsigned int count;

struct status {
	unsigned int fan_junction_one;
	unsigned int fan_junction_two;
	unsigned int count_sec;
};

struct status current_status;

//
//	Local Functions
//
void initialize_system(void);
void application_process(void);
void get_current_status(void);
void turn_on_fan(void);
void turn_off_fan(void);
void USARTInit(uint16_t ubrr_value);
void USARTWriteChar(char data);
char USARTReadChar();

int main (void)
{	
	initialize_system();
	//USARTInit(MYUBRR);
	
	application_process();
	return 0;
}

void application_process(void)
{	
	//initialize current_status
	current_status.count_sec = 0;
	current_status.fan_junction_one = 3;
	current_status.fan_junction_two = current_status.fan_junction_one + 2100;
	
	while(1)
	{
	}
}


void initialize_system(void)
{
//
//Clock
//

//
//I/O Ports Initialization
//
	DDRA = 0xff;
	DDRB = 0xff;
	DDRC = 0xff;
	DDRD = 0xff;
	
	PORTA = 0x0;
	PORTD = 0x0;

//
// Timer0 Initialization
//
    //TIMSK = TIMSK | (1<<OCIE0);  // Enable Interrupt TimerCounter0 Compare Match A (SIG_OUTPUT_COMPARE0)
    //OCR0 = 0xff;
	//TCCR0 = (1<<WGM01) | (1<<CS02) | (0<<CS01) | (1<<CS00);  // Mode = CTC, Clock/1024
	
//
//  Timer1 Initialization
//
	TIMSK = (1<<OCIE1A); //Enable Output Compare Interrupt
	OCR1A = 0x7a12;

	TCCR1A = (0<<WGM11) |  (0<<WGM10); //Mode 4: CTC
	TCCR1B = (0<<WGM13) |  (1<<WGM12) | (1<<CS12) | (0<<CS11) | (0<<CS10); //Prescalar 256

//
//  Enable Global Interrupt
//
	sei();
}

ISR(SIG_OUTPUT_COMPARE1A)
{
	//Update current status
	current_status.count_sec++;
	
	//Check current status to control fan
	if(current_status.count_sec <= current_status.fan_junction_one)
	{	
		turn_on_fan();
	}
	
	if(current_status.count_sec > current_status.fan_junction_one && current_status.count_sec <=current_status.fan_junction_two)
	{
		turn_off_fan();
	}
	
	if(current_status.count_sec > current_status.fan_junction_two)
	{
		current_status.count_sec=0;
	}
}

ISR(SIG_OUTPUT_COMPARE0)
{
}

void turn_on_fan(void)
{
	PORTA |= 0x01;
	PORTD |= 0x80;
}

void turn_off_fan(void)
{
	PORTA &= 0xfe;
	PORTD &= 0x3f;
}

char USARTReadChar() 
{
   while(!(UCSRA & (1<<RXC))) 
   {
   } 
    return UDR; 
} 

void USARTWriteChar(char data)
{
   //Wait untill the transmitter is ready

   while(!(UCSRA & (1<<UDRE)))
   {
      //Do nothing
   }

   //Now write the data to USART buffer

   UDR=data;
}


void USARTInit(uint16_t ubrr_value)
{
   //Set Baud rate
   UBRRL = ubrr_value;
   UBRRH = (ubrr_value>>8);
   /*Set Frame Format
   >> Asynchronous mode
   >> No Parity
   >> 1 StopBit
   >> char size 8

   */
   UCSRC=(1<<URSEL)|(3<<UCSZ0);
   //Enable The receiver and transmitter
   UCSRB=(1<<RXEN)|(1<<TXEN);
}
