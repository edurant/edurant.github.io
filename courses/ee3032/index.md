---
title: "Dr. Durant: EE-3032 Signals and Systems"
---

## Textbook

[Signals and Systems: Theory and Applications](http://ss2.eecs.umich.edu/) by Fawwaz T. Ulaby and Andrew E. Yagle, published 2018, ISBN: 978-1-60785-486-9

## [Outline and reading assignments](dailySchedule.pdf)

## Learning objectives

* Compute the output of a continuous-time, LTI system (*system analysis*)
  * Using time-domain techniques (*convolution*)
  * Using frequency-domain techniques (*Fourier analysis*)
* Analyze a continuous-time signal (*signal analysis*)
  * Derive the *Fourier series* coefficients for a given periodic CT signal
  * Determine the *Fourier transform* of a signal by using the FT integral or a table of common pairs and properties
  * Compute the power or energy, as appropriate, of a CT signal using its time- or frequency-domain representation (*power/energy*)
* Plot a signal in the time or frequency domain (*signal visualization*)
  * Plot a signal as a function of time (*time plot*)
  * Determine and plot the magnitude and phase spectra of a CT signal using Fourier analysis (*Fourier spectrum*)
* Determine an appropriate *sampling* frequency and the subsequent frequency-domain representation of a sampled CT signal
  * Determine an appropriate sampling frequency in order to avoid aliasing of a CT signal (*Nyquist*)
  * Plot the magnitude and phase spectra of an impulse-train-sampled CT signal (*sampled spectrum*)

## Examples
### Winter, 2019-2020
### Fall, 2019
* [W3D4: Convolution example from class](w3d4-f19.txt)
* [W4D3: Another convolution example from class](w4d3-f19.txt)
* W5D2: Problem 2.17(b) with additional analysis: [PDF](w5d2-f19.pdf), [MATLAB Live Script](w5d2-f19.mlx)
* W5D4: Class example, transfer function/exponential decay: [MATLAB Live Script](w5d4-f19.mlx), [PDF](w5d4-f19.pdf)
* [W6D2: Demonstrate that a square wave can be represented as a sum of sinusoids](w6d2-f19.txt)
* [W7D2: Numerical confirmation of Fourier series cosine coefficients for square wave](w7d2-f19.txt)
* W7D4: Class example continuation, line spectra and Parseval's relation: [MATLAB Live Script](w7d4-f19.mlx), [PDF](w7d4-f19.pdf)
* [W8D1: Illustrate Fourier series&rarr;transform as T0 approaches &infin;](w8d1-f19.txt)
* W9D1: Exponential Fourier Series construction building on quiz 8 [MATLAB Live Script](w9d1-f19.mlx), [PDF](w9d1-f19.pdf)
* [W9D3: In class exercise, finding and modifying X(&omega;), then reconstructing new x(t)](w9d3-f19.txt)
* W10D2: Lowpass and bandpass design, causality, modulation property: [MATLAB Live Script](w10d2-f19.mlx), [PDF](w10d2-f19.pdf)

### 2017
* <a href="w1d1-f17.txt">W1D1: Complex exponential</a>
* <a href="w2d2-f17.txt">W2D2: Additivity of power of sinusoids</a>
* <a href="q2-f17.txt">Quiz 2 folding and shifting</a>
* <a href="w3d1-f17.txt">W3D1: Convolution example from class</a>
* <a href="fourierSeries.pdf">W4-W5: Dr. Wierer's Fourier Series handout</a>
* <a href="w5-f17.txt">W5: Fourier series of a square wave, and Parseval's power relation</a>
* <a href="w6-f17.txt">W6: Steady-state response and eigenfunctions - basic example</a>
* <a href="w6v2-f17.txt">W6: Steady-state response and eigenfunctions - advanced MATLAB example</a>
* <a href="w6ex-f17.txt">W6 In-class example: system response</a>
* <a href="w7d2-f17.txt">W7D2 The support of x(t) and its Fourier transform vary inversely</a>
* <a href="w8-f17.txt">W8: Ideal filter example (based on p. 363-)</a>
* <a href="w9cosAlias-f17.txt">W9: Sampling and aliasing of cosine</a>
* <a href="w9d2-f17.txt">W9D2: Sinc reconstruction</a>
* <a href="w9d4-f17.txt">W9D4: Effects of ZOH (zero-order hold) on digital signal. Applies in D/A (not A/D as described in text).</a>
* <a href="errata-chaparro.html">Errata from previous textbook (Chaparro)</a>

## [Homework](hw/)

## [Quizzes with Solutions](quiz/)

## Sample Exams
* [2019 Practice](finalPractice-f19.pdf)
* [2017](final-f17.pdf) ([solution](final-f17-sol.pdf))

## Additional Readings
* Hammack, Bill. [Intro/History: Introducing a 100-year-old mechanical computer](https://www.youtube.com/watch?v=NAsM30MAHLg), YouTube video, 2014-11-11.
* Harris, Fredric J. [On the Use of Windows for Harmonic Analysis with the Discrete Fourier Transform](http://ieeexplore.ieee.org/xpl/articleDetails.jsp?arnumber=1455106), *Proc. IEEE*, 1978-01.
* Montgomery, Chris. [24/192 Music Downloads ...and why they make no sense](https://people.xiph.org/~xiphmont/demo/neil-young.html), *xiph.org*, 2014-03-15.

## Final exam

The final exam will be given per the schedule that is published by the Registrar's Office in approximately week 6.
It may cover any material from the course.
The exam will last 2 hours.

## [General course policies](../policies.html)

## EE3032-specific course policies

You will need the use of a calculator capable of performing complex number arithmetic and simultaneous equation solution
of equations with complex coefficients, and with the ability to perform symbolic substitutions (such as a TI-89 or TI-89 Titanium).

Show all work, and work neatly, on your quiz and exam problems - a simple numeric answer is generally not sufficient.
No credit given for work your professor cannot easily read or readily follow.

## Grading algorithm

<table>
<tr><td>Homework</td>			<td align="right">15%</td></tr>
<tr><td>Weekly Quizzes</td>		<td align="right">55%</td></tr>
<tr><td>Comprehensive Final Exam</td>	<td align="right">30%</td></tr>
</table>
