---
title: "Dr. Durant: CS-280 Embedded Systems Software: GCC 3.0.4 for the HC11: Passing C++ Parameters to Assembly Subroutines"
---

<small><em>by Dr. E. Durant &lt;durant@msoe.edu&gt;, 11 April 2004</em></small>

This document describes how to pass and return 8-bit quantities (bytes, chars)
and 16-bit quantities (ints, pointers) using GCC 3.0.4 for the HC11. All parameters
except the first are passed on the stack. 8-bit values are returned in B,
while 16-bit values are returned in D.

The first parameter is passed in B if it is 8-bit and in D if it is 16-bit.

In GCC 3.0.4, it is NOT necessary to preserve D, X, or Y. This is documented.
It appears that it is not necessary to save P (a.k.a. CCR), although this does not seem
to be documented. Stacked parameters can be found relative to the stack frame.
These facts taken together mean that the prolog and epilog are quite minimal for this
compiler...

<pre>; prolog
    tsx     ; access stacked parameters relative to SP

; epilog
    rts     ; that's it!</pre>

8-bit parameters always occupy the lower portion of a 16-bit value. That is, there
is an "unused" byte on the stack for each stacked 8-bit parameter and accumulator A
is "unused" if the first parameter is 8 bits wide. "Unused" means allocated with DES
when on the stack and unknown when in register D -- thus you __cannot__ assume
that the MSB is 0.

Recall that TSX adds 1 to SP before transferring it to IX, so that IX points to top
of the stack (not the next available byte). Thus, the 16-bit return address is at
0,x after doing a TSX in the prolog. Arguments are stacked in reverse declaration order,
thus the 2nd argument is closest to the top of the stack (2,x for 16-bit, 3,x
for 8-bit), the 3rd argument is next (4,x for 16-bit, 5,x for 8-bit), etc.

Note that in some cases functions written by the compiler will begin by pushing other
values onto the stack before performing the TSX. In this case, their parameter
offsets will differ from what is described here. HOWEVER, it is not necessary to know
this fact since __callers__ always stack their arguments as described. It is
mentioned merely to illustrate that IX need not contain the frame pointer if you are
careful about your offsets.

Example:

<pre>word foo(byte b1, word w, byte b2)
{
    return b1 + w + b2;
}</pre>

Recall that word is unsigned short int (16 bits) and byte is unsigned char (8 bits).

Here's how you'd likely write it by hand...

<pre>        .global foo
foo:    tsx         ; prolog
        clra        ; D contains b1
        addd 2,x    ; add w
        addb 5,x    ; add b2
        bcc  done
        inca        ; propagate the carry
done:   rts         ; epilog (return value in D)</pre>
And here's what the compiler generates...

<pre>0000c067 <foo(unsigned char, unsigned short, unsigned char)>:

word foo(byte b1, word w, byte b2)
{
    return b1 + w + b2;
    c067:	4f          	clra
    c068:	30          	tsx
    c069:	e3 02       	addd	2,x
    c06b:	eb 05       	addb	5,x
    c06d:	89 00       	adca	#0

0000c06f <.LM12>:
}
    c06f:	39          	rts</pre>
