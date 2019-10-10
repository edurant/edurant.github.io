---
title: "Dr. Durant: EE-3221: Additional Homework"
---

Recommended homework problems from Ingle & Proakis, 3rd Edition

# Chapter 4
* Basic: 4.1.1-3. We didn't cover MATLAB techniques for verification, so skip this part.
  * Medium: MATLAB can take a ratio of two polynomials in z and perform the division to give you the coefficients of the powers of z in descending order, which are equivalent to the time-domain samples. Try [q,r] = deconv([1 0 0 0 0 0],[1 -.5]) to see the first several samples of a familiar geometric series and consult the documentation for further details.
  * Advanced: Investigate how to use the Symbolic Toolbox in MATLAB to check some of these problems. [MATLAB Symbolic Toolbox article on z-transforms](http://www.mathworks.com/help/symbolic/compute-z-transforms-and-inverse-z-transforms.html)
* Medium: 4.2
* Medium: 4.3
* Basic: 4.9.  Hint: use conv.
* Basic: 4.15.1-2
* Advanced: 4.15.3
* Medium: 4.17.1-2
* Advanced: 4.17.4
* Basic-Medium: 4.18.1-4
* Medium: 4.20
* Basic: 4.25
</ul>

# Chapter 5
* Basic: 5.1: Calculate the DFT for the given examples. Check your results in MATLAB.
  * Medium: What are the symmetries for the pure real signals? What are the symmetries for the pure imaginary signals?
  * Advanced: Explain how you can use a single DFT to simultaneously compute the DFT of two real signals of the same length by making use of the real and imaginary portions and the symmetry properties.
* Basic: 5.2
* Medium: 5.3. This problem demonstrates density vs. resolution.
* Advanced: 5.6: This illustrates that sampling in frequency can lead to aliasing in time.
* Medium: 5.26: This is a generalization of the circular convolution examples from class.
* Medium: 5:40: Modify radix-4 to radix-2 to reflect the algorithm we covered in class. This is good practice in understanding the FFT that we did in class and you’ll see several additional symmetries that can be used for runtime optimization of the calculation.

# Chapter 7
* Basic: 7.2. We proved this in class for order 6. Try to prove it in general, or for order 4 or 8.
* Medium: 7.3. This is a bit more challenging, but is a good test of whether you understand the proof above. The key is to factor out the linear phase shift that makes the ends of the filter symmetric, even if its frequency isn’t an integer multiple of ?.
* Advanced: 7.4 and 7.5 can be solved using Euler's decomposition of the sine function whereas the two above used the cosine function.
* Medium: 7.6: This is a generalization of sample code we wrote in class.
* Medium: 7.7: A good way to solve these is to multiply out the factored forms given the roots and then look at the symmetry properties, but there are other solution techniques.

<hr>

# Old Homework

The following problems are from the old version of the class. Although we cover the topics in a different order now, you should be able to complete all of them by the end of the course.
Please contact me directly if you wish to try the software mentioned in some of the problems.

<strong>PROB-A: Reconstruction, Aliasing, Zero Order Hold:</strong> Two cosines are summed and sampled at fs=20 kHz.  A ZOH and an ideal reconstruction LPF are then used to create continuous time signals from the samples.  The cosines before sampling are at frequencies of 1000 Hz (with magnitude of 0.7 and phase of -30 degrees) and 9000 Hz (with magnitude of 0.4 and phase of +45 degrees).  Determine the mathematical expressions for the resulting continuous-time cosine signals in the frequency range from zero to fs/2 Hz.  Re-do the problem if fs=10 kHz (aliasing!).

<strong>PROB-B: Pole/Zero Design:</strong> Find the transfer function and difference equation of a notch filter if the sample rate is 1000 Hz and the notch is at 60 Hz.  Use ZBode to verify the design.

<strong>PROB-C: Windowing:</strong> Using fs=1000 Hz, find 30 samples of three periods of a 1-volt, zero phase cosine.  Determine the spectrum using Dr. Reyer's "Fourier" program.  You may also wish to use either Matlab or a spreadsheet.  Now shorten the list by 2 samples and find the spectrum.  Use a Hamming window on the 28-point list.  Find the resulting spectrum.  Compare all spectra.

<strong>PROB-D: FFT:</strong> One period of a periodic function is:  15.5, 14.6, -1.57, 3.2, -15.5, -14.6, 1.57, -3.2.  Using a DIT FFT find (by hand, with a calculator) the magnitudes and phases of cosine contributions at 125 Hz, 250 Hz, and 375 Hz.  The sample rate is 1000 Hz.

<strong>PROB-E: IIR Filter Design:</strong> Using the Bilinear Transform method (paper/pencil/calculator approach), design an IIR lowpass filter if fs=1000 Hz, 3rd order, cutoff freq = 150 Hz, DC gain = +4 dB.  Find the transfer function.  Test the transfer function with ZBode.

<strong>PROB-F: Interpolation and Decimation:</strong> Assume you have a signal that is bandlimited to the range of 0-3 kHz.  The sample rate is 12 kHz.  The desire is to change the sample rate to 9 kHz.  Determine a strategy for doing the sample rate change.  Sketch spectra and filters needed, including cutoff frequencies and gains.
