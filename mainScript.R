getwd()
setwd("/Users/melis/Desktop/R/weatherPattern/weather-pattern/Weather Data")

#short way to access to subfolders 
#setwd("./Weather Data") Mac
#setwd(".\\Weather Data") Windows

#Read Data
Chicago <- read.csv("Chicago-F.csv", row.names =1) #take the row names from first column
NewYork <- read.csv("NewYork-F.csv", row.names =1)
Houston <- read.csv("Houston-F.csv", row.names =1)
SanFrancisco <- read.csv("SanFrancisco-F.csv", row.names =1)

#Check
NewYork
Houston
SanFrancisco
Chicago
#is it data frame?
is.data.frame(Chicago)

#convert dataframes to matrices:
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

#is it matrix?
is.matrix(Chicago)

#Put all of these into a list
Weather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco) 
Weather

Weather[[1]][4]
Weather[[2]] #this is matrix as well
Weather[2] #this is a list with header
Weather$NewYork #this is a matrix