---
title: "CS-421 Lab 5: Lego Animation"
---

You may work in pairs or alone on this lab assignment.

Enhance your program from last week to include animation.

## Required

* Create an animation in which two or more Lego blocks move into their
  places in a model. Each block must move independently.
* Control the frame rate using either an easily updated compile-time constant or a
  UI.
* Use double-buffering (automatic, by default, when deriving from <a href="http://doc.trolltech.com/qglwidget.html">QGLWidget</a>).
* Start the timing chain by using <a href="http://doc.trolltech.com/qtimer.html">QTimer</a>::singleShot from to register
  your timer function. This should be done from an override of the virtual
  polish function in your class derived from QGLWidget.
* Your timer function should update the simulation time, trigger an update
  of the drawing (read the QGLWidget detailed description for information),
  and chain to the next timer event. The basic procedure
  is to increment the time by 1/fps (frames per second) and schedule another
  timer callback in 1000/fps ms. You can do better, though (see below).
  * You could also trigger a timer to fire every 1/fps, but special care must
    be taken so that events do not pile up without limit when the frame cannot
    be drawn in 1/fps s. Also, when it takes longer than 1/fps to draw a frame,
    it is usually desirable in computer graphics to draw the the next frame
    ASAP. The above method will accomplish this, while this global timer
    method will not.
* Your paintGL function must use the simulation time to calculate
  position parameters for your blocks.

## Optional / Required

If you are working in a group of two, two of the features below are required.
If you are working alone, all of the features below are optional.  Please let
me know if you have suggestions of additional features for this list.

* Add accelerated movement (blocks accelerate under gravity while falling
    in).
* Display statistics about the animation after each frame, such as the
    instantaneous frame rate, simulation time, etc.
* Enhance the frame rate accuracy...
  * It is not clear in the Qt documentation whether updateGL is blocking or non-blocking
      (does it wait for paintGL to complete, or does it merely start the update in a separate thread?).
      This could cause extra delay time between frames if the delay
      after drawing a frame is a full 1/fps s. In any case, the
      singleShot timer may have limited precision (as low as 20 ms on
      some platforms).
  * To arrive at a more accurate delay rate, you will
      want to update the delay time in response to the actual,
      measured frame delay after each frame. Read more about QTimer and
      how it can help you make such measurements. Generally speaking,
      if the actual delay was more than 1/fps, decrease the scheduled delay
      and if the actual delay was less than 1/fps, increase the scheduled
      delay. Such a method will also have some inherent capability to adjust
      the delay in response to changing CPU load (perhaps resulting in longer
      drawing delays and less time allocated to your process).
  * A basic approach is to increment/decrement a delay count in milliseconds
      (be careful that it does not go below 0).
  * A more sophisticated approach would use an 
      autoregressive filter to strike a balance between quick response (perhaps at the cost of being too sensitive
      to single frame irregularities) and stable response (perhaps at the cost of taking too long to
      adapt)&#8212;
      * d<sub>n+1</sub> = a d<sub>n</sub> + (1-a) e<sub>n</sub>
      * a is the autoregressive parameter in the range 0...1.  Numbers very close to 1 give slow, stable updates,
          while numbers close to 0 give rapid updates.  0.9 to 0.98 may be a reasonable range for this lab,
          but you should feel free to experiment with other values.
      * d<sub>n</sub> is the specified delay for the current frame.
      * e<sub>n</sub> is the instantaneous estimate of the actual delay that would
          have attained the desired frame rate
      * e<sub>n</sub> = d<sub>n-1</sub> - (m<sub>n</sub> - d<sub>n-1</sub>) = 2 d<sub>n-1</sub> - m<sub>n</sub> is a reasonable estimate
          when the change is small; be careful that the estimate does not become negative (you cannot
          speed up the animation by scheduling negative delays).
      * m<sub>n</sub> is the measured delay for the current frame

Feel free to add other features. Check with the instructor if you have any questions.

## Demonstration

__<font color="Blue">Demonstrate</font>__ your working program
to the professor (25% of grade) during or before the week 6 lab.

## Group Report (due by 11 P.M. Friday of week 6)

Your lab report need not be self-contained. This means that it is
__not__ necessary to restate the entire specification in your
report.
    
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
* Email this file to the instructor with a subject and message
    body indicating that this is your CS-421 Lab 5 submission.
