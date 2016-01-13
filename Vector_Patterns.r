#Program 1 : Determine simultaneous change patters between two vectors without using lapply()
#Author    : Ajaykishan Gurusamy

#Initialize two vectors
x <- c(5,1,2,1,3,3,6,0,1,1,5,1,6,8,8,8)
y <- c(4,2,3,2,3,6,1,0,1,1,1,2,6,3,2)


findpattern <- function(vector1,vector2) {    
result_vector1 <- vector_variation(vector1)     # Invoke funtion vector_variation
result_vector2 <- vector_variation(vector2)
ifelse(length(result_vector1) == length(result_vector2),"Vector are of equal length","Vector are of different length, Last element of high-length vector is not considered") # Check the length of two resultant vectors
return(mean(result_vector1[]==result_vector2[])) # Calculate mean and display result
}

vector_variation <- function(vector1) {
result_vector <- vector(length = (length(vector1)-1)) #Length will be less one value during comparison of alternative elements in array
for (i in 1:(length(vector1)-1)) {                        
difference <- vector1[i+1] - vector1[i]               #Find difference
ifelse(difference > 0, result_vector[i] <- 1 , result_vector[i] <- -1 ) #Declare 1 if its a positive value and -1 if its a negative value
}
return(result_vector) #Return the result vector
} 

#Call the function with two vectors as arguments 
findpattern(x,y)