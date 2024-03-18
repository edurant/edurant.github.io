#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Define cost function for various model types (Gaussian, Linear)
"""

import numpy as np

class GaussianCostFunction:
    """
    Implements a cost function for fitting a Gaussian (normal) distribution.
    """
    def __init__(self, features, y_true):
        """
        The constructor takes the feature matrix and true y values
        for the training data.
        """
        raise NotImplementedError("This function is not yet implemented.")

    def predict(self, features, params):
        """
        Predicts the y values for each data point
        using the feature matrix and the model parameters.

        We expect that the features are a Nx1 matrix of
        x values. The params is a length-2 array of the
        mean (mu) and std deviation (sigma).
        """
        raise NotImplementedError("This function is not yet implemented.")


    def _mse(self, y_true, pred_y):
        """
        Calculates the mean-squared error between the predicted and
        true y values.
        """
        raise NotImplementedError("This function is not yet implemented.")


    def cost(self, params):
        """
        Calculates the cost function value for the model's predictions
        using the given params.

        This should:
        1. Use the params and data's features to predict the y values
        2. Calculate the error between the true and predicted y values
        3. Return the error
        """
        raise NotImplementedError("This function is not yet implemented.")

class LinearCostFunction:
    """
    Implements a cost function for a linear regression model.
    """
    def __init__(self, features, y_true):
        """
        The constructor takes the feature matrix and true y values
        for the training data.
        """
        raise NotImplementedError("This function is not yet implemented.")

    def predict(self, features, params):
        """
        Predicts the y values for each data point
        using the feature matrix and the model parameters.

        We expect that the features are a NxM matrix.
        The params are a 1D array of length M.
        """
        raise NotImplementedError("This function is not yet implemented.")

    def _mse(self, y_true, pred_y):
        """
        Calculates the mean-squared error between the predicted and
        true y values.
        """
        raise NotImplementedError("This function is not yet implemented.")


    def cost(self, params):
        """
        Calculates the cost function value for the model's predictions
        using the given params.

        This should:
        1. Use the params and data's features to predict the y values
        2. Calculate the error between the true and predicted y values
        3. Return the error
        """
        raise NotImplementedError("This function is not yet implemented.")
