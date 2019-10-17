---
title: "Dr. Durant: CS-280: Sample Problems"

## Week 3, Lecture 3 (Instruction set: bit/logic, branches)

__Standard__: Write assembly code to convert a number from 0x00 to 0x0F stored in register A
to an ASCII character code representing that character. Test your code in Wookie.
Referring to page 71 of your pink book, note that the codes for character '0'
through '9' and 'A' through 'F' are adjacent, but the code for '9' is not adjacent
to the code for 'A'. Write this in C++ first, substituting an "unsigned
char" (8-bit value) for register A; you will need a conditional statement to
determine which of the 2 ranges your input is in. Just as you can write integer
expressions such as "'A'-3" in C++, you can write integer expressions such as
"'A-3" (only a leading quote for a character) in assembly. For documentation
purposes, your final code should not use any explicit ASCII values; instead use 'A,
etc.

## Week 4, Lecture 2 (Instruction set: subroutines, stacks)

__Standard__: Write ASM code to evaluate the following arithmetic expression, where each variable is stored in a
global memory location: f * g + h / i. Assume each value is an 8-bit unsigned integer and the result is to be of
the same type.

__Advanced__: Write a subroutine that swaps the 16-bit return address on the stack with the value stored in a global
variable and then returns. Put 2 programs in your .s file, one with the label \_start, and another with the label
\_start2. Initialize the aforementioned global variable with the address of \_start2. At one point, each program
should bsr to the subroutine, which will return to the other. You should assume that your register values are
changed when calling this subroutine (since the other main program might do so); also, this will not work if both
programs try to store items on the stack (besides the return address via bsr). You have just written a simple,
2-process, non-preemptive multitasking operating system. A better operating system would need to maintain
separate stacks and register values for each program ("process").

## Week 5, Lecture 3 (C++ review/compiler)

__Standard__: Translate the following into assembly language, where each variable is a byte. Check your answer by
using the HC11 GCC compiler...
<pre>	byte j = 0x53;
	byte k = 0x39;
	byte l = 0x5A;
	k ^= j | l;</pre>

## Week 6, Lecture 1 (ASM vs. C++ structure, ...)

__Standard__: Prototype in C++ and implement in assembly a function that sends the 2's complement of the value
present on the PORTC pins (assume they have been configured for input) to port B, waits 100 ms, and then returns
the 8-bit value present on port c.

## Week 6, Lecture 2 (Parallel I/O)

__Standard__ (ask for help on hardware setup, if needed): Using simple strobed input mode and the HC11 briefcase and
experiment board, write a program that reads a 4-bit value from the DIP switches and displays the corresponding
number between 0 and 15 on the 4-character display whenever one of the pushbuttons is pressed. Use the 4 MSBs of
port C for input from the DIP switches. The display
should retain the number until the button is pressed again, even if the DIP switches are moved to another
configuration.

## Week 7, Lecture 1 (Parallel I/O: Handshaking)

__Standard__: Design the key elements (hardware setup, output loop) of a program that uses handshaking output to send
a list of 50 1-byte values to an external device. This device interprets each 8-bit value as a weight from 0 oz.
to 255 oz. (15 lb. 15 oz.) and prints a label. Printing a label usually takes a few seconds, but sometimes takes
longer as the label paper must be refilled. So, STRA will be a signal from the device to the HC11 specifying
when the next piece of data can be sent. Specify what other information you need to know about the device in
order to set up the handshaking I/O system and write the complete program.

## Week 7, Lecture 2 (A/D)

__Standard__: Write a program that displays the analog voltage input to PORTE pin 3 on the
experimenter board's 4-character display. The number may either be displayed
as a 2-digit hexadecimal number or as a decimal number between 0 and 255.
The display should be updated approximately 8 times per second.

## Week 7, Lecture 3 (A/D and integer scaling)

__Standard__: Using the integer division and/or multiplication instructions on the
HC11, scale the sum of 4 successive readings of an A/D input to 16-bit integer in the
range 0-50, 0-500, or 0-5000, each representing 0 V to 5 V with varying degrees of
precision. Comment briefly on the accuracy of the least significant digit and the
degree of bias in your integer calculation.

## Week 9, Lecture 1 (Interrupts)

Modify your solution to the Week 6, Lecture 2 problem. Instead of monitoring the STAF
bit yourself, enable the STAI interrupt and put the code that updates the display
in your ISR. (The same vector is used as for the IRQ interrupt.) You will still be using
simple strobed input mode, so the rules for clearing STAF are unchanged.
