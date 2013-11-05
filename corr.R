corr <- function(directory,threshold = 0) {
	
 ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations


directory<-as.character(directory)

threshold<-numeric(threshold)
correlation<-numeric(0)

rowcount<-numeric(0)

#nitrate<-as.data.frame(0)
#sulfate<-as.data.frame(0)


source("complete.R")

id<- 1:332

      
 
 for (i in id) {  #loops through the vector of files between 1-332, so all files
			
			thisfile<-getmonitor(i, directory,summarize = FALSE)
  
  			#returns the *number* of complete observations
  			rowcount<-nrow(na.omit(thisfile))

  			#in order to calculate corr we need a DF with two cols for N and S from an NA removed file.
  			NaRremoved <-na.omit(thisfile)

  			if (rowcount > threshold) {


  			#test corelation on cleaned up N nows and S rows	

  			#nitrate<-NaRremoved["nitrate"] #currently returning a column, try turning column values into vector
  			#sulfate<-NaRremoved["sulfate"]
  			#nsdf<-data.frame(sulfate,nitrate)
			
			#testcorrelation<-cor.test(nitrate,sulfate, method="spearman")

			testcorrelation<-cor(NaRremoved["nitrate"], NaRremoved["sulfate"], method = c("pearson", "kendall", "spearman")) 
  			correlation<-c(correlation, testcorrelation)


			#try first omitting the NA values, putting new values into a dataframe
			#then pulling the column names from that to create a new DF of just N and S. 
			#but do we need to do this? can we not subset the values of N and S from the exsisting DF assign it a name
			#and run cor R on that?

  			} #end if


} #end of loop function

  				
  				return(correlation)
  			

  


}