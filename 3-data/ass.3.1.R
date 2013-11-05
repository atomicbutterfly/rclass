outcome<-read.csv("outcome-of-care-measures.csv", colClasses= "character")
outcome[,11]<-as.numeric(outcome[,11])
outcome[,17]<-as.numeric(outcome[,17])
outcome[,23]<-as.numeric(outcome[,23])
par(mfrow=c(1,3))
#abline(h=, untf = FALSE, ...)

#get high and lowest values of the above columns, but exclude NAS
datarange<-range(na.omit(outcome[,23]),na.omit(outcome[,11]),na.omit(outcome[,17]))

hist(outcome[,11],main=substitute(m (bar(x) == k), list(m="Heart Attack",k=mean(na.omit(outcome[,11])))), xlab="30 Day Death Rate",xlim=c(datarange))
abline(v=median(outcome[,11], na.rm = TRUE))

#heartfailure
hist(outcome[,17],main=substitute(m (bar(x) == k), list(m="Heart Failure", k=mean(na.omit(outcome[,17])))),xlab="30 Day Death Rate",xlim=c(datarange))
abline(v=median(outcome[,17], na.rm = TRUE))

#pnuemonia
hist(outcome[,23],main=substitute(m (bar(x) == k),list(m="Pnumonia", k=mean(na.omit(outcome[,23])))),xlab="30 Day Death Rate", xlim=c(datarange))
abline(v=median(outcome[,23], na.rm = TRUE))