#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import numpy as np

class NumericalDifferentiation:
    """
    This class should implement numerical differentiation. These methods should be able to solve a 1-dimensonal numerical differentiation or n-dimensional numerical differentiation (gradient).
    """

    def __init__(self, delta):
        """
        The constructor should take the delta parameter (h) as an argument and set it as an object variable.

        There are two options for how to handle delta. Delta should either be a scalar (which you may have to later vectorize) or it can be set as a k-dimensional vector in which case the the object will only be able to solve for k-dimensional gradients.
        """

    def gradient(self, cost_func, params):
        """
        This method will use the given forumal for numerically estimating the gradient. The gradient of the cost_func should only be estimated at the given params points. For example:
            If you have a cost_func that is dependent on 2 parameters. The params vector should be shape (2,).

        The cost_func argument must follow the cost function API established in Lab06.

        This method should be robust to handle both scalar (1-dimensional) cost_func/params and any size (n-dimensional) cost_func/params.

        You are permitted to use a loop.

        This method will then return a gradient that has the same shape as params
        """
