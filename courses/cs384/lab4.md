---
title: "CS-384 Lab 4: Embedded OS Phase II"
---

## Overview

The purpose of this lab is to further your OS design knowledge by making use
of the HC11's SCI (serial communications interface) subsystem to add basic remote console
support to your system.

## Lab activity

Our lab 4 is similar to Dr. Welch's.

You are not required to support the ps, stop, and start commands.  You will instead implement the following:
* d ABCD - dump the value of the byte at the given hex address back to the user (as two printable ASCII characters transmitted from the serial port)
* m ABCD EF - modify the value of the byte at the given hex address as specified by the user
* q ABCD - change the time slices per quantum to the value (having a number of bits appropriate to your OS) specified by the user

## References
* M68HC11ERG.pdf: MC68HC11 E Series Programming Reference Guide
* M68HC11RM.pdf: MC68HC11 Reference Manual (especially section 9)

## Lab report (due by 11 P.M., the day before the week 10 lab)

Your lab report (one report per group) need not be self-contained. This means that it is
__not__ necessary to restate the entire specification in your report.

* Prepare your report in the XML format described in the
    Electronic Submission
    Guidelines.
* Include...
  * a brief discussion of the SCI routines you developed and how to use them in an application;
  * a brief discussion of the design of the rest of the new code for this lab;
  * details of any problems you encountered;
  * suggestions for how the lab could be improved;
  * things you could not figure out how to do;
  * a list of extra features that you implemented, if any;
  * conclusions;
  * a summary of each team member's activity log indicating how much time he or she spent
      on the assignment (following the template provided during the week 1 lab).
  * documented source code and make/qmake file, if
      used.  Document the __purpose__ of code and arguments, but do not
      document what is trivially obvious.  (e.g., "sts OF_SP,x ; <strike>store stack pointer at x+OF_SP</strike> preserve SP of user process")
* Follow the report submission requirements.
* Email this file to the instructor with a subject and message
    body indicating that this is your CS-384 Lab 4 submission.
