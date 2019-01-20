install.packages("party")
#include party
library(party)
str(iris)
head(iris)
#divide data into training and test
data<-sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3))
traindata<-iris[data==1,]
testdata<-iris[data==2,]
#ctree on traning dta
irisctree<-ctree(Species~Sepal.Length+Sepal.Width + Petal.Length + Petal.Width,data=traindata)
predictiris<-predict(irisctree,traindata,type="response")
#see the table
table(predictiris,traindata$Species)
mean(predictiris != traindata$Species) * 100
#predict the values
test_predict <- predict(irisctree, newdata= testdata,type="response")
table(test_predict, testdata$Species)
mean(test_predict != testdata$Species) * 100
print(irisctree)
plot(irisctree)
plot(irisctree, type="simple")
#see crosstable
library(gmodels)
CrossTable(x=predictiris,y=traindata$Species)
#96% of accuray