
# Reading, perform data manipulation with CSV files
# Author: Ajaykishan Gurusamy	

############################################################################################################################
#
#  This program involves analysing data of Olympic Athletes from 2000 to 2012. The data-set includes information like
#  Athletes name, nationality, age, medals won, Year participated and name of sport. Program mines data based on level
#  of granularity specifies by the user which allows the maximum of four different categories namely year,sport,age and 
#  nationality.
#  
############################################################################################################################


Granularity <- as.integer(readline(prompt="Enter the Level of Granularity: "))
types <- vector(mode="list",length=Granularity)
typesnames <- unlist(strsplit(as.character(readline(prompt="Enter the column names separated by comma: ")),","))
names(types) <- c(typesnames)

readGranularity <- function(typesnames)
{ 
  for( i in 1:Granularity)
  {  
  typedata <- as.character(readline(prompt=(sprintf("Enter the value of %s",typesnames[i]))))
  types[[i]] <<- typedata
  }  
}

readGranularity(typesnames)

datafromcsv <- read.csv("F:\\OlympicAthletes.csv",header=T, sep=",",as.is=T) #Read from CSV file, olyfromcsv is List
distinctsport <- levels(factor(datafromcsv[[6]]))
distinctyear <- levels(factor(datafromcsv[[4]]))
distinctcountry <- levels(factor(datafromcsv[[3]]))
distinctage <- levels(factor(datafromcsv[[2]]))
positionInCSV <- list(age=2,country=3,year=4,sport=6)

classifyByType <- function(basedata,distinctType,positionInBaseData,nameOfNewData) {

	for (i in 1:length(distinctType)){
	assign(paste(nameOfNewData, value=distinctType[i], sep=""),basedata[which(basedata[[positionInBaseData]] == distinctType[i]),], envir = .GlobalEnv)
    			 					}
}

classifyByType(datafromcsv,distinctyear,4,"year")
classifyByType(datafromcsv,distinctcountry,3,"country")
classifyByType(datafromcsv,distinctsport,6,"sport")
classifyByType(datafromcsv,distinctage,2,"age")

process <- function()
{ 
   for (i in 1:(Granularity-1)) 
   {   
	if(i == 1) 	
		argument1 <- get(gsub(" ","", paste(typesnames[i],types[[i]])))
	else    
		argument1 <- get(gsub(" ","", paste("Result",argument2)))		
		
 	argument2 <- types[[i+1]]
	argument3 <- as.numeric(positionInCSV[[typesnames[i+1]]])
	classifyByType(argument1,argument2,argument3,"Result")
	}  
}
process()
