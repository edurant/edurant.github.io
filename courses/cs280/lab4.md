---
title: "CS-280 Lab 4: Adding Machine"
---

## Overview

You will design and implement an adding machine
making use of the 16&times;2-character display and matrix keypad included with
the Fox11 system. This is a 2-week assignment. You may work alone or in pairs
and submit a group report. Demos are due at the beginning of the week 5 and 6 labs.

## Lab activity

Design, code, assemble, link, download, and run an adding
machine program.

### Requirements - Mandatory

Meeting these requirements but none of the optional requirements will result in a maximum score of 85% on each demo.

* Support a series of positive integer addends from 0 to 99 and sums from
    0 to 9999.
* Display the sum on the top line. Overall alignment does not matter, but the 1s digit must always appear in the same place, etc.
* Accept addend entry via the keys labeled &quot;0&quot; through
    &quot;9&quot; on the keypad.
    * Ignore leading 0s as addends are being entered.
    * Display it on the bottom line as it is entered.
    * If the user enters too many digits, you may either ignore them or shift out the 10s digit (e.g., "789" may become "78" or "89").
* 'A' adds the current input to the accumulator.
    * Do not clear the current input after adding it.
    * You may either limit the sum to 9999 or allow it to roll over, discarding the 10,000s place (e.g., 9990 + 20 can result in 9999 or 10).
* 'C' is the clear key.
    * If an addend entry is in progress (equivalent to "addend is not 0"),
        the clear key will cancel the entry and cause a 0 to be displayed.
    * Otherwise, the clear key will set the sum to 0.
* Ignore all other keys.
* The sum and addend are initially 0.

### Requirements - Optional

Meeting these requirements will result in additional points on the demos.

* Ignore digits beginning with the 2nd digit after the 1st
    non-zero digit (that is, ignore digits entered when the 10s
    digit is non-zero).
* If the result would be greater than 9999, make the result 9999.
* The sum and the addend should not be displayed with leading 0s (but a value of 0 will show as '0'). Also, the leading characters must be blank (<kbd>#' </kbd>).
* The 10s and 1s digits of the addend must line up with those of the sum on the line above.
* Add support for subtraction, clearly documenting whether you allow negative results, which letter key is used to subtract, etc.


### Suggestions

* Use <a href="getkey.s">this code</a> to get a key from the keypad. This subroutine returns the
    number of the pressed key (0x00 - 0x0F) in accumulator B.
* Begin by designing a program that shows the pressed key on the
    display.
* Before going any further, document that <strong>state
    variables</strong> and draw the <strong>state transition
    diagram or table</strong> for the adding machine. Ask
    the instructor if you have any questions about these methods.
    Make sure that you have an unambiguous description of the system's
    behavior.
* Reserve data memory locations for the current input and the sum.
* Make subroutines for:
    * display output (lines separately or together, provide higher level functions than LCD\_LINEn, etc.);
    * handling a numeric key;
    * handling the A key;
    * handling the C key.
* The <kbd>DAA</kbd> (decimal adjust A) instruction
    will be useful in the adding machine
    portion of this assignment. Adding 2-digit BCD numbers with the
    <kbd>ABA</kbd>, <kbd>ADD</kbd>, or <kbd>ADC</kbd> instructions
    sets the proper CCR bits for the <kbd>DAA</kbd> instruction.
    After the <kbd>DAA</kbd> instruction, the C bit indicates
    whether the result was greater than 99.
* You can multiply a BCD number in the range 0-9 by 10 by
    left-shifting it 4 times.
* Present your algorithm using a flowchart.

### Connecting the keypad

The keypad will only work when connected to J6 (near the DIP switches) such that the 
keypad is facing up when it is bent away from the Fox11 board. There are 10 holes in the 
socket but 8 pins on K6&mdash;there is one unused pin on each side of the socket.

### .include "keypad.s"

If you use .include "keypad.s" to access the keypad code from your main program, 
you should do so at the end of your .s file. Otherwise, the keypad code will be assembled 
before the \_start of your program, so you would need to use an address different than 8400 
(which could be found in the .rst file) to start your program.

## Demonstrations

Your first of two demonstrations is due at the beginning of the week
5 lab and is worth 20% of the lab 4 grade. You must be able to enter an
addend, demonstrate where it is stored in memory (in a single byte), and
properly output it to the display. The 'C' key must clear the addend.
Successfully meeting all the mandatory requirements related to the
features for this demo will result in a demo 1 grade of 85%. Additional
points will be given for meeting the relevant optional requirements.

Your second demonstration is due at the beginning of the week 6 lab
and is worth 30% of the lab 4 grade. Successfully implementing all
mandatory requirements will result in a demo 2 grade of 85%. Additional
points will be given for meeting optional requirements, up to a maximum
of 100% if all optional requirements are met.

## Report (due by 11 PM on the day of the week 6 lab)

* Prepare a report in Microsoft Word or PDF.
    * Include your ASM code in your report file.
    * Summarize how much time each group member spent on
        the lab using the following categories: design,
        code, test, debug, report writing, and other.
    * Remember that FAST time entry will be checked with this report -- see the course outline for details.
    * Document your design. Use appropriate diagrams or tables,
        including flow charts (required) and state diagrams (recommended).
    * Show sample output. This might be a text representation of what was
        on your display with notes about which keys were pressed to get
        to the next output.
    * Detail any problems you encountered and any questions
        that remain.
* Create a Zip archive including your report,
    program source files (.s),
    final listing file (.rst), and executable file (.s19).
* Follow the report
    submission requirements.
* Email this file to the instructor with a subject and message
    body indicating that this is your CS-280 Lab 4 submission.
