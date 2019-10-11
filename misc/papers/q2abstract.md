---
title: "Quals 2 Abstract: Efficiently Fitting Low Order HRTF Models"
---

Eric Alan Durant<br/>
Department of Electrical Engineering and Computer Science<br/>
The University of Michigan<br/>
Ann Arbor, MI, USA

Professor Gregory H. Wakefield, Research Advisor

Quals II Examining Committee:<br/>
Professor Jeffrey A. Fessler<br/>
Professor Kimberly M. Wasserman<br/>
Professor William J. Williams

Friday 21 April 2000

## Abstract

The current work demonstrates that a genetic algorithm (GA) can rapidly generate perceptually accurate, low-order IIR approximations of head-related transfer functions (HRTFs) from measured impulse responses. The long-term goal is to successfully apply the GA to a wide class of parametric fitting problems.

We build on previous work in low order HRTF approximation \[Blo96\]. By applying the GA, we converge to solutions of equal quality in minutes instead of hours. Applications include rapid tuning of a simulated 3-D audio environment for an individual. This work develops the basic steady-state GA using an IIR design problem as an illustrative example.

We propose a domain-appropriate error measure and a widely applicable population variation metric. A lower bound is developed for the variation metric and is used to detect convergence. We then apply the algorithm to HRTF design. Detailed performance measurements are presented. Finally, we discuss how our approach can be extended to a wider class of optimization problems.

## References

\[Blo96\] M. A. Blommer, &#8220;Pole-Zero Modeling And Principal Component Analysis of Head-Related Transfer Functions,&#8221 PhD Thesis in Electrical Engineering: Systems. Ann Arbor: The University of Michigan, 1996, 165 pages.
