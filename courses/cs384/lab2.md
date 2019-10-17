---
title: "CS-384 Lab 2: UNIX Process Creation and Management"
---

## Overview

The purpose of this lab is to gain familiarity with UNIX (Linux) process management and inter-process communication using pipes.

## Lab activity

The assignment has two parts, and it is recommended that it be accomplished in two corresponding phases. Two lab periods are allocated for this project.

This is a __team__ assignment. There are various ways that you can divide up
the work and work in groups within the team.  Regardless of your chosen structure, be sure
that every module is __reviewed__ by at least one team member who was not the
primary author of that module.  Review for documentation, correctness, etc.

### Part 1

Design and implement a UNIX (Linux) C++ application that accepts a command line of the form:

<pre>lab2 &lt;infile&gt; &lt;outfile&gt; &lt;time&gt; &lt;cmd&gt; &lt;args ...&gt;</pre>

For example:

<pre>lab2 a.txt junk.txt 10 ls -la abc.c def.*</pre>

The application should create three child processes. Note that the program you write should only have one executable image, in spite of the fact that there will be
multiple processes running at the same time.

__Child process 1.__ The first child process should copy the text file &lt;infile&gt; to &lt;outfile&gt;, a line at a time. As each line is copied,
modify it as follows:

* Capitalize the last letter of each word, and turn every other letter to lowercase, with "word" defined as a sequence of non-whitespace characters.  "Hello
there, how are you?" becomes "hellO therE, hoW arE yoU?".  Do not modify punctuation.
* Reverse the order of words in the line, with "word" defined as a sequence of non-whitespace characters
      (e.g., "hellO therE, hoW arE yoU?" becomes "yoU? arE hoW therE, hellO").

__Note:__ you may wish to perform these two operations separately; see part 2 below.

Insert a delay (e.g., sleep system call) after copying each line or group of lines so that this process does not complete too quickly. If &lt;infile&gt; cannot be
opened, or &lt;outfile&gt; already exists, this process should exit with a "not successful" status.

__Child process 2.__ The second child process should run for &lt;time&gt; seconds, and then exit with normal status. During the "run" interval, this
process should compute the
square of successive integers (i.e., 1, 2, 3, ...); before exiting, this process should write the largest integer and square values to a file. (Note that only the
largest integer and its square should be written to the file.) For timing, use the alarm system call with a signal handler (hint: in the signal handler, set a global
flag that is tested on each iteration of the "square" loop; make certain that you declare this properly with volatile and static).

__Child process 3.__ The third child process should exec the command (&lt;cmd&gt;), using the rest of the arguments on the original command line
(&lt;args ...&gt;). Note that there may
be any number of arguments (including zero) following &lt;cmd&gt;.

__Main application process.__ The main application should print a message when each of the child processes exits. This message should indicate how the
child terminated
(normal or signal, exit status or signal number). The messages should appear as soon as each process exits; the termination order may vary. When all children have
terminated, the main application should print a final message and then exit itself.

While the application is running, observe the processes with the ps command, perhaps from another terminal window. The -t option to ps can be used to limit the output
to processes associated with a particular terminal. You might try using the kill command to send a SIGALRM (note spelling!) signal to the "square timer" process while it is
running.

### Part 2

Modify the above application so that the file copying is actually done by two processes connected by a pipe:

* The child process (grandchild of the main application process) should read &lt;infile&gt;, perform the case conversion, and write each resulting line to the pipe.
* The parent process (child of the main application process) should read from the pipe, reverse each line, and write to &lt;outfile&gt;.

See the man page for pipe. Since the pipe file descriptors are designed for low-level (i.e., read/write) I/O, you will probably have to use the ifstream and ofstream
constructors that create an I/O stream from a file descriptor.

Remember to close the end of the pipe that each process is not using. Reading from the pipe will only signal "end of file" when the last writer closes it, so you want
each process to have only one end open.

## Lab report (due by 11 P.M., Monday of week 4)

Your lab report (one report per group) need not be self-contained. This means that it is
__not__ necessary to restate the entire specification in your report.

* Prepare your report in the XML format described in the
    Electronic Submission Guidelines.
* Include...
  * __Sample output__ (i.e., appropriate input and output text and discussion to convince the reader that your solution is correct)
  * a brief overview of the assignment;
  * details of any problems you encountered;
  * suggestions for how the lab could be improved;
  * things you could not figure out how to do;
  * a list of extra features that you implemented, if any;
  * conclusions;
  * a summary of each team member's activity log indicating how much time he or she spent
      on the assignment (following the template provided during the week 1 lab).
  * documented source code and make/qmake file, if
      used.  Document the __purpose__ of code and arguments, but do not
      document what is trivially obvious.  (e.g., "a = b; // assign b's value to a")
* Follow the report submission requirements.
* Email this file to the instructor with a subject and message
    body indicating that this is your CS-384 Lab 2 submission.

<hr>

This lab was developed by Dr. Barnicki, Dr. Durant, Dr. Sebern, and Dr. Welch.
