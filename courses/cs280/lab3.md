---
title: "CS-280 Lab 3: Scroling Message"
---

## Overview

The purpose of this lab is to become familiar with the
2&times;16 character display and to integrate and adapt code from
the previous 2 labs. You may work in pairs and submit a group
report.

## Lab activity

In this lab, you will design, code, assemble, link,
download, and run a program. The program you will be writing is a
display animation program. Specifically, you will scroll a message
of more than 16 characters across the first line of the 2&times;16 character display.

Begin by carefully studying the sample program.
Download it into your "ROOT"\lab3 directory and try it on your Fox11.
You will also need to download wytec.s and place
it in your "ROOT" directory.
Note that the LCD_LINE1 routine "clobbers" registers D (A:B) and X.
This can be a problem if you have important values in those registers.
A solution is to save copies of the important values before calling the
subroutine and to restore them after.  This can be done using the stack.

<pre>    psha                ; Save important value from A to stack
    pshx                ; Same for X
    jsr     LCD_LINE1   ; LCD_LINE1 destroys D (A:B) and X.  Y is untouched.
    pulx                ; Restore important value from stack to X (stack/nested order)
    pula                ; Same for A</pre>

Use the time delay (wait) routine from the last lab so that there is enough
time to see that your message is scrolling. You are only required to scroll
the message once, but may scroll it repeatedly or cause it to bounce back and forth if you 
wish.  You may adapt the strnlen code
from the first lab to calculate the length of the string, which will allow
you to calculate the number of frames to display.  Or, you may just check for the NUL 
character at the end of your .asciz string.

For example, if your string is "Quis custodiet ipsos custodes?", your successive frames would be...

<pre>Quis custodiet i
uis custodiet ip
is custodiet ips
s custodiet ipso
 custodiet ipsos
custodiet ipsos
ustodiet ipsos c
stodiet ipsos cu
todiet ipsos cus
odiet ipsos cust
diet ipsos custo
iet ipsos custod
et ipsos custode
t ipsos custodes
 ipsos custodes?</pre>

The display on the Fox11 uses the ubiquitous Hitachi chipset.  Specifically,
the display is manufactured by Hantronix.  As can be seen in the sample program for
this lab, we are interfacing with the display at a fairly high level using routines
in the Fox11 ROM.  LCD_SPEC.PDF on your Fox11 CD (or in your Ep2IDE/document folder
after installation) contains a wealth of information about the display, but, for the
current lab, page 8 in the PDF is of interest.  It shows that the Hitachi chipset
supports all of the standard ASCII characters, plus a number of Japanese and
scientific characters.  For comparison, here is the 7-bit
<a href="lowASCIIchart.gif">ASCII character set</a>.

## Report (due by the beginning of the week 4 lab)

* Prepare a report in Microsoft Word or PDF.
  * Include your ASM code (.s file) in your report file.
  * Include a summary of how much time each group member spent on
      the lab, broken down into the following categories: design,
      code, test, debug, report writing, and other.
  * Detail any problems you encountered and any questions
      that remain about the lab material.
* Create a Zip archive including your report, program source file(s) (.s),
    final listing file (.rst), and executable file (.s19).
* Email this file to the instructor with a subject and message
    body indicating that this is your CS-280 Lab 3 submission.
* Be sure to follow the report
    submission requirements.
