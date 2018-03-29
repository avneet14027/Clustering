#Analysis of Various Clustering Algorithms in R

# KMeans Clustering in R

library(cluster)
library(tidyverse)
library(colorspace)
require(graphics)
require(utils)

#Dataset


df_diabetes <- PimaIndiansDiabetes
df_diabetes <- na.omit(df_diabetes)
head(df_diabetes)

df_diabetes_2 <- df_diabetes[,-9]
types <- df_diabetes[,9]
typesColumn <- rev(rainbow_hcl(2))[as.numeric(types)]

#Pairwise Scatter Plot
pairs(df_diabetes, col = typesColumn , lower.panel = NULL, cex.labels=2, pch=19, cex = 1.2)

Result <- df_diabetes_2[,dim(df_diabetes_2)[2]]
prediction <- df_diabetes_2[,1:(dim(df_diabetes_2)[2]-1)]

pca <- princomp(prediction, cor=T) 
pc.comp <- pca$scores
pc.comp1 <- -1*pc.comp[,1]
pc.comp2 <- -1*pc.comp[,2]

new <- cbind(pc.comp1, pc.comp2)
my_clusters <- kmeans(new,13)
my_clusters$cluster
my_clusters$centers
my_clusters$size

#Sum Of Squares Plot
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}
wssplot(prediction, nc=20) 
plot(pc.comp1, pc.comp2,col=cl$cluster)
points(cl$centers, pch=16)

library(cluster)
clusplot(prediction, my_clusters$cluster, main='Clusters',
         color=TRUE, shade=TRUE,
         labels=2, lines=0)

