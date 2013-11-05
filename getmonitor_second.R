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

  		id <- as.numeric(c(id))
       
        
        directory <- as.character(directory)
        FileEnd<-".csv" 

             if (id < 10) {
            ThisFile <- sprintf("/directory/00%s.csv", id)   
            #ThisFile <-  paste("~/Documents/rclass/",directory,"/","00",id,FileEnd,sep = "")
            #FileName <-paste("00",id,FileEnd,sep = "")
            #read.csv(ThisFile)
            read.csv(sprintf("00%s.csv", id))
        }

            if (10 < id & id < 100) {
            ThisFile <-  paste("~/Documents/rclass/",directory,"/","0",id,FileEnd,sep = "")
            FileName <- paste("0",id,FileEnd,sep = "")
            read.csv(ThisFile)
        }

        else {

            ThisFile<- paste("~/Documents/rclass/",directory,"/",id,FileEnd,sep = "")
            FileName <-paste(id,FileEnd,sep = "")
            read.csv(ThisFile)
        }
		  
      
  		summarize <- c(TRUE, FALSE)
		 if (summarize == T) {
		   print(ThisFile)
           read.csv(ThisFile)
           print(summary(FileName))
		 }
	else {
    summarize == F

	}
} sprintf("Leading zeros:%04d", x)