require("datasets")
data("iris") # load Iris Dataset
str(iris) #view structure of dataset
summary(iris)
head(iris) 
iris.new<- iris[,c(1,2,3,4)]
iris.class<- iris[,"Species"]
head(iris.new)
head(iris.class)
normalize <- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}

iris.new$Sepal.Length<- normalize(iris.new$Sepal.Length)
iris.new$Sepal.Width<- normalize(iris.new$Sepal.Width)
iris.new$Petal.Length<- normalize(iris.new$Petal.Length)
iris.new$Petal.Width<- normalize(iris.new$Petal.Width)
head(iris.new)
result<- kmeans(iris.new,3) #aplly k-means algorithm with no. of centroids(k)=3
result$size 
result$centers
result$cluster
library(animation)
resul1<-kmeans.ani(iris.new,3)
table(result$cluster,iris.class)

