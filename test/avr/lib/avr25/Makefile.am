# Copyright (c) 2004,  Theodore A. Roth
# Copyright (c) 2005, 2008, 2009  Anatoly Sokolov
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in
#   the documentation and/or other materials provided with the
#   distribution.
# * Neither the name of the copyright holders nor the names of
#   contributors may be used to endorse or promote products derived
#   from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

SUBDIRS =  at86rf401 ata6289 attiny13 attiny13a attiny2313 attiny2313a attiny24 attiny24a attiny25 attiny261 attiny261a attiny4313 attiny43u attiny44 attiny44a attiny45 attiny461 attiny461a attiny48 attiny84 attiny84a attiny85 attiny861 attiny861a attiny87 attiny88

AVR_TARGET          = avr25
AVR_TARGET_DEFS     = -D__COMPILING_AVR_LIBC__
AVR_TARGET_CFLAGS   = -mcall-prologues -Os
AVR_TARGET_ASFLAGS  = 
AVR_INSTALL_DIR     = avr25

VPATH = $(top_srcdir)/libc/stdlib:$(top_srcdir)/libc/pmstring:$(top_srcdir)/libc/string:$(top_srcdir)/libc/misc:$(top_srcdir)/libc/stdio:$(top_srcdir)/libm/fplib

if HAS_avr25

AVRLIB_DEVLIST =
if HAS_at86rf401
  AVRLIB_DEVLIST += at86rf401
endif	# at86rf401
if HAS_ata6289
  AVRLIB_DEVLIST += ata6289
endif	# ata6289
if HAS_attiny13
  AVRLIB_DEVLIST += attiny13
endif	# attiny13
if HAS_attiny13a
  AVRLIB_DEVLIST += attiny13a
endif	# attiny13a
if HAS_attiny2313
  AVRLIB_DEVLIST += attiny2313
endif	# attiny2313
if HAS_attiny2313a
  AVRLIB_DEVLIST += attiny2313a
endif	# attiny2313a
if HAS_attiny24
  AVRLIB_DEVLIST += attiny24
endif	# attiny24
if HAS_attiny24a
  AVRLIB_DEVLIST += attiny24a
endif	# attiny24a
if HAS_attiny25
  AVRLIB_DEVLIST += attiny25
endif	# attiny25
if HAS_attiny261
  AVRLIB_DEVLIST += attiny261
endif	# attiny261
if HAS_attiny261a
  AVRLIB_DEVLIST += attiny261a
endif	# attiny261a
if HAS_attiny4313
  AVRLIB_DEVLIST += attiny4313
endif	# attiny4313
if HAS_attiny43u
  AVRLIB_DEVLIST += attiny43u
endif	# attiny43u
if HAS_attiny44
  AVRLIB_DEVLIST += attiny44
endif	# attiny44
if HAS_attiny44a
  AVRLIB_DEVLIST += attiny44a
endif	# attiny44a
if HAS_attiny45
  AVRLIB_DEVLIST += attiny45
endif	# attiny45
if HAS_attiny461
  AVRLIB_DEVLIST += attiny461
endif	# attiny461
if HAS_attiny461a
  AVRLIB_DEVLIST += attiny461a
endif	# attiny461a
if HAS_attiny48
  AVRLIB_DEVLIST += attiny48
endif	# attiny48
if HAS_attiny84
  AVRLIB_DEVLIST += attiny84
endif	# attiny84
if HAS_attiny84a
  AVRLIB_DEVLIST += attiny84a
endif	# attiny84a
if HAS_attiny85
  AVRLIB_DEVLIST += attiny85
endif	# attiny85
if HAS_attiny861
  AVRLIB_DEVLIST += attiny861
endif	# attiny861
if HAS_attiny861a
  AVRLIB_DEVLIST += attiny861a
endif	# attiny861a
if HAS_attiny87
  AVRLIB_DEVLIST += attiny87
endif	# attiny87
if HAS_attiny88
  AVRLIB_DEVLIST += attiny88
endif	# attiny88

AM_CPPFLAGS = -I$(top_srcdir)/common -I$(top_srcdir)/include -I$(top_builddir)/include

AVRLIB_CFLAGS = -g -Wall -W -Wstrict-prototypes -mmcu=$(AVR_TARGET) $(AVR_TARGET_DEFS) $(AVR_TARGET_CFLAGS)

AVRLIB_ASFLAGS = -x assembler-with-cpp -Wa,-gstabs -mmcu=$(AVR_TARGET) $(AVR_TARGET_DEFS) $(AVR_TARGET_ASFLAGS)

AM_CFLAGS = $(AVRLIB_CFLAGS)
AM_CCASFLAGS = $(AM_CPPFLAGS) $(AVRLIB_ASFLAGS)

__install_dir = $(prefix)/avr/lib/$(AVR_INSTALL_DIR)

avrdir = $(__install_dir)
avrlibdir = $(__install_dir)

avr_LIBRARIES = \
	libc.a \
	libprintf_min.a \
	libprintf_flt.a \
	libscanf_min.a \
	libscanf_flt.a \
	libm.a

include $(top_srcdir)/libc/stdlib/Rules.am
include $(top_srcdir)/libc/pmstring/Rules.am
include $(top_srcdir)/libc/string/Rules.am
include $(top_srcdir)/libc/misc/Rules.am
include $(top_srcdir)/libc/stdio/Rules.am
include $(top_srcdir)/libm/fplib/Rules.am

nodist_libc_a_SOURCES = \
	$(stdlib_a_c_sources) \
	$(stdlib_a_asm_sources) \
	$(pmstring_a_c_sources) \
	$(pmstring_a_asm_sources) \
	$(string_a_c_sources) \
	$(string_a_asm_sources) \
	$(misc_a_c_sources) \
	$(misc_a_asm_sources) \
	$(stdio_a_c_sources) \
	$(stdio_a_asm_sources) \
	$(libm_a_c_sources) \
	$(libm_a_asm_sources)

nodist_libm_a_SOURCES = \
	$(libm_a_c_sources) \
	$(libm_a_asm_sources)

libc_a_LIBADD = \
	$(stdio_a_libadd) \
	$(misc_a_libadd)

libc_a_DEPENDENCIES = \
	$(stdio_a_libadd) \
	$(misc_a_libadd)

else

echo all distdir install installdirs clean distclean uninstall check:

endif
