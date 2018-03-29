# Clustering Algorithms - KMeans
In this, I have made an attempt to understand and use KMeans clustering algorithm in R.

#### KMeans Algorithm
First, let us see, how the KMeans algorithm works. <br>
K-means is kind of an unsuervised learning algorithm. This means, that the output labels are not known for a given data.
The model that we train is supposed to learn from the input data we provide to it.
The goal of this algorithm is to find K clusters within the dataset such that the within cluster similarity score is
maximized and the between cluster similarity score (between any 2 arbitrary clusters) is minimized.
This algorithm is an iterative algorithm where each data point is assigned to a cluster according to some criteria.
The number of iterations are dependent of the sum of squared errors. When the sum of squared errors between different clusters is minimized, the 
algorithm stops to run. Alternatively we can also limit the number iterations by providing an upper limit to the algoritm.
<br>
The algorithm follows an iterative approach mainly divided into two steps:
* Assigning labels to cluster centres
* Updating cluster centres
<br>
Initially, random cluster centres are assigned. Then the distance of each data point from each cluster centre is computed
and then the data point is assigned to that cluster centre whose distance is minimum. The distance can be calculated in
terms of euclidean distance, manhattan distance, cosine distance and many others. Further, the mean of all indicidual clusters
is then computed and then the mean of each cluster becomes the cluster centre. The algorithm progresses iteratively
until the sum of squared errors is minimized.



#### Dataset Used
Pima Indians Diabetes dataset from R, consisting of various factors attributed to diabetes
* Description: Predict the onset of diabetes in female Pima Indians from medical record data
* Type: Binary Classification
* Dimensions: 768 instances, 9 attributes
* Inputs: Numeric
* Output: Categorical, 2 class labels

#### Importing the dataset
```R
#Dataset
#Pima Indians Diabetes 

df_diabetes <- PimaIndiansDiabetes
df_diabetes <- na.omit(df_diabetes)
head(df_diabetes)

df_diabetes_2 <- df_diabetes[,-9]
types <- df_diabetes[,9]
typesColumn <- rev(rainbow_hcl(2))[as.numeric(types)]

```

#### Pairwise Scatter Plot to analyse various features leading to diabetes
```R
```
