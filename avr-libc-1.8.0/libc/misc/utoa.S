/* Copyright (c) 2002, Reiner Patommel
   All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are met:

   * Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.
   * Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in
     the documentation and/or other materials provided with the
     distribution.
   * Neither the name of the copyright holders nor the names of
     contributors may be used to endorse or promote products derived
     from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE. */

/* $Id: utoa.S 2191 2010-11-05 13:45:57Z arcanum $ */

/*
   utoa.S

   Contributors:
   Created by Reiner Patommel based on
   itoa.s by Michael Rickmann <mrickma@gwdg.de>
   19 June 2003 changed by Reiner Patommel bug# 4010

	#include <stdlib.h>
	char *utoa(unsigned int value, char *string, int radix);
  ----------------------------------------------------------------------
*/

#if !defined(__AVR_TINY__)

#if !defined(__DOXYGEN__)

#include "macros.inc"
#include "ctoasm.inc"

    ASSEMBLY_CLIB_SECTION
    .global _U(utoa)
    .func _U(utoa)

/* arguments */
#define r_val_hi r25
#define r_val_lo r24
#define r_str_hi r23
#define r_str_lo r22
#define r_radix  r20

/* local variables */
#define r_lstr_hi r19
#define r_lstr_lo r18



_U(utoa):
	X_movw	ZL, r_str_lo	; &string
	X_movw	r_lstr_lo, ZL	; save &string
	cpi	r_radix, 2	; no radix < 2
	brlt	99f
	cpi	r_radix, 37	; no radix > 36
	brge	99f	
1:
	mov	r22, r_radix	; radix
	clr	r23		;  dividend in r25:r24,   divisor in r23:r22
	XCALL	_U(__udivmodhi4);  quotient in r23:r22, remainder in r25:r24
				;  clobbered: r0, r21, r26, r27
				;  call-used but preserved: r18,r19,r20,r30,r31
	subi	r24, 0xd0	; + '0'
	cpi	r24, 0x3a	; > '9' ?
	brlt	10f
	subi	r24, 0xd9	; + 'a' - 10 - '0'
10:
	st	Z+, r24		; write char to string in reverse order!
	X_movw	r_val_lo,r22	; quotient -> dividend
	sbiw	r_val_lo,0	; value == 0 ?
	brne	1b
99:
	st	Z, __zero_reg__	; terminate string
	X_movw	r_val_lo, r_lstr_lo	; restore &string as return value
	XJMP	_U(strrev)	; reverse string

	.endfunc

#endif /* not __DOXYGEN__ */

#endif /* !defined(__AVR_TINY__) */
