best <- function(state, OutCome) {
  ## Read outcome data
  outcome<-read.csv("outcome-of-care-measures.csv",colClasses = "character", na.strings="Not Available") 
  ## Check that state and outcome are valid 
state<-as.character(state)
OutCome<-as.character(OutCome)
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  #set searches for rows where column state= our inputed value
  y<-outcome$State==state 

  #subsets data to only include rows where state = our value
  outcome2<-subset(outcome, y) 

  #now we can do some calculations on this df...but we need to define the entered outcome terms
  if (OutCome=="heart attack"){
    #print("Heart..attack")  ##tests if case working
    #set column to be 11
    outcome2[, 11]<-as.numeric(outcome2$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    sortdata <-outcome2[order(outcome2[, 11],outcome2[,2],na.last=TRUE),]   
    sortdata[1,2]
    }
  
  
  else if (OutCome=="heart failure"){ 
    #print("Heart..failure") ##tests if case working
    outcome2[,17]<-as.numeric(outcome2[,17])
    sortdata <-outcome2[order(outcome2[, 17],outcome2[,2],na.last=TRUE),]   
    sortdata[1,2]
   }
  
  else if (OutCome=="pneumonia"){
    #print("deathly..sneezes") ##tests if case working
    outcome2[,23]<-as.numeric(outcome2[,23])
    sortdata <-outcome2[order(outcome2[, 23],outcome2[,2],na.last=TRUE),] 
    sortdata[1,2]
    }
  
  
  ##end if 
  #in case of differnt entered data...give guidence.
  else if (OutCome!="pneumonia" && OutCome!="heart failure" && OutCome!="heart attack"){print("Please enter one of the following outcomes: heart attack, heart failure, pneumonia")}
 
}