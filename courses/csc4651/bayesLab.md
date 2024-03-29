---
title: "CSC4651/5651 Deep Learning In Signal Processing: Bayesian Optimization Lab"
---

## Lab Overview

In this lab you will use MATLAB's hyperparameter optimization tools to automatically train several networks while varying details such as the number of dense layers and the training algorithm learning rate. Determining good (much less optimal) values of these hyperparameters is challenging and can consume much of a machine learning engineer's time.

In particular, you will have MATLAB use a Bayesian optimization approach, which provides a powerful model for selecting the next set of hyperparameters to try given the hyperparameter combinations tried so far.

This method might be useful as you explore hyperparameters in your term project.

Throughout the lab, for your report, be sure to take screenshots of key results and graphics, including MATLAB console output showing the optimization process.

## Bayesian Optimization: A Conceptual Overview

Keep the following conceptual overview of Bayesian Optimization in mind as you review the background material:

1. Introduction:
Bayesian optimization is a powerful technique for hyperparameter tuning in machine learning, where each trial can be computationally expensive and time-consuming. It balances the need for exploration and exploitation to find the optimal set of hyperparameters.
2. Key Concepts:
   * Computational Effort: Bayesian optimization invests significant computational resources to select the next set of hyperparameters, considering the high cost of each trial (e.g., a training run taking hours or days).
   * Modeling with Gaussian Processes:
     * Basic Model: Utilizes a Gaussian model to represent the uncertainty or range of expected values (e.g., training loss) for each hyperparameter set. It assumes no variance at measured points, with increasing variance as the distance from these points grows.
     * Enhanced Model: Recognizes that measurements can be noisy (e.g., due to random network initialization, data partitioning) and incorporates this noise into the model.
   * Acquisition Function: This function estimates the next best hyperparameter set to try, based on metrics such as:
     * Maximum Expected Improvement: The modeled average of uncertain observations, such as the mean value in a normal distribution.
     * Maximum Upper Confidence Bound: Choosing a high percentile expected value (e.g., 95th or 99th) from the distribution.
     * Maximum Probability of Improvement: Over the previously observed maximum.
   * Exploration vs. Exploitation:
     * Exploitation: Focuses on quickly reaching the best answer, guided by the acquisition function.
     * Exploration: Modifies the acquisition to explore untried hyperparameters, controlled by an algorithm parameter. This ensures that important regions of the hyperparameter space are not ignored, even if surrounded by low-performing points.
   * Parallelized Variations: Useful when multiple high-end GPU systems are available for parallel training. Strategies are employed to choose multiple hyperparameter sets without knowing their performance. As each training finishes, the new point is added to the model, and the next set is chosen, considering the ongoing trainings.
3. Conclusion:
Bayesian optimization offers a sophisticated approach to hyperparameter tuning, balancing the need for exploration and exploitation. By modeling uncertainty and using strategic selection criteria, it navigates the complex hyperparameter space efficiently, even when parallelized across multiple systems.

## Background Material

* [A 10-minute YouTube video introduction to Bayesian optimization with clear examples](https://www.youtube.com/watch?v=M-NTkxfd7-8)
* [An introduction to Bayesian optimization with Python examples](http://krasserm.github.io/2018/03/21/bayesian-optimization/)
* [A detailed technical tutorial on Bayesian optimization](https://arxiv.org/abs/1807.02811): The abstract is worth reading, and you can dive deeper into the paper if you wish.

## Dataset

Read about the dataset at [https://www.cs.toronto.edu/~kriz/cifar.html](https://www.cs.toronto.edu/~kriz/cifar.html)

Also, I recommend you download the dataset from the Linux bash prompt instead of following the first 2 steps in the tutorial. I assume you're doing this from your home directory.

    wget https://www.cs.toronto.edu/~kriz/cifar-10-matlab.tar.gz
    tar xvfz cifar-10-matlab.tar.gz

The first command downloads a URL to a local file and the second one extracts the "compressed tape archive" file. `x` is the command to extract, `v` shows progress, `f` specifies data comes from a file (as opposed to a pipe) and `z` tells tar the file is compressed (as indicated by the .gz extension).

MATLAB has a built-in helper function for loading this common image data set, and it assumes it is in a directory named `cifar-10-batches-mat`, which was created when you extracted the tar archive above.

## Saving Training Summary Results

Since the training will take some time, I suggest you reserve a training node for 6 or more hours and also place `save successfulBayesianTraining` (or whatever filename you prefer) at the end of the `bayesMain.m` file so that it will save your all your workspace variables to a file if you are not present when it completes.

Also, you should turn the MATLAB diary on, which will log everything on the console (which will include training status updates, etc.) to a file so you can review it after your session ends. This can be done with `diary on` or by specifying a filename as is done in `bayesMain.m` in the given code.

## Lab Steps

First, unzip [most of the tutorial code](bayesLab.zip) into a working directory on Rosie. This includes 2 support functions given in the tutorial plus the main code as bayesMain.m.

Next, read through the [Deep Learning Using Bayesian Optimization](https://www.mathworks.com/help/deeplearning/ug/deep-learning-using-bayesian-optimization.html) tutorial to get an overview of the process.

To make training proceed as quickly as possible, a key metric is whether the GPU is being sufficiently utilized. `nvidia-smi -l` will give you status information on the GPU; press ctrl-C to exit. While your training is running, pay attention especially to the GPU utilization and its memory usage. In good training pipelines, GPU utilization over 90% is often attained. Memory usage is important for determining whether your GPU has the capacity to handle a larger network and/or larger batches in the training algorithm. One Rosie, the default batch size of 256 is probably too small; try editing makeObjFcn.m to make it 2048. Batch sizes are often a power of 2 since they tend to map to hardware more efficiently, but this is not required.

Begin training by running `bayesMain` from the MATLAB command prompt. This will take quite a bit of time since it will train 30 networks and each will take very roughly 6 minutes to train.

At this point (if you didn't add the save command to `bayesMain.m` before running it), you may want to `save successfulBayesianTraining` in MATLAB so that you can resume your place later by using the load function to bring MATLAB's workspace variables back in. Note that the `bayesopt` function in MATLAB is running the code in `makeObjFcn` code for each training iteration, and that code is saving each trained network to your working directory instead of keeping it in memory. Then, at the end of the optimization process, you can load the best (or any) of the networks for further analysis and, eventually, deployment.

Now, continue with the "Evaluate Final Network" section of the MATLAB tutorial. Be sure to capture your results, especially the confusion matrix.

## Informal Report

1. Include the table of results from the `bayesopt` function.
   * Discuss the progress of the algorithm by commenting on how the objective function value (final loss function value of each network on the validation sets) and the hyperparameters were varied by the algorithm.
   * Does the algorithm seem to be exploring the space, or quickly settling in on particular hyperparameter values?
   * If you lose the table, it should be possible to recover it from the BayesObject returned and saved -- ask the professor for assistance if needed.
1. Include the 10-class confusion matrix for your final network and discuss the results.
   * Are classes balanced in this validation set?
   * Are any classes easily confused?
   * Is one class particularly challenging for the network to classify?
1. Include any other graphs or results that you think are relevant or interesting.
1. Optional/extra: Evaluate one of the other networks that is not quite as good and comment on whether it performed better on a particular class.
1. Summarize your key questions or open issues.
   * Where parts of the lab hard to understand?
   * Did you run into errors and were you able to solve them?
   * Are there topics you'd like to learn more about next?

Submit your informal report covering the above items via Canvas as a Word file, PDF, etc.