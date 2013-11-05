getmonitor <- function(id, directory, summarize = FALSE) {
        ## 'id' is a vector of length 1 indicating the monitor ID
        ## number. The user can specify 'id' as either an integer, a
        ## character, or a numeric.
     
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
       

        ## 'summarize' is a logical indicating whether a summary of
        ## the data should be printed to the console; the default is
        ## FALSE
        
        ## Your code here
        #source("http://spark-public.s3.amazonaws.com/compdata/scripts/getmonitor-test.R")
#getmonitor.testscript()
    
  		id <- as.integer(id)
       

        #directory <- as.character(directory)
        directory <- as.vector(directory)
        #FileEnd<-".csv" 

		
    #trying filepath instead
        ReadFile<- read.csv(file.path(directory,sprintf("%03d.csv",id)),header=TRUE)
        myfile <-(file.path(directory,sprintf("%03d.csv",id)))
        #ReadFile<-read.csv(data,header=TRUE)
  		
        summarize <- as.logical(summarize)
	

         if (summarize) {
          print(summary(ReadFile))

      

		 }

	else {
    
	   return(ReadFile)  
	}

          
} 