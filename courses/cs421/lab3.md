---
title: "CS-421 Lab 3: Lego Models"

*__Note__: Numerous links to Qt documentation pages that are no longer hosted at TrollTech have been removed.*

Develop an OpenGL application that displays Lego models similar
to those on the table in the illustration on your textbook's cover.

You have been provided with an <a href="lego.zip">a utility class</a> 
for drawing Lego blocks. The drawing routines make extensive use of 
OpenGL <font color="green">transformations</font>. The geometries are 
based on library data from a Lego modeling application (LDraw, <a 
href="https://www.ldraw.org/">http://www.ldraw.org/)</a>, but do not take 
full advantage of OpenGL's features. Feel free to modify this class (fix 
bugs, add block types, add support for other OpenGL features, improve 
the programming interface, etc.) in any way.

The following code will get you started using the Lego utility class in your paintGL() function. 
If you wish to render solids, be sure to make proper use of the depth 
buffer.

<pre>Lego::brick(); // default brick -- red, 2x4x1

glPushMatrix();
        glTranslatef(Lego::lengthUnit, Lego::heightUnit, 0);
        glRotatef(90, 0, 1, 0);
        Lego::brick("yellow");
glPopMatrix();</pre>

Your renderings may be either wireframes or solids.

Your program must input models from a file. Each line of the
file will specify a piece of Lego, unless it begins with a #, in which case it
is a comment.

Here is a sample file for drawing the "sparse pyramid" on the cover of the
textbook.

<pre># origin (x, y, z) object_name [object_data ...]
# origin - specifies the minimum x, y, and z coordinates of the object
# For a standard block, the object format is
# name(= block) color length width height
 0 0 0 block green  4 2 1
 6 0 0 block violet 4 2 1
12 0 0 block red    4 2 1
 3 1 0 block red    4 2 1
 9 1 0 block red    4 2 1
 6 2 0 block yellow 4 2 1</pre>

Add 2 QSliders
to your shell to allow the user to set the viewing latitude and 
longitude so that the model can be viewed from any angle. You will need 
to use signals 
and slots</a> that ultimately modify the <a 
href="http://www.opengl-tutorial.org/beginners-tutorials/tutorial-3-matrices/#the-model-view-and-projection-matrices">modelview
matrix</a>. Mathematically, the viewing transforms happen after all the 
modeling transforms. In OpenGL, model and view transformations are 
combined into a single matrix and operations are coded from the left to 
the right (OpenGL uses right matrix multiplies instead of left matrix 
multiplies). This makes sense if you think of the transforms as moving 
the camera relative to the objects, but is precisely backwards if you 
think of the transforms as moving the objects relative to the camera; in 
CS-321, we focused on the later view. So, the viewing transform is coded 
as a starting point, and then objects are drawn which may manipulate the 
modelview matrix with their local modeling transforms, using the stack 
so that they leave the matrix in the same state when they're done. This 
is how the Lego class works.

## Demonstration

__<font color="Blue">Demonstrate</font>__
your working program to the professor (25% of grade) during or before the week 4 lab.

## Report (due by 11 P.M., the day of the week 4 lab)

Your lab report need not be self-contained. This means that it is
__not__ necessary to restate the entire specification in your report.

* Prepare your report in PDF, Word, or XML (cctHW.xsl, or other approved XSL) format
* Include...
  * a summary of what you did for this lab;
  * details of any problems you encountered;
  * suggestions for how the lab could be improved;  
  * things you could not figure out how to do;
  * a list of extra features that you implemented, if any;
  * A summary (dates, times, durations, and interruption 
      durations) of your activity log indicating how much time you spent 
      on the assignment. Use the following categories:
    * Design
    * Coding
    * Debug (before you think it's working)
    * Test (after you think it's working)
    * Documentation
    * Other
  * Documented source code
  * Code documentation with appropriate diagrams as produced by doxygen,
      javadoc, or a similar in-source documentation tool.
* Follow the report submission requirements.
* Email this file to the instructor with a subject and message
    body indicating that this is your CS-421 Lab 3 submission.
