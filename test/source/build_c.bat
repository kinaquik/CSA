avr-gcc -Wa,--gstabs -mmcu=atmega8535 main_c.c -Os -o main_c.o
avr-objcopy -j .text -j .data -O ihex main_c.o main_c.hex
