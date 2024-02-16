#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""Implement a simple multilayer perceptron (MLP)"""

import numpy as np

class Input:
    """Input layer for MLP, prepends column of 1s to support bias/intercept"""
    def predict(self, input_data):
        constant = np.ones((input_data.shape[0], 1))
        return np.hstack([constant, input_data])

class Neuron:
    """Neuron for MLP with ReLU activation"""
    def __init__(self, input_layers, weights):
        self.weights = weights
        self.input_layers = input_layers

    def predict(self, input_data):
        predictions = []
        for layer in self.input_layers:
            predictions.append(layer.predict(input_data))
        result = np.dot(np.hstack(predictions), self.weights)
        return np.fmax(result, 0.0)

class HStack:
    """Combines a set of layers horizontally so that they act in parallel/simultaneously"""
    def __init__(self, input_layers):
        self.input_layers = input_layers

    def predict(self, input_data):
        predictions = []
        for layer in self.input_layers:
            predictions.append(layer.predict(input_data).reshape(-1, 1))
        return np.hstack(predictions)
