---
usemathjax: false
title: "CSC 4601/5601 Theory of Machine Learning: Lab 4: k-Nearest Neighbors"
---

## Learning Outcomes
- Sketch or plot the decision boundaries for fitted models with 1 or 2 features
- Describe how the decision boundaries for a linear model differ from a non-linear model
- Describe cross-fold validation and what types of problems for which they are appropriate
- Interpret a metric to assess the quality of a model’s predictions and choose between 2 models (model selection)
- Calculate the distance between 2 data points using a given metric
- Describe and implement the algorithm for predicting values using k-nearest neighbors
- Explain when it is appropriate to use mode, average, and median aggregation functions
- Describe the run-time of fitting and predicting with KNN in Big O notation
- Describe the limitations of KNN

## Overview
In the last lab, you explored linear decision boundaries. In that lab, we gave you an equation for linear decision boundaries. We asked you to classify data points using linear decision boundaries we provided and evaluate the accuracy of those predictions. In this lab, you're going to interrogate the decision boundary learned by a machine learning model.

In many data sets, the classes cannot be separated by a line. We need to turn to models capable of learning non-linear decision boundaries. k-Nearest Neighbors (KNN) is a simple, non-parametric machine learning method capable of learning non-linear decision boundaries. KNN was one of the first machine learning algorithms developed. KNN uses the "features" to represent the data as points in a N-dimensional space. KNN then calculates the distance between the query point and every training point. KNN uses the distances to find the k nearest training points and predict the value of dependent variables for the query point by calculating the mode or average of the neighboring points' dependent variable values. While it is not widely used outside of, e.g., recommendation systems these days, it is a good introduction to implementing machine learning algorithms and counterexample to linear models.

You are going to implement the KNN algorithm for classification and regression. You will then perform 2 experiments with your implementation. First, you will evaluate the model on a grid of points to visualize the learned decision boundaries. Secondly, you will explore how the parameter k impacts the accuracy and decision boundaries of the model.

In KNN, we have 2 sets of points: the reference points (training data) and query points (naïve data / data you want to classify). Each set of points is represented by a matrix of features. For the reference points, we have known values for the output variable which are stored as a vector. The algorithm takes a parameter k, which indicates how many reference points to use when predicting the output variable for each query point. The classification / regression algorithm proceeds as follows:

For each query point q:

1. Compute the Euclidean or squared Euclidean distance between q and every reference (training) point (Hint: use [scipy.spatial.distance.cdist](https://docs.scipy.org/doc/scipy/reference/generated/scipy.spatial.distance.cdist.html))
2. Find the k closest reference points to point q (Hint: use [numpy.argsort](https://numpy.org/doc/stable/reference/generated/numpy.argsort.html))
3. Predict the outcome variable
   1. If used for classification, predict the output variable's value as the mode of the output values for the k-nearest neighbors (Hint: use [scipy.stats.mode](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.mode.html))
   2. If used for regression, predict the output variable's value as the average of the output values for the k-nearest neighbors (Hint: use [numpy.mean](https://numpy.org/doc/stable/reference/generated/numpy.mean.html))

## Instructions
### Implement the KNN Algorithm
You have been provided with 2 .py files ([knn.py](knn.py), [test_knn.py](test_knn.py)). knn.py contains stub functions for a KNN class. Your job is to finish that implementation. The file test_knn.py contains unit tests designed to help you check the correctness of each method.

1. Rename knn_stub.py to knn.py.
2. Implement the following methods:

       __init__(self, k, aggregation_function)
       fit(X, y)
       predict(X)

You can test your code by running the following in a notebook:

`!python test_knn.py`

### Explore Decision Boundaries for 3 Data Sets
1. Create a Jupyter notebook named lastname_lab04. The notebook should have a title, your name, and an introduction.
2. In the notebook, import your KNN class.
3. For each of the three provided data sets ([moons](moons.csv), [circles](circles.csv), and [rocky ridge](rocky_ridge.csv)):
   1. Split the data set into training and testing sets using the [sklearn.model_selection.train_test_split()](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.train_test_split.html) function.
   2. Train the [sklearn.preprocessing.StandardScaler](https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.StandardScaler.html) transformer on the training set. Use it to transform the features for the training and testing sets.

           scaler = StandardScaler()
           train_X = scaler.fit_transform(train_X)
           test_X = scaler.transform(test_X)

   3. Fit a KNN model with 3 neighbors on the training data set using the appropriate aggregation function.
   4. Evaluate the model for each point on a 2-D grid. The grid should span from -3 to 3 on the x-axis and -3 to 3 on the y-axis with a point every 0.02 units.
   5. Plot the predicted values using [matplotlib.pyplot.contourf()](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.contourf.html). On the same plot, create a scatter plot of data points colored by class.

### Choosing an Optimal Value for k
1. Load the fourth data set ([sweep.csv](sweep.csv)).
2. Evaluate the impact of the k parameter using cross-fold validation. Repeat the following process for values of k from 1 to 200 in steps of 10.
   1. Use [sklearn.model_selection.StratifiedKFold(n_splits=10, shuffle=True)](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.StratifiedKFold.html) to divide the data set into 10 folds.
   2. For each fold, train the model on the remaining 9 folds and make predictions for the held-out fold.
   3. Calculate the accuracy of the predictions for each fold.
   4. Calculate the average (using numpy.mean) and standard deviation (using numpy.stdev) of the 10 accuracy scores.
3. Use [matplotlib.pyplot.errorbar()](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.errorbar.html) to plot the average and standard deviation (as error bars) for each value of k.

## Reflection Questions
### KNN Implementation (Problem 1)
1. Estimate the run time complexity in Big O notation of training a KNN model. Justify your answer.
2. Estimate the run time complexity in Big O notation of predicting the output value for a query point using a training set of N points, with p features, and k neighbors with a KNN model. Justify your answer.
3. What do you think the potential downsides of the k-nearest neighbors algorithm are? Why do you think it might not be used as widely as other methods?

### Decision Boundaries (Problem 2)
1. For each of the three data sets, do you think a linear decision boundary could be used to accurately classify the data points?
2. What do we mean by a "non-linear" decision boundary? Give an example of a non-linear function that could be used as a decision boundary for one of the data sets.
3. What are the advantages of non-linear decision boundaries over linear decision boundaries? What are the disadvantages?

### Choosing an Optimal Value for k (Problem 3)
1. What value of k gave the highest accuracy?
2. For large values of k, what happened to the accuracy? Why do you think this is?
3. Let's say that we ask you to use the following experimental setup to find a value of k that maximizes the accuracy of the model's predictions: split the data set into training and testing sets, train a model for each value of k using the training set, predictions the classes of the testing points, and evaluate the accuracy of the predictions. Could this approach give you misleading results? If so, why?
4. It is considered a "best practice" to use cross-fold validation when optimizing parameters. Why do you think that is?

## Submission Instructions and Grading Criteria
Save the notebook as an html or pdf. Push your implemented KNN class (named knn.py) and your notebook to the Code directory in this repo. Upload your notebook export to Canvas. I will be will looking for the following:
- That all of the unit tests pass
- That you used NumPy functions as much as possible and avoided writing loops
- An introduction (including your own statement of the problem) and a written summary of your results at the top of the notebook in Markdown. Make sure to put your name at the top of the notebook.
- That your plots look reasonable.
- Reasonable attempts to answers the questions.

Please see Canvas for the grading rubric.
