REM avr-gcc -mmcu=atmega8535 -c main.c
REM avr-gcc -mmcu=atmega8535 -o main.hex main.o

avr-gcc -Wa,--gstabs -mmcu=atmega8535 main.c -Os -o main.o
avr-objcopy -j .text -j .data -O ihex main.o main.hex

REM avr-gcc -mmcu=atmega32 -c main.c
REM avr-gcc -mmcu=atmega32 -o main.hex main.o