---
usemathjax: true
title: "CSC 4601/5601 Theory of Machine Learning: Problem Set: Calculus Review"
---

You may complete the following entirely in a Jupyter notebook.
Use the LaTeX interpreter in a markdown cell where needed.

## Problem 1: Derivatives
For each of the following, compute the derivative:

- $f(x) = 3x^4 - 16x^3 + 18x^2$
- $f(x) = \log (x^2 + 10)$
- $f(x) = \log_{10} (x^2 \sin x)$
- $f(x) = x e^{-x}$
- $f(x) = \frac{1}{2\sqrt{2 \pi}} e^{-\frac{1}{2}\Big(\frac{x - 5}{2}\Big)}$

## Problem 2: Minima and Maxima
First derivatives can be used to find minima and maxima. For each of the functions below, (a) calculate the first derivative, (b) find the zeros of the derivative to find the minima and maxima, and (c) plot the function and verify your computed minima and maxima by plotting them as points on the graph.

- $y = 5(x-3)^2 + 4$
- $f(x) = x^3 - 3x^2 - 144x + 432$
- $f(x) = 3x^4 - 16x^3 + 18x^2$

## Problem 3: Tangent Lines
Many optimization algorithms use a tangent line to approximate a curve at a given point. You will compute the tangent lines to the curve. Steps:

1. Calculate the value $y_1$ of the function $f(x)$ at $x_1$
2. Calculate the slope $m$ of the function at $x_1$ using the first derivative $m = f'(x_1)$
3. Plug the point $(x_1, y_1)$ and slope $m$ into the point-slope line equation $y = mx + b$. Use $y - y_1 = m (x - x_1)$ to solve for the equation of a line $y = mx + b$

For each of the points below, find the equations for the tangent lines for $f(x) = 5(x-3)^2 + 4$ and draw the tangent lines on a plot of $f(x)$. Do you notice anything about the slopes as $x$ gets farther away from the minima?

- $x_1 = 0$
- $x_2 = 1$
- $x_3 = 3$
- $x_4 = 5$

## Problem 4: Newton's Method
In cases where we can't easily find the zeros of a derivative analytically, we can use an iterative approximation method. In calculus, you may have learned of Newton's method of finding the zeros of a function using its first derivative $f'(x)$:

$$
x_{n+1} = x_n - \frac{f(x)}{f'(x)}
$$

From problem 3, we know that the zeros of the first derivative $f'(x)$ indicate the minima or maxima of a function. We can apply Newton's method to the first derivative $f'(x)$ rather than the original function to find the zeros of $f'(x)$ and hence the minima and maxima of $f(x)$:

$$
x_{n+1} = x_n - \frac{f'(x)}{f''(x)}
$$

Using a starting point of $x_1 = -5$, use Newton's method to find the zero of the function $f(x) = 5(x-3)^3 + 4$.

- Calculate the first and second derivatives of $f(x)$
- Repeatedly apply Newton's method starting at $x_1 = -5$. The value of $x_i$ will stop changing after a few iterations. This means that the iterative algorithm has converged and found a zero. Create a table of $x_i$, $f'(x_i)$, and $f’’(x_i)$ for each iteration.
- Finally, plot $f(x)$ and the points (e.g., $(x_1, f(x_1)), (x_2, f(x_2)), \cdots$) of each step connected by lines.

## Problem 5: Gradients
Many functions used in machine learning take a vector as input and return a scalar. These are called scalar fields or scalar-valued functions of a vector. For example, the function $f(c)$ takes a vector $v$ of length $N$ and returns a scalar. Formally, we write $f : R^N \to R$ to describe such a function. To optimize this function, we need to take the derivative. The derivative of scalar field is called a gradient. The gradient of $f(v)$ is indicated by $\nabla f(v)$ and is a vector of partial derivatives:

$$
\nabla f(v) =
\begin{bmatrix}
\frac{\partial f}{\partial v_1} \\
\frac{\partial f}{\partial v_2} \\
\frac{\partial f}{\partial v_3} \\
\vdots \\
\frac{\partial f}{\partial v_N} \\
\end{bmatrix}
$$

Use the following function in the problems below:

$$ f(x, y, z) = x^5 + 3x^3y^2 + 3xy^4 + z^2 y^2 + 4xyz + z^2 $$

where $v = \langle x, y, z\rangle $

Calculate the following:
- $\frac{\partial f}{\partial x} = $
- $\frac{\partial f}{\partial y} = $
- $\frac{\partial f}{\partial z} = $
- $\nabla f(v) = $
