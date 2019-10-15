---
title: "CS-280 Lab 1: Assembler Introduction"
---

## Overview

The purpose of this lab is to acquaint you with the embedded software development
tools that you will be using throughout the quarter.
You may work in pairs and submit a group report.

## Lab activity

In this lab, you will assemble, link, simulate, download, and run
a program.

* assemble - convert assembly language (often in an .s file)
  to machine language (often in an .o \[object\] file)
* link - resolve references between objects and, often,
  locate machine code at specific addresses (the end result, in
  our case, will be an ELF executable file)
* simulate - test the executable in a software program that
  acts like the intended target system in many ways (we
  will use the Wookie simulator)
* target system - the hardware and software environment (e.g., Fox11
  board) in which the embedded system software is intended to run
* download - transfer data or code to a secondary computer
  system, in this case the Fox11 board

Begin by getting the assembly source file from this web site:
<a href="lab1.s">lab1.s</a>.
The .s filename extension signifies human-readable assembly language.

## Tools

Since you will need them for this and future labs, install the tools available from the
<a href="../tools/">tools page</a>. Skip section V, since it applies to the
MSOE briefcase, which we are not using.

Next, assemble the program from a command prompt (be sure to see the
tools page for instructions on how to open a properly configured command
prompt window) by entering:
<br><kbd>as -o lab1.o lab1.s</kbd>

The options (text that follows the "as" assembler command) tell the assembler 
to:

* -o lab1.o - generate an object file (lab1.o)
* lab1.s - assemble this file

The following commands will tell you some interesting information about the
object file.  You don't need to know what all of this means yet, but be sure
the examine the output to see what you can learn.  Check with your instructor
if you have any questions.

* size lab1.o
* strings lab1.o
* objdump -h lab1.o

Next, run the linker with the command:
<br><kbd>ld -T ../fox11w.x -o lab1.elf lab1.o</kbd>

The options mean:

* -T - ignore the default linker configuration
* ../fox11w.x - use the linker configuration file from one directory up (your root working directory) - This file describes the memory layout on the Fox11.
* -o lab1.elf - create an executable in the default format (ELF format for this toolchain) named lab1.elf
* lab1.o - link this file

fox11w.x sets up memory as follows...

* 0xF000-0xFFFF (4 kB): non-const data
* 0x8400-0xEFFF (27 kB): code and const data
* 0xFFBF: first location on a stack that grows downward in memory
      (if you have a lot of stack and non-const data, they will
      try to use the same memory, almost certainly causing
      unexpected results)

Create a human-readable listing of your ELF executable with the command 
<br/><kbd>objdump -d lab1.elf &gt; lab1.rst</kbd>

__Question:__ Where does the data area end up? (__Hint:__ Inspect the .rst file and
see if you can figure this out -- feel free to ask the professor for help.)

Create an S19 format executable for use by Wookie and WBUG11.
S19 is a simple format that specifies which values to store at which
addresses and little else.  It is not easy for a human to read (take a look
and ask your instructor if  you are curious about the details), but
is conveniently formatted for loading into the HC11's memory by a
program like WBUG11.

<kbd>objcopy -O srec lab1.elf lab1.s19</kbd>

Now you are ready to use the executable (lab1.s19). Run the
executable on both the Wookie Simulator and the actual Fox11
hardware.

### Wookie

Skim Dr. Sebern's *Introduction to the Wookie 68HC11 Simulator*.

* Start Wookie.  After running Wookie for
the first time, .s19 files will be associated with it, so you can double-click them to open them in Wookie.

* Select File | Load and locate and double-click on your .s19 file.

* You will see a dialog box. 
You will need select "Rug Warrior Expanded" mode and change the starting address for the
code to 8400 to match your program.

* A dialog appears asking you the format of your listing file.  Accept the default
of GCC3.

* Next press the
&quot;M68HC11 CPU&quot; button. This will let you examine the registers.

* You can also press the &quot;Browse Mem.&quot; button, to allow you to
see the data in memory. Scroll down to the data memory address you found in
the listing file.

* You can now single step through the program by
repeatedly pressing the icon of the person walking (keyboard shortcut: spacebar).
Or, you can run at full
simulator speed by pressing the red dot (it turns green while running).
Watch the registers and memory change while single stepping.

### Fox11 (hardware)

* On your Fox11, ensure that J15 is in the Wytec position.

* Connect your Fox11 to power.  It will turn on as evidenced by PB0 illuminating.

* Connect your serial cable between your computer and your Fox11's upper right serial port (P2).

* Press Reset on your Fox11 and note that PB0 blinks to acknowledge the reset.

* Start AsmIDE.

* Enable the Wytec tools by selecting View | Options | Wytec HC11 Options (tab) and check
Enable Tools.

* Under the Build menu, select "Wytec 68hc11 Tools".

* Click "...", locate your S19 file, and then click "Select this file", followed by "Debugger".

* You should observe a console window open.  After several messages, you should see "lab1.s19 downloaded."
Do not be concerned with the messages about the missing .sym and .par files.  You can 
run full screen and in color by pressing Alt+Enter (press Alt-Enter to return to 
windowed mode).

* Press "g" and notice that the downloader/debugger enters the "Go" command for you.  It is now waiting for
an address in memory.  Type "8400" (this is in hexadecimal - no base prefix is needed) and press Enter.

* The Fox11 runs at 2 MHz, so the program will complete virtually instantaneously.
Hit ESC and examine the data memory (use the Dump command as described in the help, accessible via F1).

* Now, observe the program running step-by-step.  Hit 'R' to modify registers inside the HC11.
You will be prompted for a "PC" value.  Enter 8400, the start of your program.  You are then
prompted for a "Y" value, but press escape as you do not need to modify anything else.

* Press 'N' to have your program take a single assembly language step.  Repeat this several times,
noting how the PC (program counter, address where an instruction is about to run) changes, along with
'Y' (counted characters) and 'X' (address of the character being examined).

* Try some of the other features in the downloader/debugger, asking your instructor for assistance
as needed.  Do not worry that much of this is unfamiliar right now.

## Report (due by the beginning of the week 2 lab)

* Prepare a report in Microsoft Word or PDF.
  * Include a summary of how much time each group member spent on
        the lab, broken down into the following categories: design,
        code, test, debug, report writing, and other.
  * Detail any problems you encountered and any questions
        that remain about the lab material.
  * It is not necessary to include your code this week, since you did
        not write or modify it.
* Create a Zip archive including your report, program source files,
      final listing files (.rst), and executable file (.s19).
* Email this file to the instructor with a subject and message
      body indicating that this is your CS-280 Lab 1 submission.
* Be sure to follow the report
      submission requirements.

__Be sure that you answer
the following questions in your report__.  Find the answers in your
.rst file and by inspecting memory in Wookie and/or your Fox11
via AsmIDE/WBUG11.

* Where does the program's executable code begin?
* Where is the data value (string length) stored?
* What is the stored data value?  Does it make sense?
