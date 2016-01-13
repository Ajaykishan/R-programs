# Retrieve an Image file from Disk and Blur it
# Author: Ajaykishan Gurusamy

source("http://bioconductor.org/biocLite.R") #Install a New package
biocLite("EBImage")  
library(EBImage)                             #Include Library, Contains many Image Manipulation functions - Highly Useful
Image <- readImage('F:\\photo.jpg')		     #Read Image present in Local Directory	
display(Image)								 #Display Image
display(gblur(Image,sigma=8))				 #Blur Image
