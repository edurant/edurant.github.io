---
title: "Dr. Durant: CSC4601/5601 Theory of Machine Learning: Final Project"
---

Your project will take the final form of a 15-minute presentation on a machine learning algorithm. The purpose of this project, and subsequent presentation, is to add more breadth to this class by discussing different machine learning techniques. It is therefore your responsibility to learn how a single algorithm works, apply the algorithm to a set of data, and then present the method and the application to the class as the teacher.

Course and project outcomes:
* Understand the basic process of machine learning.
* Understand the concepts of learning theory, i.e., what is learnable, bias, variance, overfitting.
* Understand the concepts and application of supervised learning.
* Analyze and implement basic machine learning algorithms.
* Understand the role of optimization in machine learning.
* The ability to assess the quality of predictions and inferences.
* The ability to apply methods to real world data sets.

## Project Proposal

Undergraduate students will work in teams of 2 or 3. Graduate students will work in teams of 2. Due to the additional expectations for graduate students (see below), I do not recommend mixed teams.

Your team must submit a brief project proposal. Duplicate topics between groups will not be allowed. Therefore, your proposal must identify your top 3 preferred methods, the example data set(s) you will use for each model, and the first ten records of the dataset(s) to demonstrate that you are able to access and load the data.

## Data Sets

While you are not limited to these choices, some data sets are available from the UC Irvine Machine Learning Repository or Kaggle:
* https://archive.ics.uci.edu/
* https://www.kaggle.com/

## Presentation Requirements

Your will create and deliver a 15-minute PowerPoint presentation on your chosen model / algorithm. In your presentation you should identify and explain the following:
* The type of machine learning problem solved (e.g., regression or classification)
* The model used by the method
* The cost function that is optimized in order to fit the model (where appropriate)
* How the model is fit (e.g., describe the algorithm)
* How a fitted model is used to make predictions
* An example of applying the model to the chosen example data set, including an evaluation of the predictions using an appropriate metric
* Discussion of any advantages or disadvantages of the model / algorithm such as an analysis of the time or space complexity for model fitting and prediction

## Project Milestones

* 10 points: Team and Topic Choices (Only 1 team member should submit in Canvas): End of week 8
* 50 points: Draft of Presentation Slides: End of week 13
* 100 points: Give Presentation: Throughout week 15
* 10 points: Submit Final Slides, Code, etc.: End of week 15

## Grading

This assignment will carry 15% of your overall class grade.

## Example Models / Algorithms
* Clustering
  * K-Means
  * Affinity Propagation
  * Spectral Clustering
  * DBSCAN
  * Gaussian Mixture Models
  * Hierarchical Clustering
* Classification / Regression
  * Naïve Bayes
  * Random Forests
  * Gradient-Boosted Trees
  * Transductive SVMs / Semi-Supervised Support Vector Machines (S3VMs)
  * Multi-layer perceptron (type of artificial neural network, should discuss backpropagation and activation functions)
  * Large margin nearest neighbor
* Recommendation Systems
  * Collaborative Filtering
  * Matrix factorization methods
  * Alternating Least Squares
* Dimensionality Reduction
  * Non-negative matrix factorization (NMF)
  * tSNE
  * UMAP
  * Metric learning (e.g., neighborhood component analysis)
* Anomaly Detection
  * Random sample consensus (RANSAC)
  * Isolation forests
  * Robust Random Cut Forest (RRCF)

## Additional Expectations for Graduate Students

In your proposal, please choose 2 of the following additional tasks that you will complete and incorporate into your final presentation. Your presentation should clearly label these sections.

* Algorithm Implementation from Scratch—depending on the complexity, this may be a full implementation or a simplified version that has some well documented assumptions.
* Performance Comparison—compare 2 or more implementations (possibly including your own, ideally including at least 1 popular library implementation). Ideally on Rosie, look at runtime, memory usage, CPU/GPU usage, etc., across a variety of data set sizes, dimensionalities, etc.
* Hyperparameter Tuning and Optimization—Perform a grid search, random search, Bayesian optimization or other optimization and discuss your results.
* Theoretical Deep Dive—Consider the algorithm's convergence properties, how empirical performance differs from theoretical performance, sensitivity to hyperparameters, etc. You should consider test runs to see if they are consistent with theory. Please cite your source(s); I am asking you to learn and discuss the theory at a deeper level, not produce it.
