#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""This module provides the NumericalDifferentiation class"""

import numpy as np

class NumericalDifferentiation:
    """
    This class implements numerical differentiation. These methods solve a 1-dimensional
    numerical differentiation or an n-dimensional numerical differentiation (gradient).
    """

    def __init__(self, delta):
        """
        The takes the delta parameter (h) as an argument and sets it as an object variable.
        """
        # There are two options for how to handle delta. Delta should either be a scalar (which you
        # may have to later vectorize) or it can be set as a k-dimensional vector in which case the
        # the object will only be able to solve for k-dimensional gradients.
        raise NotImplementedError("This function is not yet implemented.")

    def gradient(self, cost_func, params):
        """
        This method uses the given formula for numerically estimating the gradient. The gradient of
        the cost_func should only be estimated at the given params points. For example: If you have
        a cost_func that is dependent on 2 parameters. The params vector should be shape (2,).

        The cost_func argument must follow the cost function API established in last week's lab.

        This method should be robust to handle both scalar (1-dimensional) cost_func/params and any
        size (n-dimensional) cost_func/params.

        You are permitted to use a loop.

        This method will then return a gradient that has the same shape as params
        """
        raise NotImplementedError("This function is not yet implemented.")
