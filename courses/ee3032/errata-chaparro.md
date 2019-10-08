---
title: "Dr. Durant: Chaparro Errata (previous EE-3032/3221 book)"
date: 2017-11-21 20:45:52 +0000
---

[Signals and Systems Using MATLAB, 2nd Edition](https://www.amazon.com/dp/B00IMBVXXC) by Luis F. Chaparro, published 2014-02-10, ISBN-13: 978-0123948120

* Page 162: In the example showing stability for convolution, the first upper bound is M, but it should be MK. And, the second upper bound is MK, but it should be K.
* Page 277: The trig. identities at the bottom of the page are wrong; they are false statements. We will use a different method to do this derivation in class.
* Page 283: Bottom paragraph. It is true in general for a (possibly complex) even signal that X_{k} = X_{-k}. However, the discussion following this, beginning with
            X_{k} = X_{-k}^*, assumes that x(t) is a real signal even though it states that the discussion is generally true (implying it applies to complex signals) about the Fourier series.
* Pages 334-336 (&sect;5.2-5.3)
  * &quot;As T_0 approaches infinity, X_n will tend to zero.&quot; This assumes that x(t) is an energy signal (actually, more precisely and slightly more restrictively, an absolutely integrable signal),
              not a power signal. This fact is used at the start of &sect;5.3, which assumes absolute integrability. Energy signals are square integrable (the integral of their magnitude squared (or,
              equivalently x(t)x*(t)) is finite). All absolutely integrable signals are square integrable, but the converse is not true. Thus &sect;5.3 provides a statement that is not guaranteed to
              apply to all energy signals, but as the note at the end of &sect;5.3 states, this statement is strong enough to be of use for a huge variety of practical signals.
  * Clarification: in the second equation for x^~(t) (the last one before Equation 5.1), &Delta;&Omega; doesn't represent a multiplication, but the fundamental frequency, which is about to
              approach 0 since the fundamental period is about to approach infinity. This fundamental frequency is the width in a Riemann sum, so in the next step, the author is justified
              in switching to a standard Riemann integral with respect to &Omega;, d&Omega;.
* Page 382: Table 5.1: 3rd line, Expansion/contraction in time. The formula is correct for aperiodic energy signals. For periodic power signals, the 1/|&alpha;| frequency domain scaling factor disappears.
            This is because time-scaling a periodic signal does not change its duration, which remains infinite.
* Page 386: Problem 5.11. In part (b), note that the given signal is an energy (not power) signal and therefore you should find the energy. The given expression is actually correct for energy even though it is labeled as power.
* Page 450: Expression (7.1) should be A(t) cos(2&pi;f_c t + &phi;(t))
* Page 515: &sect;8.3.1 sample and hold. The math in the section, showing the roll-off of the non-ideal A/D, does not apply quite as the book describes it.
	    While the derived ZOH transfer functions apply to the ZOH signal, they do not apply to the frequency response seen at the DSP input.
	    The DSP certainly sees the AA/ADC time delay, but, if the ADC really has an "ideal" ZOH as described by the text, the DSP sees the spectrum without the attenuation of the ZOH,
	    since it treats the ZOH value as a discrete-time sample, not a DC level held for some fraction of the sampling period.
  * [MATLAB script graphing rolloff vs. ZOH duty cycle](w9d4-f17.txt)
