---
title: "EECS651 Source Coding Theory: Project Paper Abstract: JPEG Enhancements: Adaptive Block Sizes and Computed Quantization Matrices"
---

Eric Durant<br/>
Department of Electrical Engineering and Computer Science<br/>
The University of Michigan<br/>
Ann Arbor, MI, USA

Thursday 29 April 1999

## Abstract

Enhancing JPEG with adaptive block sizes and quantization matrices having triangular, hyperbolic or circular symmetry leads to superior R-D performance, both in MSE and perceptual quality (the later being the goal). Block sizes are efficiently described by a quadtree, which is grown by minimizing transform coefficient entropy for a given quality using one-level look-ahead descent. A fourth- or fifth-order rational function, symmetry type, and quality factor compactly describe quantization matrices. For rate estimation, intermediate JPEG entropy coding symbols are calculated, and a Shannon rate estimate based on image data across several quality factors is applied. Further performance-complexity tradeoffs, such as separate entropy tables for each scale, are briefly considered.

## Overview

After reviewing background material, variable DCT blocksizes and functional forms of quantization matrices are presented as approaches for enhancing baseline JPEG. Rate estimates based on the JPEG approach and including quadtree side information are then developed. For distortion metrics, both objective and subjective quantities are used. Results of a software implementation ran on two images are presented. The software simulates baseline JPEG; actual baseline JPEG results are included for comparison.
