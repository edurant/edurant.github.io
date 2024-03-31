#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""This module provides the Optimizer class"""

import numpy as np

class Optimizer:
    """Implements Gradient Descent using numerical differentiation for calculating the gradient."""
    def __init__(self, step_size, max_iter, tol, delta):
        """
        max_iter -- maximum number of iterations to run
        step_size -- also known as lambda
        tol -- Stopping parameter for difference between parameters between update steps.
        delta -- perturbation to use in numerical differentiation
        """
        raise NotImplementedError("This function is not yet implemented.")

    def optimize(self, cost_func, starting_params):
        """
        Finds parameters that optimize the given cost function.

        This method should implement your iterative algorithm for updating your parameter estimates.
        Use an updated estimate of the gradient to update the parameters.

        Give consideration for what the exit conditions of this loop should be.

        Returns a tuple of (optimized_param, iters)
        """
        raise NotImplementedError("This function is not yet implemented.")

    def _calculate_change(self, old, new):
        """
        Calculates the change between the old and new parameters.
        Returns a scalar.
        """
        raise NotImplementedError("This function is not yet implemented.")

    def _gradient(self, cost_func, params):
        """
        Numerically estimates the gradient (first derivative) of the cost function
        at param.

        First-order numerical differentiation
        df/dx = [ f(x + delta) - f(x) ] / delta

        Should return the gradient at the calculated point
        """
        raise NotImplementedError("This function is not yet implemented.")

    def _update(self, param, gradient):
        """
        Updates the param vector using the Gradient Descent algorithm.

        Returns the new parameters.  (Do not modify input)
        """
        raise NotImplementedError("This function is not yet implemented.")
