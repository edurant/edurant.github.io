---
usemathjax: true
title: "CSC 4601/5601 Theory of Machine Learning: Problem Set: Cost Function Fun"
---

You may complete the following entirely in a Jupyter notebook.
Use the LaTeX interpreter in a markdown cell where needed.

## Problem 1: Regularization

A linear model such as logistic regression or linear regression might
overfit the data when there is a large number of features. One way to
address this issue is to regularize or shrink the contribution of some
of the features by reducing the magnitude of their corresponding
weights or coefficients. By doing so, we can reduce the variance of the
predicted values, and we can enhance the interpretability of the linear
model by determining a smaller subset of the most important
features. This is achieved by adding a penalty or regularization term to
the cost function, which forces the learning algorithm to not only fit
the data but also to keep the weights of the model as small as possible.

### Regularized versions of linear regression

One way to regularize linear regression is to modify the cost
function as follows:

$$ \frac{1}{N} \sum_{j=1}^N \left( w_0 + \sum_{i=1}^m w_i x_i^{(j)} - y^{(j)} \right)^2 + \lambda \sum_{i=1}^m w_i^2 $$

The penalty term with coefficient λ is known as the L2 norm of
the weight vector. It is the regularization term or shrinkage penalty
and is a hyperparameter that you can use to
control how much you want to regularize the model. It is
important to scale the data before performing regularization so that the
weights are on comparable scales for features of comparable importance.
Regularizing linear regression using the L2 norm is known as the ridge regression.

1. Regularization hyperparameter:
   - What is the difference between a model's parameter and a model's hyperparameter?
   - As we increase λ from 0, how will the training MSE (mean-squared error) change? How do you expect the test MSE change? Sketch the bias-variance trade-off.
   - Suppose you used regularized linear regression and noticed that the training and validation errors are almost equal and high. Should you increase or decrease the regularization hyperparameter λ?

2. There is another version of regularized linear regression known as the Lasso regression, defined as follows:

$$ \frac{1}{N} \sum_{j=1}^N \left( w_0 + \sum_{i=1}^m w_i x_i^{(j)} - y^{(j)} \right)^2 + \lambda \sum_{i=1}^m |w_i| $$

Lasso regression uses the L1 norm of the weight vector. An important characteristic of the Lasso regression is
that it can force some of the weights to be exactly equal to zero when the hyperparameter λ is high enough. On the other hand, ridge regression shrinks all of the weights toward zero but does not set any of them to zero.

- Load the [California housing dataset](https://scikit-learn.org/stable/modules/generated/sklearn.datasets.fetch_california_housing.html)
- Split the data into 80% for training and 20% for testing using [```train_test_split```](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.train_test_split.html).

### Part 1: Explore effect of λ with L2 normalization
Use the [ridge regression](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.ridge_regression.html?highlight=ridge\%20regression\#) implementation in scikit-learn and fit several ridge regression models to the training data.

Make sure to [scale the training data](https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.StandardScaler.html) before fitting each model.

Use a different λ (α in scikit-learn) for each of these models. You can try values in ```np.arange(0,MAXIMUM,STEP)``` or ```np.linspace(0,MAXIMUM,STEPS)```; consider [```np.logspace```](https://numpy.org/doc/stable/reference/generated/numpy.logspace.html) if you want to try a few orders of magnitude or more of λ values, but note its arguments differ. Choose your λ values so that you see a wide range of coefficient norms; make it large enough so you can see asymptotic performance.

For each fitted model extract its coefficients and compute their norms. How is the norm of the coefficients changed by varying the hyperparameter λ?

The ridge regression implementation differs from most others in that it requires you to request that it calculate an intercept (otherwise it assumes a 0 intercept!) and returns the intercept and weights instead of providing a predict method that applies them for you.

### Part 2: Compare 2 regularization methods to baseline
Apply the following 3 model types:
* [```LinearRegression```](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LinearRegression.html)
* [```Lasso```](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.Lasso.html)
* [```ridge_regression```](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.ridge_regression.html?highlight=ridge\%20regression\#)

For the ridge regression and lasso models, try different values for λ (or α in sklearn), and then choose a final model and evaluate it on the test set. (Optional: show train vs. test MSE vs. λ for both model types.)

Optional: To increase confidence that the model generalizes well, perform 5-fold cross-validation. Note: to perform cross-validation (5-fold), you can use [```cross_validate```](https://scikit-learn.org/stable/modules/generated/sklearn.model_selection.cross_validate.html?highlight=cross\%20validate\#) and specify the scoring as ```neg_mean_squared_error``` or ```mean_squared_error```.

Optional: In addition to plotting the norm of the weights overall (the regularization term), make a plot showing how each weight varies with λ.

Many other models, such as logistic regression, can be also extended by including a regularization term in the cost
function. The regularization term can be in terms of the L2 norm or L1 norm of the weight vector.

## Problem 2: Class Weighted Algorithm

We've seen that the cost functions used in training the machine models can be written as:

$$ \sum_{j=1}^N \text{Loss}(y_{\text{pred}}^{(j)}, y_{\text{true}}^{(j)}) $$

ML models used for classification assume that there is an equal number of samples observed from each class, and that all losses incurred due to misclassification are the same. However, this is not always the case,
as the data might be imbalanced and where the minority class is the class of interest for us.

One way to mitigate the class imbalances is to modify the cost function to the following:

$$
v_1 \sum_{j \in \text{Class 1}} \text{Loss}(y_{\text{pred}}^{(j)}, y_{\text{true}}^{(j)}) +
v_0 \sum_{j \in \text{Class 0}} \text{Loss}(y_{\text{pred}}^{(j)}, y_{\text{true}}^{(j)})
$$

*v₁* and *v₀* are weights assigned to each class, where the *v* hyperparameters are chosen in order to draw the attention of the learning algorithm to the minority class. When the weighted version of the cost function is implemented, we refer to the modified version of the algorithm as the class weighted algorithm or weighted algorithm.

If class 1 is the minority class, how should *v₁* be chosen with respect to *v₀*?

Load the [```creditcard.csv```](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud/data) data.
- The last column represents the class label. Check the proportion of each class and comment on the severity of the class imbalance.
- Split the data into training and testing (20% for testing).
- Process the training set by scaling the features using ```StandardScaler```, scale the testing set in the same way.
- Fit two models on the training data: standard [LogisticRegression](https://scikit-learn.org/stable/modules/generated/sklearn.linear_model.LogisticRegression.html) and weighted logistic regression (by setting ```class_weight``` to "balanced").
- Test the two models on the testing set using the recall score.
- Optional: also show the accuracy and precision scores.
