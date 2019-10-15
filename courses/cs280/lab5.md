---
title: "CS-280 Lab 5: Mixing C++ and Assembly: Door Lock and External Display"
---

## Overview

In this lab, 
you will learn how to test and debug large portions of C++ code destined for 
an embedded system using a standard compiler for a desktop computer system (MSVC). 
Also, 
you will learn how to implement portions of code in both C++ and ASM as appropriate to implement a display driver for
your 2-line by 16-character display. 
Specifically, you will...

* implement an "Employee" class and test a secure door lock application on a PC;
* and implement a class for sending characters to an external 2&times;16 LCD display based on a provided base "Display" class;

This is a 2-week assignment. You may work alone or with a partner and submit a group report.

## Lab activity

### Part I

1. Download and unzip <a href="lab5.zip">lab5.zip</a>. You will only need to edit 
some of the files, but you will need to refer 
to several of the other files as you work on this assignment...
    * DoorLock.h &#8211; specifies a class representing a secure door lock
    * DoorLock.cpp &#8211; implements the DoorLock class (you do not need to edit this file)
    * Employee.h &#8211; specifies a class representing an employee for use by the door lock
    * Employee.cpp &#8211; you will need to implement the Employee class in this file
    * main.cpp &#8211; the main() routine for the program &#8211; works either as a Windows console application or a Fox11 application
    * getkey.s &#8211; getkey in ASM with C++ interface (you do not need to edit this file)
    * Display.h &#8211; specifies an abstract base class for various character display devices (you do not need to edit this file)
    * ConsoleDisplay.{h,cpp} &#8211; specify and implement a class for using a PC text console (you do not need to edit these files)
    * LCDDisplay_Fox11{.h,.cpp,_supp.s} &#8211; specify and implement (you provide this part) a class for your 16&times;2 character display using both C++ (.cpp) and assembly (.s).
    * Makefile &#8211; An NMAKE configuration file that can be used to easily build your entire project for the Fox11.
2. Implement the Employee class.
3. Build the application in MSVC.
    * Create a Win32 Console Project and add the following files to it: ConsoleDisplay.{h,cpp}, Display.h, DoorLock.{h,cpp}, Employee.{h,cpp}, main.cpp
    * Note that the preprocessor symbol &quot;INTERACTIVE&quot; is set to 0 in main.cpp. This gives a version of the application that simulates several key presses 
        (defined by the testKeys array) for quickly testing the application (either as a Windows console program or on the HC11). Once the Employee class is implemented 
        correctly, your output will match the information shown in <a href="lab5.out">lab5.out</a>.
    * You can change &quot;INTERACTIVE&quot; to 1 and rebuild the application to allow it to take input from the keyboard (use '0'&#8211;'9' and capital 'A'&#8211;'F').

### Part II

Note: If your working directory is on a different drive letter than your toolchain installation (the default was c:\usr\), you will receive an error message when 
you run the compiler. There are a few solutions, but the easiest is to move your working directory somewhere on the drive with the same letter as the 
toolchain.

1. Consult LCD_SPEC.PDF from your Fox11 installation (inside the C:\Ep2IDE\document folder) for an overview of what your display is capable of.
HD4780.PDF contains a lot of additional information about the display hardware, but we do not need it for this lab.

2. Although we could send the commands shown in the documentation directly to the display, we would have to break each command byte up into 2, 4-bit segments.
This is because, to save I/O pins, the Fox11 design uses the 4-bit data mode. Instead, you will use some of the following routines that are available in the Wytec 
ROM...

<pre>LCD_INI		=	0x080F	; Initializes the 16x2 LCD module
LCD_LINE1	=	0x0812	; Displays 16 characters at 0,x to LCD 1st line. Destroys D (A:B) and X. Y is untouched.
LCD_LINE2	=	0x0815	; Displays 16 characters at 0,x to LCD 2nd line. Destroys D (A:B) and X. Y is untouched.
SEL_INST	=	0x0818	; Prepares LCD module to receive an instruction
				;  See HD44780U for instruction details
				;  e.g. 0x80 Would prepare the display to receive data for line 1, 0xC0 for line 2
SEL_DATA	=	0x081B 	; Prepares LCD module to receive data
WRT_PULSE	=	0x081E	; Send data in A to LCD module</pre>

* We consider these 6 functions to be the "layer 0" functions. You will build more sophisticated functions upon these. The 4 levels in our hardware interface 
are:
  * Layer 3: Application layer interface - output characters and scroll strings
  * Layer 2: Interfaces to various chipset functions (see LCD_SPEC.PDF for chipset functions).
  * Layer 1: C++ wrappers for ROM routines - slightly simplified interface
  * Layer 0: Provided ROM routines

3. In LCDDisplay_Fox11.h, note the 3 layer 1 functions. These all have C++ interfaces and are callable from C++ code, but will actually be implemented in assembly.
Some of these are implemented in LCDDisplay_Fox11_supp.s to get you started.

4. We are only using 1 layer 2 function (clear); it has already been implemented for you. The other 2 layer 2 functions are not needed for lab 5.

5. You will implement the putChar and showString functions at layer 3. putChar will call mostly layer 1 functions to output a single character. showString
will output a string, optionally scrolling it if it is too wide for the display. You may use the wait() function (argument in milliseconds) for delays and the putChar 
function to place the individual characters.

6. To send a character, you will need to call 4 layer 1 functions in order...
* registerSelect - select the instruction mode
* writePulse - send an instruction byte to place the cursor
* registerSelect - select the data mode
* writePulse - send the ASCII code for your character

...see the given setMode implementation for an example of sendinging a simpler command.

7. Complete the specified and partially implemented "LCDDisplay_Fox11" class (derived from Display) to control the 16&times;2 display. Begin by completing
the C++ functions in LCDDisplay_Fox11.cpp and then complete the layer 1 functions in LCDDisplay_Fox11_supp.s.

8. After you open a window in the appropriate directory and run gccvars.bat, you will also need to run vcvars32.bat to gain access to the Microsoft NMAKE utility.
If you have VS.NET 2003 installed, the location should be __&quot;C:\Program Files\Microsoft Visual Studio .NET 2003\VC7\BIN\vcvars32.bat&quot;__; you 
should be able to copy (__with the quotation marks__) and paste this text into your command window. An older version of Visual Studio will do fine, but the 
path to vcvars32.bat will be different.

9. The provided Makefile contains instructions in NMAKE format for running the compiler, assembler, linker, etc., in the proper order to build your ELF, S19, and RST 
files from the assorted C++ and ASM source files. The system is quite powerful in that if you only modify 1 source file and enter "NMAKE", only the affected files will 
be updated. This can save a lot of build time on large projects. The Makefile contains some documentation; read through it to understand the key capabilities of NMAKE. 
To run NMAKE, type "nmake" at the command prompt (it looks for "Makefile" by default). It will run the appropriate tools until it generates your 3 main output files or 
until it reaches an error. You can see the commands it is using to invoke gcc, as, etc., as it runs.

10. Update main.cpp to select LCDDisplay_Fox11 instead of ConsoleDisplay; ensure that INTERACTIVE is 0. Use nmake to build the application, and then test it on the 
Fox11.

### Part III

Now that you have debugged the LCDDisplay_Fox11 class on the Fox11 and the application logic on Windows, ensure that the interactive application works correctly on the 
Fox11. This will make use of the updated keypad.s routine from this week's Zip file. Change INTERACTIVE to 1 in main.cpp so that the keypad routine is used instead of 
the standard test sequence, and then run the final application on your Fox11.

## Demonstration

You will need to demonstrate your project to the instructor using your Fox11 system 
at the beginning of the week 8 lab period. The demonstration determines 50% of your lab 5 grade.

## Acknowledgment
This lab was developed by Dr. Durant.

## Report (due by 11 PM on the day of the week 8 lab)

* Prepare a report in Microsoft Word or PDF.
    * Include just source code files that you modified in your report file.
    * Summarize how much time each group member spent on
        the lab using the following categories: design,
        code, test, debug, report writing, and other.
    * Document your design.
    * Show sample output.
    * Detail any problems you encountered and any questions
        that remain.
* Create a Zip archive including your report, modified/created program source files
    (.s and .cpp), final listing file (.rst), and executable file (.s19, 
    but not .exe).
* Follow the report
    submission requirements.
* Email this file to the instructor with a subject and message
    body indicating that this is your CS-280 Lab 5 submission.
