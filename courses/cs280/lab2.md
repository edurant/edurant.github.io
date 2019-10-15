---
title: "CS-280 Lab 2: Bouncing Light"
---

## Overview

The purpose of this lab is to familiarize the student with assembly
language program design. You may work in pairs and submit a group
report.

## Acknowledgment

This lab is based on a lab developed by Dr. S. Barnicki.

## Lab activity

In this lab, you will design, code, assemble, link, simulate,
download, and run a program. The program you will be writing is a
bouncing LED program (the &quot;Knight Rider&quot; effect). Start on the
left side of the eight-LED display, and turn on the leftmost LED
(remember, you send a 1 (one) to turn on an LED). Then wait, and turn
the next LED to the right on and the leftmost one off. Continue moving
the lighted LED to the right. After the LED on the far right is on,
move the lighted LED position to the left. Repeat this forever. Never
have all the LEDs off at any time. You are __not__ allowed
to use a look-up table (like the example in class) in this program. You
must use another algorithm to generate the LED pattern. Use the time
delay (wait) routine discussed in class.

All the downloadable programs are available at the <a
href="tools/">tools page</a>.

## Hints

You can use the LED demo program from class
as a starting point. The instructions you will use for this project
include the __JSR__ (or __BSR__) instruction
to call the wait function. When moving the on LED position to the right,
use a __ROR__ instruction. The carry flag can then be
tested (perhaps with the __BCS__ or __BCC__
instruction) to see if the bit you are shifting was moved into the carry
bit. To move to the left use a __ROL__ instruction.
Remember, the LEDs are active high on the F0x11; a zero (0) turns an LED off, and a one
(1) turns a LED on.

## Report (due by the beginning of the week 3 lab)

* Prepare a report in Microsoft Word or PDF.
  * Include your ASM code in your report file.
  * Include a summary of how much time each group member spent on 
      the lab, broken down into the following categories: design,
      code, test, debug, report writing, and other.
  * Detail any problems you encountered and any questions
      that remain about the lab material.
* Create a Zip archive including your report, program source files,
    final listing files (.rst), and executable file (.s19).
* Email this file to the instructor with a subject and message
    body indicating that this is your CS-280 Lab 2 submission.
* Be sure to follow the report
    submission requirements.
