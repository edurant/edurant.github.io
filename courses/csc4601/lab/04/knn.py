#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import random

import numpy as np
from scipy import spatial
from scipy import stats

class KNN:
    """
    Implementation of the k-nearest neighbors algorithm for classification
    and regression problems.
    """
    def __init__(self, k, aggregation_function):
        """
        Takes two parameters.  k is the number of nearest neighbors to use
        to predict the output variable's value for a query point. The
        aggregation_function is either "mode" for classification or
        "average" for regression.

        Parameters
        ----------
        k : int
           Number of neighbors

        aggregation_function : {"mode", "average"}
           "mode" : for classification
           "average" : for regression.
        """


    def fit(self, X, y):
        """
        Stores the reference points (X) and their known output values (y).

        Parameters
        ----------
        X : 2D-array of shape (n_samples, n_features)
            Training/Reference data.
        y : 1D-array of shape (n_samples,)
            Target values.
        """


    def predict(self, X):
        """
        Predicts the output variable's values for the query points X.

        Parameters
        ----------
        X : 2D-array of shape (n_queries, n_features)
            Test samples.

        Returns
        -------
        y : 1D-array of shape (n_queries,)
            Class labels for each query.
        """
