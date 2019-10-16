---
title: "CS-384 Lab 3: Embedded OS Phase I"
---

## Overview

The purpose of this lab is to increase understanding of operating system
process management by implementing some components of a preemptive multitasking operating 
system for the Motorola 68HC11 microprocessor.

## Lab activity

Design and implement a simple dispatcher and round-robin scheduler for
the 68HC11 microprocessor using assembly language (GNU as/ld, used in CS-280, is recommended; C++ 
is not allowed). You must also design and implement at least two &quot;user&quot; processes:

* The first user process should count down an eight-bit value and display
  it on the alphanumeric display. Initially, the counting rate should be
  determined by a software delay loop. Put this delay function in a separate subroutine so
  it will be easy to modify its operation later.
* The second user process should produce a pattern (e.g., counting or
  motion) on some (3-4) of the discrete LEDs. Again, use your &quot;delay&quot;
  subroutine to set the speed with which the pattern changes. (Note that later this code
  will be modified to use a different waiting method.)

The OS dispatcher should be designed to handle up to eight processes,
though initially only the two above will be used. It should have a manually variable time
quantum value (from tens of milliseconds to a few seconds); when the currently running
process has exhausted its quantum, the dispatcher should context switch to the next
&quot;ready&quot; process. __Be sure to handle the possibility that there is no
&quot;ready&quot; process.__  This could be accomplished by using an idle process.

I recommend that you use the real-time interrupt to interrupt the running process at regular 
intervals, count down the number of interrupts remaining in the quantum, and, if needed, dispatch 
to a new process. See <a href="../cs280/outline.html">my week 
9 day 2 notes for CS-280</a> for a review of the real-time interrupt. Refer to table 10-2 in 
the RM (page 385) for real-time interrupt timing information. Note that the RTI is not 
affected by the master timer prescaler even though it comes after it in the timing chain; the 
HC11 internally compensates the RTR to achieve this.

If you prefer, you may also use the timer overflow interrupt. Assume that your OS must run in 
normal mode and that you are not able to control the startup code that runs during the first 64 
cycles, when any change to TMSK2:PR must be made.

Each process must have its own stack; the stack areas may be
allocated statically (e.g., each of the process &quot;slots&quot; may have a fixed stack
area associated with it).

Observe the behavior of the processes as you vary the quantum; by
setting a large quantum value (e.g., 2-3 seconds), it should be possible to see the system
&quot;time slicing&quot; from one process to the next.

Once the basic round-robin scheduling is working, add the following
capabilities:

* __[Required]__ An operating system call that puts a process
  to &quot;sleep&quot; for a specified duration (in quanta). The process should yield
  what is left of its quantum and not re-enter the ready state for the number of quanta
  specified in the argument to sleep. It is probably best to implement this call
  as a JSR to an operating system routine. (Another option is to
  make use of the SWI instruction.)
  Your process code should be written so that a software &quot;switch&quot; (e.g., ".if {0,1} .else .endif -- see section 7 of the GNU as manual) will select
  whether delays are done with a &quot;busy waiting&quot; loop or the &quot;sleep&quot;
  call. Note any differences in behavior between these two delay methods.
* __[Extra credit, optional]__ Implement an OS-level binary
  semaphore (mutex) facility. You may limit the number of semaphores to eight, and you may
  require a fixed ID (e.g., 0 to 7) to specify a particular semaphore. Modify your
  &quot;application&quot; code to make use of at least one semaphore to protect some common
  data (perhaps the display, which could be demonstrated by having 2 different processes
  write to the display).

__Note:__ Past experience has shown the importance of
detailed analysis and good design. It is very easy to get lost in the assembly language
coding if you have not carefully considered your data structures and function
decomposition beforehand. 
<a href="../cs280/outline.html">My week 3 day 1 notes for CS-280</a> 
provide some hints on how to implement data structures in assembly language.

Three lab periods are allocated for this project. It is recommended that you use the GNU 
assembler and linker (You have the option of using an IDE, such as MGTEK
or Tarantula.), the Wookie simulator,
and the WBUG11 downloader/debugger. See <a href="../cs280/tools/">my
68HC11 tools page</a> for the core toolset. If you are not familiar with this software or the hardware,
please ask the instructor for assistance. Keep in mind that there 
are significant differences between the Wookie environment and the physical 
hardware. Wookie does not simulate the Fox11's LCD display or port layout.
Also the default values for registers and memory and the memory map differ.

## Milestones

* By the start of week 5 lab period: Demonstration of a working real-time
  interrupt; source code to be turned in
* By the start of week 6 lab period: Demonstration that at least two 
  processes can be swapped between; source code to be turned in
* By the start of week 7 lab period: Demonstration of at least two 
  processes and sleep feature; report due

## References
* MC68HC11 E Series Programming Reference Guide
* MC68HC11 Reference Manual
  * Page 370: Figure 10-1: Main Timer System Block Diagram
  * Page 380: Table 10-1: Crystal Frequency versus PR1 and PR0 Values
  * Page 385: Table 10-2: RTI Rates versus RTR1 and RTR0 for Various Crystal Frequencies
  * Page 387+: Section 10.4.4: Tips for Clearing Timer Flags

## Lab report (due by 11 P.M., the day before the week 7 lab)

Your lab report (one report per group) need not be self-contained. This means that it is
__not__ necessary to restate the entire specification in your report.

* Prepare your report in the XML format described in the Electronic Submission
    Guidelines.
* Include...
  * A discussion of the design of your operating system
      including a description of how you implemented the various mechanisms (e.g.,
      sleep);
  * details of any problems you encountered;
  * suggestions for how the lab could be improved;
  * things you could not figure out how to do;
  * a list of extra features that you implemented, if any;
  * conclusions;
  * a summary of each team member's activity log indicating how much time he or she spent
      on the assignment (following the template provided during the week 1 lab).
  * documented source code and make/qmake file, if
      used. Document the __purpose__ of code and arguments, but do not
      document what is trivially obvious. (e.g., "sts OF_SP,x ; <strike>store stack pointer at x+OF_SP</strike> preserve SP of user process")
* Follow the report submission requirements.
* Email this file to the instructor with a subject and message
    body indicating that this is your CS-384 Lab 3 submission.

<hr>

This lab was developed by Dr. Barnicki, Dr. Durant, Dr. Sebern, and Dr. Welch.
