#importdataset
concrete <- read.csv(file.choose())
View(concrete)
str(concrete)
summary(concrete)
attach(concrete)

#normalize data
normalize<-function(x){
  return ( (x-min(x))/(max(x)-min(x)))
}
concrete_norm<-as.data.frame(lapply(concrete,FUN=normalize))
summary(concrete_norm$strength)
View(concrete_norm$strength)

#divide the data
concrete_train<-concrete_norm[1:773,]
concrete_test<-concrete_norm[774:1030,]

#apply neural net,plot,cor
library(neuralnet)
names(concrete_train)
concrete_model<-neuralnet(strength~cement+slag+ash+water+superplastic+coarseagg+fineagg+age,data = concrete_train)
plot(concrete_model)

#compute
model_result<-compute(concrete_model,concrete_test[1:8])
model_result
#predict 
predict_model1<-model_result$net.result
#correlation 
cor(predict_model1,concrete_test$strength)

#appply neural net with hidden layer to increese the specification
concrete_model4<-neuralnet(strength~cement+slag+ash+water+superplastic+coarseagg+fineagg+age,data = concrete_train,hidden = 2)
#plot
plot(concrete_model4)
#compute
model_result2<-compute(concrete_model4,concrete_test[1:8])
predict_model2<-model_result2$net.result
#correlation
cor(predict_model2,concrete_test$strength)
