---
title: "CS-421: Using GLUT"
---

## Introduction

<a href="http://www.opengl.org/resources/libraries/glut/glut_faq.html">GLUT</a>
is not absolutely required for CS-421, but it is useful for running certain
examples given in lecture and for most of the examples given in the textbook.
GLUT can be obtained for most platforms, but is not installed by default under
Win32 and most Linuxen.

## Linux (Especially Fedora Core 2, including VMWare Notes)

RedHat 9 GLUT binaries are compatible with FC2.
GLUT requires GL and GLU, so ensure that the officially supported
xorg-x11-Mesa-lib{GL,GLU} are installed.  (Use up2date as root.)

Install the glut and glut-devel RPMs listed below (or found via
an Rpmfind-type resource).  As of 5-Dec-2004, Fedora binaries
were not available, but the RH9 binaries work correctly on FC2.
Download the RPMs and install them as root with `rpm -ivh glut-*.rpm`.

* <!--a href="glut-3.7-12.i386.rpm"-->glut-3.7-12.i386.rpm (82 kB)<!--/a-->
* <!--a href="glut-devel-3.7-12.i386.rpm"-->glut-devel-3.7-12.i386.rpm (186 kB)<!--/a-->

When running the compiler, you will need to link against glut
and the supporting routines in GL and GLU:
<pre>-lglut -lGL -lGLU</pre>
Also, it is necessary to link against certain X11 functions, and
the directory where the needed .sos are stored is not on the default
FC2 compiler path, so:
<pre>-L/usr/X11R6/lib -lXi -lXmu</pre>

So, a complete compile under FC2 might look like
<pre>g++ example1_2.cpp -o example1_2 -lglut -lGL -lGLU -L/usr/X11R6/lib -lXi -lXmu</pre>

When attempting to run the application, GLUT will abort if it cannot access
the OpenGL interface to your X11-based display (via <a href="http://www.sgi.com/products/software/opensource/glx/">GLX</a>).  If this happens
on FC2, in /etc/X11/xorg.conf [edit as root], uncomment the 'Load "glx"'
line in the "Module" Section and restart the X Server (Ctrl-Alt-Backspace
[this will kill any jobs that are using the X Server]).  On other Linuxen,
the relevant file is XF86Config, sometimes in the /etc directory.  This
has been tested under FC2 under VMWare 4.5.2 (software emulation of OpenGL).
If you have installed accelerated video drivers, hardware acceleration of
OpenGL will probably be available via a module with a name like "nvidia-glx".

## Windows XP (and probably 2000)

Download <!--a href="glut-3.7.6-bin.zip"-->glut-3.7.6-bin.zip<!--/a--> and see the directions
contained therein.

Original reference: <a href="http://www.xmission.com/~nate/glut.html">GLUT for Win32</a>
