#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Provides unit tests for Optimizer class"""

import unittest
import numpy as np
import optim

class ParabolicCostFunction:
    """Implement a parabolic cost function with gradient"""
    def cost(self, params):
        """
        Implements the parabola:

        y = 5(x-3)**2 + 4

        The minima should be at x = 3
        """
        return 5 * (params - 3) * (params - 3) + 4

    def gradient(self, params):
        """
        THIS METHOD IS NOT NEEDED FOR THE OPTIMIZER.

        Just here to help with unit tests.
        """
        return 10 * (params - 3)

class ParaboloidCostFunction:
    """Implement a paraboloid cost function with gradient"""
    def cost(self, params):
        """
        Implements the parabola:

        z = (x-2)**2 + (y-3)**2

        The minima should be at x = 2, y = 3
        """
        return (params[0] - 2)**2 + (params[1] - 3)**2

    def gradient(self, params):
        """
        THIS METHOD IS NOT NEEDED FOR THE OPTIMIZER.

        Just here to help with unit tests.
        """
        dx = 2 * (params[0] - 2)
        dy = 2 * (params[1] - 3)
        return np.array([dx, dy])

class TestOptimizer(unittest.TestCase):
    """Provide unit tests for Optimizer class"""
    NUMERIC_DIFF_DELTA = 1e-5
    GRADIENT_TOL = 1e-2
    STEP_SIZE = 0.1
    MAX_ITER = 100
    TOL = 1e-5

    def test_gradient_parabola(self):
        """
        Tests the gradient method using a parabolic cost function with a single parameter.
        """
        optimizer = optim.Optimizer(None, None, None, self.NUMERIC_DIFF_DELTA)
        cost = ParabolicCostFunction()

        # optimizer should expect a 1D array
        params = np.zeros(1)

        # try at x = -1
        params[0] = -1
        numeric_gradient = optimizer._gradient(cost, params)
        analytic_gradient = cost.gradient(params)

        # expect 1D array
        self.assertEqual(len(numeric_gradient.shape), 1)
        self.assertEqual(numeric_gradient.shape[0], 1)

        diff = numeric_gradient - analytic_gradient
        norm = np.linalg.norm(diff)

        self.assertLess(norm, self.GRADIENT_TOL)

    def test_gradient_paraboloid(self):
        """
        Tests the gradient method using a paraboloid cost function with two parameters.
        """
        optimizer = optim.Optimizer(None, None, None, self.NUMERIC_DIFF_DELTA)
        cost = ParaboloidCostFunction()

        # optimizer should expect a 1D array
        # of two parameters
        params = np.zeros(2)

        # try at x = -1, y = 1
        params[0] = -1
        params[1] = 1
        numeric_gradient = optimizer._gradient(cost, params)
        analytic_gradient = cost.gradient(params)

        # expect a 1D array
        self.assertEqual(len(numeric_gradient.shape), 1)
        self.assertEqual(numeric_gradient.shape[0], 2)

        diff = numeric_gradient - analytic_gradient
        norm = np.linalg.norm(diff)

        self.assertLess(norm, self.GRADIENT_TOL)

    def test_update_zero(self):
        """
        Tests update with initial parameters set to 0
        """
        optimizer = optim.Optimizer(self.STEP_SIZE, None, None, None)

        # assume x, y, and z
        params_before = np.zeros(3)

        # fake gradient
        gradient = np.array([1.0, 2.0, 3.0])

        # do parameter update
        params_after = optimizer._update(params_before, gradient)

        # check shape
        self.assertEqual(params_after.shape, params_before.shape)

        for i in range(3):
            expected = - self.STEP_SIZE * gradient[i]
            self.assertAlmostEqual(params_after[i], expected)

    def test_update_nonzero(self):
        """
        Tests update with initial parameters set to non-zero values
        """
        optimizer = optim.Optimizer(self.STEP_SIZE, None, None, None)

        # assume x, y, and z
        params_before = np.array([3, 5, 7])

        # fake gradient
        gradient = np.array([1.0, 2.0, 3.0])

        # do parameter update
        params_after = optimizer._update(params_before, gradient)

        # check shape
        self.assertEqual(params_after.shape, params_before.shape)

        for i in range(3):
            expected = params_before[i] - self.STEP_SIZE * gradient[i]
            self.assertAlmostEqual(params_after[i], expected)

    def test_optimize_parabola(self):
        """
        Tests the optimizer for finding the minima of a parabola.
        """
        optimizer = optim.Optimizer(self.STEP_SIZE, self.MAX_ITER, self.TOL,
            self.NUMERIC_DIFF_DELTA)
        cost = ParabolicCostFunction()

        # start at x = 0
        params_before = np.zeros(1)
        params_after, exec_iter = optimizer.optimize(cost, params_before)

        # minima is at x = 3
        self.assertAlmostEqual(params_after[0], 3, delta=self.TOL)

        # should not take more than 5 iterations
        self.assertLess(exec_iter, 5)

    def test_optimize_parabaloid(self):
        """
        Tests the optimizer for finding the minima of a parabola.
        """
        optimizer = optim.Optimizer(self.STEP_SIZE, self.MAX_ITER, self.TOL,
            self.NUMERIC_DIFF_DELTA)
        cost = ParaboloidCostFunction()

        # start at x = 0
        params_before = np.zeros(2)
        params_after, exec_iter = optimizer.optimize(cost, params_before)

        # minima is at x = 2, y = 3
        params_actual = np.array([2,3])
        for i, param_after in enumerate(params_after):
            self.assertAlmostEqual(param_after, params_actual[i], delta=self.TOL * 10.0)

        # should not take more than 60 iterations
        self.assertLess(exec_iter, 60)

if __name__ == "__main__":
    unittest.main()
