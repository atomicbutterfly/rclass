outcome<-read.csv("outcome-of-care-measures.csv", colClasses= "character")
outcome[,11]<-as.numeric(outcome[,11])
outcome[,17]<-as.numeric(outcome[,17])
outcome[,23]<-as.numeric(outcome[,23])
par(mfrow=c(1,3))
#abline(h=, untf = FALSE, ...)

#get high and lowest values of the above columns, but exclude NAS
datarange<-range(na.omit(outcome[,23]),na.omit(outcome[,11]),na.omit(outcome[,17]))

#hartattacks
x1<-median(outcome[,11], na.rm = TRUE)
hist(outcome[,11],main=expression(paste(bar(x),substitute(median(outcome[,11],),"Heart Attack",sep = " "))), xlab="30 Day Death Rate",xlim=c(datarange))
abline(v=median(outcome[,11], na.rm = TRUE))
#hartfailure

x2<- median(outcome[,17], na.rm = TRUE)
hist(outcome[,17],main=(sprintf("(%s=%.2f) Heart Failure",expression(bar(x)),x2)),xlab="30 Day Death Rate",xlim=c(datarange))
abline(v=median(outcome[,17], na.rm = TRUE))

#pnuemoniamedian(outcome[,11]) 
hist(outcome[,23],main=substitute(bar(x) == k, list(k=median(outcome[,23], na.rm = TRUE))),xlab="30 Day Death Rate", xlim=c(datarange))
abline(v=median(outcome[,23], na.rm = TRUE))