Notes - 6-2-2022

What is ML/computer vision?

Computer vision is the umbrella term that includes anything that enables a computer to make decisions based on visionary/image/video input 

Machine Learning basically enables computer vision to take the decision based on some criteria



There are two types of machine learning techniques. 
  - supervised learning
  - unsupervised learning



Supervised learning:
    In supervised learning we basically have set of inputs and the expected outputs for that data. In essence we have the ground truth based on which our goal is to figure out a function that will produce the expected output which we already have
    tl;dr : We have both the input and the expected output before we train our model
    There are two categories under supervised learning;
      - classification
      - regression

Classification:
   Here the goal of the model is to label and bucket the given values based on a function we define
   eg: separating a class into tall, medium, short people and then predicting which category someone falls into

   there are two types of classification
    - linear classification
    - non-linear classification

    Linear classification:
        If the input can be classified based on a linear boundary then it is called a linear classifier. Basically a linear boundry is a line in 2 dimnesions, plane in 3 dimensions, and hyperplanes with more dimensions(features)
        Perceptron:
          A perceptron is a linear classifier that gives the output into either true or false based on a given activation function


    Non-Linear Classification:
        If the data cannot be classified with a simple linear boundary and a different boundary is required to classify stuff then its called a non linear classification. Here we will have to calculate if a data point falls into the boundary or not.




Regression:
  Here the goal is to get continuous values based on the given input
  eg: house value prediction. Basically you consider 4 parameters, 
    locality, size, amenities, price, for buying a house.
    now given locality size and amenities we have to find the price

  There are two types of regression
    - linear regression
    - non-linear regression


    Linear Regression:
        If the data can be fitted on a single line then it is linear regression.( what does this even mean??? ). Basically we have a bunch of data points which we plot on the graph. Based on these points we have to plot a line such that the distance between points is minimal.
        we find this distance by taking the y axis values. we take The value on your line(projected value) and the y value for any data point and subract them to get the distance/difference. This we then square so that the negative numbers dont get included
        errors = Sum 1-n ( y - y^ )**2

        which we call the sum of squared errors

        y: actual value
        y^: predicted value


        now our aim is to reduce this error value such that for any new data that we get ( x ) we can get a suitable value for y based on our model






        <<<<<<<<<<<<<<<<<<<<TO:DO derive the linear regression equation here>>>>>>>>>>>>>>>>>>>>>



in the classification case, we already know there are only three categories beforehand and hence it comes under classification. But in the real estate prediction we dont have any set group but are expected to find the value given the other params
  







Perceptron:
    A perceptron is a neural network with only one node. this node takes in n inputs and outputs either a true or false value based on something called the activation function.




Definitions:
  1. Loss Function:
        loss function is the difference in predicted output( could be classification or regression op? ) and the actual expected output
