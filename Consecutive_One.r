#Find consecutive number of ones 

consecutive_ones <- function(x,k) {     		 #Pass Vector as x and number of consecutive digits as k 
	count <- 0;									 #Count is initialized to 0 
	one_places = vector(length=length(x)) 		 #Initialize a vector 
	for ( i in (1:(length(x)-1))) {      		 #Loop through number of places
		if (all(x[i:(i+k)]==1))			 		 #Using all() find the nature of digits
			{
			count <- count + 1			 		 #Increase the count by 1
			one_places[count] <- i       		 #Add i to vector
			}
		}
	
	if(length(one_places) > 0)	                 #Delete the zero values in the return vector
	   one_places <- one_places[1:count]		 #Reassign the return vector 
	else
	   one_places <- NULL 						 #If the one_places is empty return Null
	return(one_places)   
}
	