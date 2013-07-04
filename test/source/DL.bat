REM avrdude -p m8535 -c ponyser -P com4 -b 115200 -U flash:w:main.hex:r
REM avrdude -p m32 -c ponyser -P com4 -b 115200 -U flash:w:main.hex:r

avrdude -p m8535 -c usbasp -U flash:w:main.hex
REM avrdude -p m16 -c usbasp -U flash:w:main.hex