//
//	Project Definitions
//
#define __AVR_ATMEGA8535__ 1
//#define __AVR_ATMEGA16A__ 1

//
//	Project Includes
//
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>

#if defined (__AVR_ATMEGA8535__)
#undef F_CPU
#if   defined(__AVR_ATMEGA8535__) 
//#define F_CPU 3579545UL
//#define F_CPU 4745600UL 
//#define F_CPU 7372800UL
#define F_CPU 8000000UL //Internal Lfuse:c1 Hfuse:d9
//#define F_CPU 1000000UL //Internal Lfuse:c1 Hfuse:d9
#else 
#error cpu not specified 
#endif
#endif

#if defined (__AVR_ATMEGA16A__)
#undef F_CPU
#if   defined(__AVR_ATMEGA16A__) 
#define F_CPU 7372800UL
//#define F_CPU 3579545UL 
//#define F_CPU 4745600UL
//#define F_CPU 2000000UL
#else 
#error cpu not specified 
#endif
#endif

#include <util/delay.h>
