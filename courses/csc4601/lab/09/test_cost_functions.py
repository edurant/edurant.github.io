#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Provide unit tests of student-written cost functions"""

import unittest
import numpy as np
from sklearn import datasets
from sklearn.metrics import mean_squared_error
import cost_functions

class TestLinearCostFunction(unittest.TestCase):
    """Unit test for linear cost function using the iris dataset"""
    def solve_iris_regression(self):
        """Fits a linear regression model for the Iris data set using the normal equation."""
        iris = datasets.load_iris()

        # use sepal length as features
        X = iris.data[:, :1]

        # add a columns of 1s so that model has an intercept term
        X = np.hstack([X, np.ones((iris.data.shape[0], 1))])

        # predict the petal length
        y = iris.data[:, 2]

        # solve for params with the normal equation
        betas = np.dot(np.dot(np.linalg.inv(np.dot(X.T, X)), X.T), y)
        pred_y = np.dot(X, betas)

        return X, y, betas, pred_y

    def test_predict(self):
        """Tests the predict method using known model params"""
        X, y, betas, exp_y = self.solve_iris_regression()

        # use cost function predict method
        cost = cost_functions.LinearCostFunction(X, y)
        obs_y = cost.predict(X, betas)
        mse = mean_squared_error(obs_y, exp_y)

        self.assertEqual(obs_y.shape, y.shape)
        self.assertAlmostEqual(mse, 0.0)

    def test_error(self):
        """Tests the mean-squared error implementation"""
        X, y, _, pred_y = self.solve_iris_regression()

        # use cost function predict method
        cost = cost_functions.LinearCostFunction(X, y)
        obs_mse = cost._mse(y, pred_y)
        exp_mse = mean_squared_error(y, pred_y)

        self.assertAlmostEqual(obs_mse, exp_mse)

    def test_cost(self):
        """Tests the cost function."""
        X, y, betas, pred_y = self.solve_iris_regression()
        exp_mse = mean_squared_error(y, pred_y)

        # use cost function predict method
        cost_func = cost_functions.LinearCostFunction(X, y)
        cost = cost_func.cost(betas)

        self.assertAlmostEqual(cost, exp_mse)

class TestGaussianCostFunction(unittest.TestCase):
    """Unit test for Gaussian cost function using the CSV dataset"""
    def solve_model(self):
        """Fits the Gaussian model using estimates for the mean and variance."""
        data = np.loadtxt("gaussdist.csv", delimiter=",")

        y = data[:, 0]
        X = data[:, 1]

        # expected params
        # mu/mean, sigma/std
        mu = 3.0
        sigma = 1.0
        exp_params = np.array([mu, sigma])

        exp = ((X - mu) / sigma) ** 2
        pred_y = np.exp(-0.5 * exp) / (sigma * np.sqrt(2.0 * np.pi))

        return X, y, exp_params, pred_y

    def test_predict(self):
        """Tests the predict method using known model params"""
        X, y, params, exp_y = self.solve_model()

        # use cost function predict method
        cost = cost_functions.GaussianCostFunction(X, y)
        obs_y = cost.predict(X, params)

        self.assertEqual(exp_y.shape, obs_y.shape)

    def test_error(self):
        """Tests the mean-squared error implementation"""
        X, y, _, pred_y = self.solve_model()

        # use cost function predict method
        cost = cost_functions.GaussianCostFunction(X, y)
        obs_mse = cost._mse(y, pred_y)
        exp_mse = mean_squared_error(y, pred_y)

        self.assertAlmostEqual(obs_mse, exp_mse)

    def test_cost(self):
        """Tests the cost function."""
        X, y, params, pred_y = self.solve_model()
        exp_mse = mean_squared_error(y, pred_y)

        # use cost function predict method
        cost_func = cost_functions.GaussianCostFunction(X, y)
        cost = cost_func.cost(params)

        self.assertAlmostEqual(cost, exp_mse)

if __name__ == "__main__":
    unittest.main()
