#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import unittest

import numpy as np
from scipy import spatial
from sklearn.datasets import load_iris
from sklearn.datasets import make_blobs
from sklearn.metrics import accuracy_score
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import train_test_split

from knn import KNN

def generate_cluster_samples():
    """
    Generates random samples in a 2D space
    from 4 clusters.

    Returns tuple of features and labels.
    """
    k = 4
    n_samples = 32
    var = 0.01

    # 4 clusters in a 2D space
    centers = np.array([[0, 0],
                        [0, 1],
                        [1, 0],
                        [1, 1]])

    X, y = make_blobs(n_samples,
                      centers=centers,
                      cluster_std = np.sqrt(var),
                      shuffle=True)

    return X, y

class TestKNN(unittest.TestCase):
    def test_blob_classification(self):
        """
        Tests kNN for classification using
        randomly-generated points drawn from
        Gaussian-shaped clusters.

        Splits data into training and testing
        sets.
        """

        k = 3
        X, y = generate_cluster_samples()

        train_X, test_X, train_y, test_y = train_test_split(X, y, stratify=y)

        knn = KNN(k, "mode")
        knn.fit(train_X, train_y)
        pred_y = knn.predict(test_X)

        # verify shape of output
        self.assertEqual(len(pred_y.shape), 1)
        self.assertEqual(pred_y.shape[0], test_X.shape[0])

        # with k=1, each point should match itself
        accuracy = accuracy_score(test_y, pred_y)
        self.assertAlmostEqual(accuracy, 1.0)

    def test_iris_classification(self):
        """
        Tests kNN for classification
        """

        k = 1
        iris_dataset = load_iris()


        knn = KNN(k, "mode")
        knn.fit(iris_dataset.data, iris_dataset.target)
        predicted = knn.predict(iris_dataset.data)

        # verify shape of output
        self.assertEqual(len(predicted.shape), 1)
        self.assertEqual(predicted.shape[0], iris_dataset.data.shape[0])

        # with k=1, each point should match itself
        accuracy = accuracy_score(iris_dataset.target, predicted)
        self.assertAlmostEqual(accuracy, 1.0)

    def test_iris_regression(self):
        """
        Tests kNN for regression
        """

        k = 1
        iris_dataset = load_iris()

        knn = KNN(k, "average")

        # get petal length as input
        # ensure this is 2D
        X = iris_dataset.data[:, 2].reshape(-1, 1)

        # get petal width as output
        y = iris_dataset.data[:, 3]

        knn.fit(X, y)
        predicted = knn.predict(X)

        # verify shape of output
        self.assertEqual(len(predicted.shape), 1)
        self.assertEqual(predicted.shape[0], iris_dataset.data.shape[0])

        # with k=1, each point should match itself
        # but with only 1 dimension, some points have
        # the same values
        mse = mean_squared_error(y, predicted)
        self.assertLess(mse, 0.1)

if __name__ == "__main__":
    unittest.main()
