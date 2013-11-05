set.seed(31);
heightsCM = rnorm(30,mean=188, sd=5);
weightsK = rnorm(30,mean=84,sd=3); 
hasDaughter = sample(c(TRUE,FALSE),size=30,replace=T); 
dataFrame = data.frame(heightsCM,weightsK,hasDaughter); 

dataFrameSubset<-subset(dataFrame, dataFrame$heightsCM > 188)
mean<-mean(dataFrameSubset$weightsK)
mean

#numbers<- Cauchy(location = 1, scale = 1)
#r(C)(100)
set.seed(41)
#numbers<-rcauchy(1:100)
numvect<-c(rcauchy(1:100))
set.seed(415)
s.numvect<-sample(numvect,10,replace=TRUE)