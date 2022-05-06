stuff I learnt from https://docs.microsoft.com/en-gb/learn/modules/intro-machine-learning-pytorch/2-tensors


## Tensors
Tensors are a special data structure similar to arrays and matrices. used to encode inputs and outputs of a model.
They are similar to numpy ndarrays, but can be run on gpu. they can share the same memory location as ndarrays ( editing a np array will edit the tensor that shares the same mem location) tensors are optimized for automatic differentiation

####initializing a tensor
a tensor can be initialized 
- directly from data
- from a numpy array ( the np array and the tensor will share same memory location )
- from another tensor ( the new tensor will retain shape and data type unless overridden )
- random or constant values ( torch.ones(shape), torch.zeroes(shape), torch.rand(shape) )


*attributes*
- shape         - describes the shape of a tensor [3,2,5] [z,y,x]
- dtype         - describes the datatype of the values torch.float32, torch.int
- device        - which device the tensor uses cpu or cuda

*operations*
there are a lot of operations that can be performed on tensors. 
tensors are created for cpu by default and can be ported to run on gpu with tensor.to('cuda')

tensors support numpy like indexing
you can join multiple tensors with torch.cat([tensor, tensor], dim=1) the dimension gives which dimension to concatenate based on the tensor shape

arithmetic:
- matmul        - Matrix multiplication of a tensor
- mul           - just multiply values of two tensors

there are in place operations that directly edit the values of the operand without storing the previous state of data. 
These functions usually have a _ at the end e.g. tensor.add_(5)
these can save some memory but will be problematic if we are computing derivatives

*single element tensors*
these have only only value like if you aggregate an entire tensor or if you get a single element from a tensor


## Loading datasets into tensors
training code should be decoupled from the dataset code. There are two data primitives that pytorch gives us which can be used for easily loading and iterating the datasets

- torch.utils.data.Dataset             - Stores the samples and their labels(outputs) and allows us to load our data.
    params:
    - root           - the location of the data
    - train          - boolean which says if the data is for training or not
    - download       - boolean which mentions if the data needs to be downloaded from an online source
    - transform      - is a function which is carried out for each data set
    
- torch.utils.data.DataLoader          - is a wrapper around dataset which provides an iterable and takes care of chunking data and randomizing them for each epoch
    params:
    - data           - the training data that will be used ( usually a dataset )
    - batch_size     - the size of minibatch that the data will be split into
    - shuffle        - boolean to tell the dataloader to shuffle after each time the batches are over after training epoch



Datasets can be indexed like a list. so a simple for loop with index values can be used to plot and iterate

*preparing for training*
a Dataset retrieves our datasets features and labels one sample at a time. we will have to provide samples in small batches and shuffle the data each epoch. We need to specify what features and what labels are present. features are inputs and labels are outputs. Both will be tensors :) . the model will basically learn how to determine the label with the given features.

## Normalization

Before we start training a dataset it is better if we have all the inputs normalized. this basically means that all features contribute equally or as much as they are supposed to for the model. The data is applied to a scale or transformation function. 

Assume we have age as a feature and we have salary as a feature. If we just train a model with these two features, the model will give more priority to the salary and ignore the age because the literal numeric value of age is negligible when compared to salary. but in reality the model you are training could rely heavily on age instead of salary. So what is done in this case is that the salary and age are normalized to a value between 0 and 1. there are lots of functions to normalize data. 
**min max normalization** :
here the minimum of the data and the maximum of the data are taken and assigned to 0 and 1 respectively. any other data point that comes in will have a value between 0 and 1 with as much accuracy as is required.

we can also use our own lambda function for the normalization function. this depends on the model we are trying to train. ( in fact all of this stuff depends on that ).



### one hot encoding

This is a concept that is similar to normalization but for qualitative data or non numeric data. 
We take the entire list of qualitative data and split it into unique values. next step is to go through the data and club them into their group.

Lets say we have color data, that doesnt have a numerical value so we cannot put it in a tensor.
assume we have 5 data points on colors. and each of these fall under the category of 'red', 'green' or 'blue'
now our one hot encoded data points will look like thie

'red' | 'blue' | 'green'
1     | 0      | 0
1     | 0      | 0
0     | 1      | 0
0     | 0      | 1
0     | 1      | 0


here we can see how much each data point is actually affecting the model and skewing. So we do this in order to normalize qualitative data









