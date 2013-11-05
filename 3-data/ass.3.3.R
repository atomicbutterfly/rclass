ououtcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])
outcome[,17]<-as.numeric(outcome[,17])
outcome[,23]<-as.numeric(outcome[,23])


#counts the number of rows with each state
table(outcome$State) 

StateNames<-c("AK","AL","AR","AZ","CA","CO","CT","DC","DE","FL","GA","GU","HI","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","PR","RI","SC","SD","TN","TX","UT","VA","VI","VT","WA","WI","WV","WY")

#sums number of hospitals by state
sth<-table(outcome$State)
# picks states that have over 20 hospitals
sth20<-subset(sth, sth>=20)
# with this code, you get a vector of names (in this case states with > 20 hospitals)
sth20nm<-names(sth20)
# this code subsets from all data (ocm), by column State (ocm$State), picking only this states that have > 20 hospitals
outcome2<-subset(outcome, outcome$State %in% sth20nm)

#calculate box plot of death rates
death <- outcome2[, 11]
state <- outcome2$State
par(las = 2) #sets labels perpendicular to x and y axis.
boxplot(death ~ state, ylab="30 Day Death Rate", main="Heart Attack 30-day Death Rate by State")

##for (i in StateNames) {

#set empty vector for value of death rate
##DeathValues<-c(0)
#outcome$State = i 
#need to correlate to death value >  outcome[,11]

# using subset function 
##rowsIneed<- subset(outcome2, State =i, select=c(State, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))

#add death values to vector
##DeathValues<-c(mean, colSums(outcome2[which(outcome2$State==i),11]))
##}
##meandeath<-mean(DeathValues)
#ordered.state<-names(median.death)[order(median.death)]state.idx<-function(x){data.frame(death=death[which(state==ordered.state[x])], state=state[which(state==ordered.state[x])])}

#how about modifying count code?
##sth<-table(outcome$State) #needed to calc mean, but not needed to be repeated
##calcMean<-subset(sth, sth>=20) #returns number of conts above 20. what i need is value of cells from the row that contains satte

test<-outcome2[outcome[, 11] %in% StateNames]#returns d.f of row numbers, not values, need to subset the data according to this data
#typeof(test)returns results in list format.
###calc.mean<-lapply(test,mean)
test2<-as.vector(as.matrix(test)) #turns test into vector or row numbers

deathbystate<-c(0)
nameofstate<-c()
for (i in test2) {
  
  deathbystate<-c(deathbystate,outcome2[i,11] ) #returns vector of values for that row number
  nameofstate<-c(nameofstate,outcome2[i,State]) #returns vector of state names for that row
}

newOrder<-data.frame(nameofstate,deathbystate) #creates a dataframe
