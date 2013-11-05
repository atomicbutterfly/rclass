outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character") #read outcome file
hospital <- read.csv("hospital-data.csv", colClasses = "character") #read hospital file

library(lattice)
outcome.hospital <- merge(outcome, hospital, by = "Provider.Number") #merge files

death <- as.numeric(outcome.hospital[, 11]) ## Heart attack outcome
npatient <- as.numeric(outcome.hospital[, 15])
owner <- factor(outcome.hospital$Hospital.Ownership)


#attach(outcome.hospital)
#can modify this code for use with SBUs
graphy<-xyplot(death~npatient | owner,
       main="Heart Attack 30-day Death Rate by Ownership",
       xlab="Number of Patients Seen",
       ylab="30-day Death Rate",
               panel=function(x,y){
                 panel.xyplot(x,y)
                 panel.lmline(x,y)
               }
      #panel.abline(lm(npatient~death))
               )
#demo(lattice)
print(graphy)