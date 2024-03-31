---
usemathjax: true
title: "CSC 4601/5601 Theory of Machine Learning: Lab: Gradient Descent"
---

## Learning Outcomes
- Implement an iterative numerical optimization algorithm to solve for model variables (scalar and vector forms)
- Develop the skill of applying optimization methods for solving cost functions
- Explore the implications of global versus local optima, and how the initial conditions affect the result

## Overview
Optimization problems can be broken into two major components:
1. A **cost function** that describes the error between the model predictions and given data. This output of this *function* is dependent on the choice of model parameters and the provided training data.
2. An **algorithm** that adjusts parameters to either minimize (or maximize) a cost function. In our applications, we typically try to minimize the cost function (model error).

This lab will focus on the **algorithm** step (#2) through coding/implementation of a numerical gradient descent solver. Additionally, you will perform experiments where you apply this algorithm and explore some implications of solving optimization problems, starting parameter values, and global versus local optima. Gradient descent is an iterative algorithm and is defined by the following steps:
1. Set an appropriate cost function for the problem that you are solving.
   1. Cost functions like those created 2 labs ago.
   2. Could be any function with adjustable parameters.
2. Make an initial guess of the model parameters, $x_0$.
3. For k iterations:
   1. Compute the gradient, $\nabla f(x)$, at current model parameters.
   2. Choose a step size γ
   3. Update $x_{k+1} = x_{k} - \gamma \nabla f(x)$
   4. If change in gradient is less than tolerance stop, else go to step 3.

For this lab we will use a constant step size for all iterations. What benefit/advantage could an adjustable step size achieve?

For this lab the change in gradient can be measured using distance between the current parameter vector ($x_k$) and previous parameter vector ($x_{k-1}$).
 
## Instructions
You have been provided with two .py files ([optim.py](optim.py), [test_optim.py](test_optim.py)). optim.py contains a partial implementation of the gradient descent algorithm. Your job is to finish the implementation. test_optim.py contains unit tests designed to help you check the correctness of each method.

### A Word on Objective / Cost Functions
With gradient descent implemented you will perform several experiments where you will optimize objective functions. For our purposes we will use objective functions to refer to a general form of functions that we are trying to optimize or find the extrema of. We can then define *cost/loss functions* as functions that incorporate both a model (for making model predictions) and an error metric (like MSE). To this point, the third experiment directly uses your previously coded gaussian distribution cost function. However, the first two experiments will take a simpler approach with the objective function. Experiment 1 and 2 provide more straight-forward objective functions in a much simpler form. For these experiments you will be using your implemented algorithm to find the value of x that minimizes the function f(x). While the functions themselves are trivial (if you plot them – I am sure you can find the answer), they will allow you to better explore what the optimization algorithm is doing.

### Optimizer API
Take a moment to look through the optim.py file that you were provided. Each of the methods provided fill their own roles. Please make sure that you are adhering to the required method arguments.

    __init__(self, step_size, max_iter, tol, delta)
    optimize(self, cost_func, starting_params)
    _calculate_change(self, old, new)
    _gradient(self, cost_func, params)
    _update(self, param, gradient)

From these methods you may notice several things.
- Underscores are still used to denote private methods from public functions. For this API, the only public facing method will be `optimize`.
- The class is instantiated with arguments for the optimizer’s *hyperparameters* of step size, max iterations, tolerance, and delta. These hyperparameters are constant for the instantiated object.
- `_calculate_change`, `_gradient`, and `_update` are helper methods for the optimizer and will therefore be called in the optimize method.
- If you successfully completed last week's lab, the `_gradient` method should be 99% complete. If you were not able to get a working solution, talk with you professor as it is required for this lab.
- The cost function is passed as an argument to the optimize method. Your optimizer should eventually reference the cost_func.cost method. This also means that if you are using an objective function, you may choose to create a new class for each objective function that has a single cost method that returns the expressions value.

### Jupyter Notebook – Running experiments

Create a Jupyter notebook. The notebook should have a title, your name, and an introduction. You will be running the following experiments in the notebook.
Each of the following steps should be performed in individual cells in your jupyter notebook. If you wish to write a .py script to perform some of these operations and import it into your notebook, that is fine, but the individual segments should be in their own cells.

### Experiment 1: Cubic Model

Experiment 1 will use a cubic expression as an objective function. For this lab you will first plot this function over a few ranges to get a feel for what the function looks like. For our purposes this plot that you create can be considered the “objective function space”. It is an optimizer’s purpose in life to use tools from calculus (derivatives) to locate the optima (or extrema). However, in machine learning you often won’t have a good way to visualize this space.

Cubic Model: f(x) = x³-3x²-144x+432

Remember that the f(x) can be interpreted the same as the error metric (like MSE) from the cost functions that you previously implemented.
1. In the notebook, plot the cost function above within the bounds of -15 ≤ x ≤ 18 with a step size of 0.01. ([numpy.arange](https://numpy.org/doc/stable/reference/generated/numpy.arange.html) is useful for specifying an exact step size, while numpy.linspace is useful for specifying an exact number of samples.) Observe the shape of this function and at what values of x the function has extrema.
2. In a new figure, plot the numerical derivative of the cubic model within the same bounds and using the same step size. Search through the numerical derivative for the first 2 points of the that are equal (or closest) to zero.
3. In a new cell in your notebook create a new objective function class. This class should implement the given objective function in a method called cost. Hint: Follow the cost_function API – but you will only need to implement the cost method.
4. Import your optim classes, create an object with it, and supply the cost function that you wrote. Use the following *hyperparameters*
   - step_size = 0.01
   - max_iter = 100
   - tol = 1e-5
   - delta = 1e-4
5. Using a starting point of 0, solve for the minimum using your optimizer. Plot a line from this starting point to the minima on your objective function plot.

### Experiment 2: Quartic Model

Quartic Model: f(x) = 3x⁴-16x³-18x²

1. In the notebook, plot the cost function above within the bounds of -3 ≤ x ≤ 6.75 with a step size of 0.1. Observe the shape of this function and at what values of x the function has extrema.
2. In a new figure, plot the numerical derivative of the quartic model within the same bounds and using the same step size. Solve for the first 3 points of the derivative that are equal (or closest) to zero.
3. In a new cell in your notebook create a new objective function class. This class should implement the given objective function in a method called cost.
4. Instantiate a new object with your optim class and supply the cost function that you wrote. Use the following *hyperparameters*
   - step_size = 0.001
   - max_iter = 1000
   - tol = 1e-5
   - delta = 1e-4
5. Using three separate starting points (x = 6, 3, -2), solve for the minimum using your optimizer. Plot a line from each of the starting points to the found minima on your objective function plot.

### Experiment 3: Gaussian Model
In this experiment you will use the optimizer to finally solve for the correct μ and σ parameters that *minimize* the error between your implemented gaussian distribution model and the [gaussdist.csv](../02/gaussdist.csv) dataset you encountered in previous labs.
- Import the gaussian distribution cost function that you created in the previous labs and instantiate it with the [gaussdist.csv](../02/gaussdist.csv) dataset.
- Follow the presentation format from the previous labs in this notebook. Make sure to plot the data, initial model predictions, and the solved model predictions. Make sure to include in the plot the original error and the error after using the optimizer.
- Use a starting point (initial prediction) of μ = 1 and σ = 0.75.
- Use the following *hyperparameters*
   - step_size = 1
   - max_iter = 5000
   - tol = 1e-4
   - delta = 1e-3

### Questions
After you run all the experiments create a markdown cell to answer questions in. Copy and paste each question into the cell prior to answering it. The following questions will be graded:
1. Reflect on the form and organization of our optimizer API. Specifically, discuss each of the methods and what role they serve. This discussion should include what arguments they accept, what the method returns, and why we might choose to separate out these specific methods into helper methods.
2. For experiment 1:
   1. how many optima did you find? Hint: Discuss the significance of places where the derivative is equal to 0.
   2. When you used the optimizer you started at x = 0. How many optima did your optimizer return? Was it a minima or maxima? Was it a global or local optima? By looking at the gradient descent algorithm find what term pointed you toward the minimum. Describe how it did this. Can you think of a way to find the function’s maxima?
3. For experiment 2:
   1. how many optima did you find?
   2. Describe the different starting locations that you used to solve for optima. Was the found optima different for any of these starting locations and were they the global or local optima? If it was, can you explain why the optimizer found different solutions?
4. For experiment 3:
   1. how many optima did you find?
   2. Look back at the heatmaps you generated in two labs ago for the gaussian distribution. Describe what the optimizer is doing using the heatmap visualization.

### Submission Instructions

In Canvas, submit:

1. PDF or HTML: Rendered version of your jupyter notebook
1. ipynb: Your jupyter notebook with graphs rendered
1. Your .py files

Please see the rubric on Canvas for grading criteria.

I will be looking for the following:
- An introduction (including your own statement of the problem/lab purpose) and a written summary of your results at the top of the notebook in Markdown. Make sure to put your name at the top of the notebook.
- That all of the tests pass
- That you used NumPy functions as much as possible and avoided writing loops where possible
- You avoided unnecessary calculations and memory copies where reasonable
- That your plots look reasonable. I will be checking for proper axis labels.
- Obvious effort went into answering the questions.
