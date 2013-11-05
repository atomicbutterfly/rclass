
#Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. 
#The function should return a data frame where the first column is the name 
#of the file and the second column is the number of complete cases. A prototype of this function follows
#here is where I apply one of the apply functions since i need it to loop trough all the files and perform the same action on each

complete <- function(directory, id = 1:332) {
  
  ## it would be very helpful to have our getmonitor function 
  ## so write some code that will load that function 
  ## add some code that will load getmonitor.R  
 
source("getmonitor.R")
  
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

      
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        #id <- as.integer(id)
        nobs<- numeric(0)
      
        
  for (i in id) { 
thisfile<-getmonitor(i, directory,summarize = FALSE)
  
  #good<-na.omit(results)
  #counts the number or rows, minus the ones with NA values, add this to vector nobs
  nobs<-c(nobs,nrow(na.omit(thisfile)))

  #nobs<-sum(complete.cases(results))
  
                }

        ## Return a data frame of the form:for


        dfoutput = data.frame(id=id, nobs=nobs) 
        return(dfoutput)
  #dfoutput

        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
}
