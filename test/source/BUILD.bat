REM avr-gcc -mmcu=atmega8535 -O3 -c main.c
REM avr-gcc -mmcu=atmega8535 -o main.hex main.o


avr-gcc -Wa,--gstabs -mmcu=atmega8535 main.c -Os -o main.o
avr-objcopy -j .text -j .data -O ihex main.o main.hex
REM avrdude -c usbasp -p m8535 -U flash:w:main.hex


REM avr-gcc [part]         [Optimzation Level 1]  [Compile File]
REM avr-gcc -mmcu=atmega16a -O3 -c main.c
REM avr-gcc -mmcu=atmega16a -o main.hex main.o


REM avr-gcc -Wa,--gstabs -mmcu=atmega16a main.c -Os -o main.o
REM avr-objcopy -j .text -j .data -O ihex main.o main.hex
REM avrdude -c usbasp -p m16 -U flash:w:main.hex

