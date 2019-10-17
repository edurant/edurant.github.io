---
title: "CS-384 Lab 1: Unix System Calls"
---

## Overview

The purpose of this lab is to review the C++ programming environment on the UNIX
(Linux) operating system and to make use of some simple operating system calls.

## Background

If you have not taken CS-321, you might not be familiar with building C++ programs in the UNIX/Linux environment. Using qmake
to do this will be discussed during the first lab. If you are familiar with (or wish to investigate) writing Makefiles directly
or using KDevelop (IDE, automatic &quot;make&quot; files, color-coded source editor, etc.), you may use one of those methods as well.

## Preliminaries: Getting Set Up

Log into your Ubuntu image.

### Part 1: Adding and updating packages

Run System | Administration | Snaptic Package Manager.
	Enter your password to confirm that you are the first system user
	(the default user with administrative privileges under Ubuntu).

Ensure that the following packages are selected: manpages, manpages-dev, libqt3-headers, libqt3-mt-dev (includes qmake), gedit. You might also want to search for and install the "kevelop" packages.
This
provides an IDE (integrated development environment) for C++ that you may wish to try, but the method supported in class will be using a text editor and the command line compiler tools.

Click "Mark All Upgrades" to bring your system up to date with the latest Ubuntu patches. We recommend using the "Smart Upgrade" option.

Click "Apply".


### Part 2: A sample program

* Run Applications | System Tools | Terminal
* Create a directory for your program and change into it: "md hello", "cd hello".
* Create a C++ sample program: "gedit hello.cpp&". gedit is an editor. You may use other editors, such as nedit or nano, if you have them installed. Enter a simple program that sends some text to
cout. Save the file.
* Return to your command window and enter "ls -l" to see the file you just created.
* Type "qmake -project" to have qmake look at your C++ .h (none yet) and .cpp files and generate a recipe for building your program. Type "ls -l" again and note that a .pro file (qmake project
description) has been created.
* Run qmake to convert the .pro file into a build recipe (Makefile).
* Run make to generate your software and see any compiler errors.
* Correct any errors and rerun "make". You only need to rerun qmake if the files in your project change, or if certain dependencies (e.g., #includes) between your files change.
* Run your program with "./hello". The "./" indicates that the program is in the current directory. By default, most UNIX-based systems do not look for commands in the current directory as a security
measure.

### Part 3: Man(ual) pages
* First, update the man page database based on the packages you installed earlier. "sudo -s" from a terminal prompt to become the administrator. "updatedb" to update the man page database". "exit" to
return to being a normal user.
* Type "man uname" to get information on UNAME(1). The "1", here, indicates that this is a command to be used from a terminal window.
* Type "man 2 uname" to get information on UNAME(2). The "2", here, indicates that this is a function that you can call from a C or C++ program.
* Note: structs are like classes without member functions. To use uname(), you will need to create a utsname object (see the manpage for more details) first...
<pre>
        struct utsname myUname;
        int rv = uname(&myUname);
</pre>

## Lab activity

This is a __team__ assignment. There are various ways that you can divide up
the work and work in groups within the team. Regardless of your chosen structure, be sure
that every module is __reviewed__ by at least one team member who was not the
primary author of that module. Review for documentation, correctness, etc.

First, __implement the following C++ classes__ (each with
separate &quot;.cpp&quot; and &quot;.h&quot; files):

* __Program information class.__ This class will have only static member functions, one to perform each of the following tasks:
  * Return a C++ string (&lt;string&gt; &#8212; std::string) containing the
    system node name and the current user name in the form &quot;__durant@durantevo.msoe.edu__&quot;.
    It is suggested that you use the system calls <font face="Courier New"><b>uname()</b></font>, <font face="Courier New"><b>getuid()</b></font>,
    and <b><font face="Courier New">getpwuid()</font></b> to implement the function; see the
    <font face="Courier New">man</font> pages for
    more information.
  * Return a C++ string containing the current time in the form &quot;__Tuesday,
    December 7, 2003, 03:30 PM__&quot;. Use the __<font face="Courier New">time(2)</font>__
     system call ("time(2)" means "time" as described in in manual section 2 &#8212; type "man man" for more information, and see the hint below) and
    related system functions (<b><font face="Courier New">ctime()</font></b>, <b><font face="Courier New">strftime()</font></b>,
    etc.).
  * Return a C++ string containing the process IDs of the current process
    and its parent, in the form &quot;__12345:34567__&quot;
    (process:parent). Use the system calls
    __<font face="Courier New">getpid()</font>__ and __<font face="Courier New">getppid()</font>__.
* __System command class.__ This class should have the
    following members:
  * A C++ string data member to hold a command string to be executed.
  * A data member of appropriate type to hold the return &quot;status&quot;
      value from the __system__ system call (see below).
  * A no-argument constructor.
  * A copy constructor.
  * A destructor.
  * A copy-assignment operator.
  * An accessor and a mutator for the &quot;command string&quot; data member.
  * A function to run the command specified by the &quot;command string&quot;
      data member, using the __<font face="Courier New">system()</font>__ system call. (A more sophisticated way of
      doing the same thing will be covered later.) The status value should be stored in the
      &quot;status&quot; data member.
  * An accessor for the &quot;status&quot; data member, to return the status
      of the most recently executed command.

__Write a test program__ (&quot;main&quot; function, in a
separate &quot;.cpp&quot; file) to call the functions and to __output__ the
data returned by each, and runs in a terminal window. Include
sufficient exercise of the system command class to demonstrate __all__ its
methods. Create a make file, qmake file, or use KDevelop to build the test program.

<b>Hint: </b>While looking for information in the man pages you may have
to specify the programmer's version of the command. This would be done for
<b>ctime</b> as <b>man 3 ctime</b>. If the item you are searching for is
found in sections 1 or 2 of then you won't get the necessary section 3 page.

## Lab report (due by 11 P.M., the day prior to the week 2 lab)

Your lab report (one report per group) need not be self-contained. This means that it is
__not__ necessary to restate the entire specification in your report.

* Prepare your report in the XML format described in the
    Electronic Submission Guidelines.
* Include...
  * __Sample output__ (e.g., result of "./lab1 > sampleOutput.txt)
  * a brief overview of the assignment;
  * details of any problems you encountered;
  * suggestions for how the lab could be improved;
  * things you could not figure out how to do;
  * a list of extra features that you implemented, if any;
  * conclusions;
  * a summary of each team member's activity log indicating how much time he or she spent
      on the assignment (following the template provided in lab1.xml).
    * Use the following phases, along
    with roughly 5-10 words explaining what was done during each work
    session.
      * Research
      * Design
      * Code
      * Debug (before you think it's working)
      * Test (after you think it's working)
      * Administrative (includes report writing)
    * If you work from 2:00 P.M. to 3:30 P.M. and are interrupted
        for a 10-minute phone call, the interruption time is 10 and the
        delta time is 80.
    * "Whom" should be "Self" when working alone, "Team" when working with the entire name, and should
        include specific names in other cases (working with partial team, discussing the
        project with the professor or other students, etc.)
  * documented source code and make/qmake file, if
      used. Document the __purpose__ of code and arguments, but do not
      document what is trivially obvious. (e.g., "a = b; // assign b's value to a")<br/>
      You may wish to use
      <TT>__gensrc__</TT>, a shell
      script which will produce an XML document that may be used as a
      starting point for your report. The file will include all of the
      source code files (provided you modify the script appropriately...
      edit <TT>__gensrc__</TT> for details on how to do this.)
* Follow the report submission requirements.
* Email this file to the instructor with a subject and message
    body indicating that this is your CS-384 Lab 1 submission.

<hr>

This lab was developed by Dr. Barnicki, Dr. Durant, Dr. Sebern, and Dr. Welch
