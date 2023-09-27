---
title: "CSC4651/5651 Deep Learning In Signal Processing: Speech Command Recognition Lab"
---

## Instructions
This week's MATLAB assignment is to complete the “[Train Speech Command Recognition Model Using Deep Learning](https://www.mathworks.com/help/deeplearning/ug/deep-learning-speech-recognition.html)” example.

I have [provided a modified version of this example with additional explanatory text and modifications](speechRecognition.mlx) provided a modified version of this example with additional explanatory text and modificationsto let it run correctly on Rosie. Be sure your are running the modified version.

Less guidance will be given than on last week's lab, but please ask questions and make observations in this week's discussion board. The professor will answer questions and you may answer each other's questions.

This lab dives into a number of practical audio processing issues. We will see:

* padding of data (to make observations fit into a DNN or mathematical transform that assumes a particular input size),
* the spectrogram (more in M7 and M8; transforms a 1-D signal to a 2-D time-frequency image-like view),
* and the [bark](https://en.wikipedia.org/wiki/Bark_scale) spectrogram.

This lab requires the [Audio Toolbox](https://www.mathworks.com/products/audio.html), which is not in the MATLAB image we have used so far. To start this image:

    singularity exec --nv /data/containers/matlab-r2023a-toolboxes.sif bash

After you start MATLAB, run ver and note the toolboxes that are installed, including the Audio Toolbox.

Then, read through the comments in the Live Script, executing each section after you read about what it does. I recommend using the Run and Advance option.

To meet the requirements of this lab, please report on the following, either in text or in a video overview of your final results:

* Process: Briefly describe the training pipeline steps form the script in your own words.
* Results: Note if there were any errors and warnings, explaining them as best as you can. Also, discuss the meaning of key results including the generated confusion matrix.
* Analysis and Discussion: Comment on the training process, tools used, benefits and disadvantages that you observed, etc. Are there particular items that you were exposed to and would like to learn more about as the course progresses? (Some of these are in future modules.

## Optional, additional exercises

* Record your own audio and run it through the network.
* Run the training a few times and compare the accuracy or other performance metrics. Training is a random process (due to weight initialization, shuffling of data, etc.) and by sampling it we can characterize expected training performance (high or low variance, etc.)
* Modify the code to add or remove layers or modify layer dimensions and re-run training a few times to see how results are affected.

## Requirements

* Your submission can be uploaded via Canvas as a Video, PDF of a MATLAB Live Script, Word document, Google doc, etc.
