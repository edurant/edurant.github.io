---
title: "CS4981 Deep Learning In Signal Processing: Week 3 Lab"
---

## Background

Model pruning is a common step when deploying a DL DSP system. When a network is trained, a much higher capacity (more trainable parameters) is often needed than what is actually needed at runtime to achieve the same validation metrics (with validation accuracy being the most common). Pruning is essentially setting some weights to 0 reducing the inference computational load, and, depending on the model structure, the dimensions of the trainable sections can often be reduced. There are many approaches to model pruning and it is an important and active area of current research.

## Overview

This week you will apply at least "magnitude pruning." You may try additional methods if you wish. Magnitude pruning often works surprisingly well given its simplicity. Given a proportion, it sets that proportion of model weights to 0 by selecting the ones with the smallest magnitude. You will be following [this MATLAB example](https://www.mathworks.com/help/deeplearning/ug/parameter-pruning-and-quantization-of-image-classification-network.html) and applying it to any of the DL classifiers from last week's lab. (If you did not design a DL classifier in last week's lab, the professor recommends building the one based on AlexNet that classifies the PNG images provided in the .zip file; you should be able to generate a reasonable accuracy (>75%) network fairly quickly.)

Note that you can use the MATLAB `save filebasename` command to save all the variables in the workspace to filebasename.mat. You can also save select variables with `save my_trained_network_1 moreVariableNames`. Use `load filebasename` to load the file the next time you run MATLAB, or to return to a previous state after issuing `clearvars`.

There are several short helper functions given near the end of the tutorial. You can either copy and paste these into the MATLAB editor and save them as .m files or download the .zip of them posted on Canvas and unzip it into your MATLAB working directory.

Note that the given code only tries sparsity up to 90%, which might not be sufficient to see accuracy decrease since your model likely has a lot of excess capacity, especially if you trained on the noiseless data. So, you may need to re-run with higher sparsity proportions (e.g., 80% to 98% in 0.2% increments).

A few adaptations will need to be made to the tutorial to work with the data and network formats from week 2.
* `preprocessMiniBatch.m` assumes 4-D data (height, width, channel, sampleNumber). It *might* be necessary to modify it if using other data formats. You'll likely get an error if this is necessary.
* See [pruningMain.m](pruningMain_m.txt) for the other needed adaptions, including how to resize the images to the 227&times;227 format required by AlexNet. If you need hints on additional adaptations, please check with the professor.

## Informal Report

1. Provide a graph of model accuracy vs. sparsity (or a similar graph that shows the sparsity/accuracy tradeoff). Be sure to sample at enough sparsity proportions to clearly see how the model degrades. Your model might degrade at very low sparsity values (10%) or require very high sparsity values to show degradation (>98%).
1. Make a decision about a sparsity/accuracy tradeoff and discuss why you chose this particular tradeoff.
1. Optional/extra: Try a different pruning method. One more is described in the MATLAB example.
1. Optional/extra: For your chosen sparsity level, calculate the sparsity for each individual block of your network. Discuss the results. Are the earlier/later blocks more sparse? Are different types of blocks more sparse? Why might this be?
1. Summarize your key questions or open issues.
   * Where parts of the lab hard to understand?
   * Did you run into errors and were you able to solve them?
   * Are there topics you'd like to learn more about next?

Submit your informal report covering the above items via Canvas as a Word file, PDF, etc.

## Additional Reading

[Here is a paper](https://arxiv.org/abs/1608.08710) whose abstract discusses the limits of the &ldquo;magnitude pruning&rdquo; approach we used in this lab and proposes a different approach more appropriate for convolutional layers. Pruning methods, to get good performance metrics (accuracy, etc.), good memory efficiency, and fast runtime implementations are an important area of current research.