# Hierachical Clustering in R

df <- dist(as.matrix(mtcars))
na.omit(df)
hc <- hclust(df)   
plot(hc)

