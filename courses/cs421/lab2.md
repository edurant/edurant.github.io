---
title: "CS-421 Lab 2: Introduction to OpenGL"
---

## Overview

&quot;As you know, OpenGL contains rendering commands but
is designed to be independent of any window system or operating
system. Consequently, it contains no commands for opening windows
or reading events from the keyboard or mouse.
*\[OpenGL Programming Guide, 3 Ed., p. 16\]*

One portable solution to this problem is GLUT (OpenGL Utility 
Toolkit). Its drawbacks are that its GUI support is minimal and that 
it uses a C-style interface with callbacks. It is, however, freely 
available for many platforms, including Windows and Linux. Qt, while 
not freely available for development under Windows, is superior in many
areas. From CS-321, you already know about its robust, modern GUI
support and its use of virtual, overridable functions instead of
callback function registration. We will use Qt along with OpenGL; our
platform will be Linux.

## Demonstration (during week 2 or week 3 lab)

__<font color="Blue">Demonstrate</font>__
your working program to the professor (25% of grade).

## Activities

1. Study the <a href="example1_2.cpp">simple program</a> using GLUT from
Example 1-2 from the red book \[*OpenGL Programming Guide,
pp. 18-19*\]. You are not required to compile it, but doing so is
a good exercise and will get your computer set up to compile other
examples from the text and from class.  See <a href="glut.html">Using GLUT</a>.

2. Read the Qt documentation on <a href="http://doc.trolltech.com/qglwidget.html">QGLWidget</a>.

In order to make the simple program from the book work under Linux/Qt the
<a href="lab2start.zip">following components</a> are needed:

1. main.cpp: This is where the program starts. The QApplication object 
is created and the main QWidget is created and activated.

2. shell.{h,cpp}: This serves as the main QWidget for the application. 
As you develop your application, you will want to create your UI widgets 
(text entry boxes, sliders, etc.) within this widget. This widget also 
contains a myGlWidget...

3. myGlWidget.{h,cpp}: This is derived from QGLWidget and acts as an 
OpenGL-enabled drawing area. This is where you will do most of your 
work.

4. lab2.pro: This contains qmake directives that specify which source 
files are required for the project, which compiler options to use, which 
shared libraries to link against, etc.

To get the example working under Qt, do the following...

1. Override paintGL() so that it performs the operation of display() from the GLUT example program.

2. Override initializeGL() so that it performs the operation of init() from the GLUT example program.

3. qmake, make, and test the program.

To demonstrate that you understand the basics of using
OpenGL, modify the program so that it has two separate objects in
different colors.


Modify your program so that the
drawing is maintained at a 1:1 aspect ratio. You will need to
override the resizeGL function (same interface as and analogous to
the GLUT reshape callback (pp. 35-36)). Try to support
both horizontal and vertical letterboxing.

## Documentation

In CS-421, you will use <a href="http://www.stack.nl/~dimitri/doxygen/">doxygen</a> to automatically generate HTML documentation from your C++ files.
If you are familiar with another tool, such as javadoc, that produces the same type of documentation (browsable class and member documentation with appropriate diagrams 
of inheritance, etc.), you may use it instead.  Doxygen works by extracting specially formatted comments from your 
code files and using them to build documentation in a variety of formats.  Doxygen will also coordinate the <a href="http://www.graphviz.org/">Graphviz</a> tools to 
generate various UML and diagrams showing 
how your classes work; we will be taking advantage of this feature.  This approach to documentation ensures that the documentation is maintained with the code but that 
it can readily be formatted into a variety of useful formats (including HTML, LaTeX, PDF, XML, and manpage).

1. As root, ensure that the necessary Fedora-supported packages are installed: up2date doxygen libpng10
2. <a href="../graphviz-1.12-1.i386.rpm">Download the Graphviz binaries RPM</a> from the course website (or another source, if you prefer)
3. As root, install Graphviz: rpm -ivh graphviz-*
4. Under your user account, execute "doxygen" from your source code directory for information on configuring and running doxygen. After changing the following variables in the configuration file that you will have doxygen generate, you should be able to have it create HTML documentation in an "html" directory from your code:
   * PRODUCT_NAME: choose something meaningful
   * HAVE_DOT: turn on to tell doxygen that you have installed the software capable of creating various graphics (class diagrams, etc.)
   * EXTRACT_ALL: turn on to tell doxygen to include undocumented functions in the documentation and certain non-class items (e.g., main())
   * EXTRACT_PRIVATE, EXTRACT_STATIC: highly recommended - required to include these items in output regardless of whether they are documented
   * GENERATE_LATEX: turn off unless you also want to learn about LaTeX (an extremely powerful output format with typeset-quality formatting)

Explore the doxygen documentation and use features appropriate for documenting your code. If using doxygen well requires violating my normal documentation standard 
(e.g., I specify that certain items must be at the beginning of a file, but doxygen wants them elsewhere), the doxygen standards take precedence.

## Report (due by 11 P.M., the day of the week 3 lab)

Your lab report need not be self-contained. This means that it is
__not__ necessary to restate the entire specification in your report.

* Prepare your report in PDF, Microsoft Word, HTML, or plain text format
* Include...
  * a summary of what you did for this lab;
  * details of any problems you encountered;
  * suggestions for how the lab could be improved;
  * things you could not figure out how to do;
  * a list of extra features that you implemented, if any;
  * A summary (dates, times, durations, and interruption durations) of your activity log indicating how much time you spent
      on the assignment. Use the following categories:
    * Design
    * Coding
    * Debug (before you think it's working)
    * Test (after you think it's working)
    * Documentation
    * Other
  * Documented source code
  * Code documentation with appropriate diagrams as produced by doxygen,
      javadoc, or a similar in-source documentation tool.  See the above
      __Documentation__ section for details.
* Follow the report submission requirements.
* Email this file to the instructor with a subject and message
    body indicating that this is your CS-421 Lab 2 submission.
