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

  		id <- c(1:1)
        
        directory <- as.character(directory)
        FileEnd<-".csv" 
		    ThisFile<- paste("~/Documents/rclass/",directory,"/",id,FileEnd,sep = "") 
		    read.csv(ThisFile)
      
  		summarize <- c(TRUE, FALSE)
		 if (summarize == T) {
		   print(summary(paste(id,FileEnd,sep = "")))
		 }
	else {
    summarize == F

	}
}