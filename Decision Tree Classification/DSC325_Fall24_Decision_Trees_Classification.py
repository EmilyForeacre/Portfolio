# -*- coding: utf-8 -*-
"""
Created on Mon Dec  9 20:10:53 2024
@author: rgreg
DSC 325 Essentials of Data Science
Decision Trees for Classification
"""

import numpy as np
import pandas as pd
from matplotlib import pyplot as plt 

from sklearn.datasets import load_iris
from sklearn import tree
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

# Load the iris dataset
iris = load_iris()

# Clarify the features (predictor vars) and target attribute
iris_features = pd.DataFrame(data=iris.data,\
   columns=['sepal.length','sepal.width','petal.length','petal.width'])
iris_target = pd.DataFrame(data=iris.target, columns=['species'])
iris_target['species'] = \
    iris_target['species'].map({0: '1', 1: '2', 2: '3', 3: '4', 4: '5'})

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(iris_features,\
    iris_target, test_size=0.2, random_state=237)

# Create a decision tree classifier
clf = DecisionTreeClassifier()

# Train the classifier on the training data
clf.fit(X_train, y_train)

# Make predictions on the testing data
y_pred = clf.predict(X_test)

# Evaluate the accuracy of the classifier
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)

# Visualize the decision tree
fig = plt.figure(figsize=(25,20))
_ = tree.plot_tree(clf,
                   feature_names=iris_features.columns,
                   class_names=iris.target_names,
                   filled=True)

# Define a new unclassified instance
newdata = {'sepal.length': [6.5], 'sepal.width': [3.0],
           'petal.length': [5.2], 'petal.width': [1.5]} 
isinstance(newdata, dict)
newdata_df = pd.DataFrame(newdata)

# Predict on the new data
y_new = clf.predict(newdata_df)
print(y_new)    


## Another Example

# Bank marketing example
Bank = pd.read_csv("bank.csv", sep=";")
Bank_features = Bank.iloc[:,0:16]
Bank_target = Bank.iloc[:,16]

# Use only quantitative predictors for now
Bank_quant_features = Bank[['age','balance','day',\
                        'duration','campaign', 'pdays','previous']]
Bank_quant_target = pd.DataFrame(data=Bank_target, columns=['y'])

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = \
    train_test_split(Bank_quant_features, Bank_target,\
                     test_size=0.2, random_state=237)

# Create a decision tree classifier
clf = DecisionTreeClassifier()

# Train the classifier on the training data
clf.fit(X_train, y_train)

# Make predictions on the testing data
y_pred = clf.predict(X_test)

# Evaluate the accuracy of the classifier
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)