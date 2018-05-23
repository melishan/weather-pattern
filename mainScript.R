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


#using apply()
?apply
Chicago
apply(Chicago, 1, mean) #1 means function applied to rows
mean(Chicago["AvgHigh_F",])

#analyze one city
Chicago
apply(Chicago, 1, max)
apply(Chicago, 1, min)

#Compare
apply(Chicago, 1, mean)
apply(Houston, 1, mean)
apply(NewYork, 1, mean)
(apply(SanFrancisco, 1, mean))
is.data.frame(apply(SanFrancisco, 1, mean))

#Recreating the apply function with loops (advanced topic)
#find the mean of every row:

output <- NULL #preparing an empty vector
#find mean of every row with "for" loop
for(i in 1:nrow(Chicago)) {
 output[i] <- mean(Chicago[i,])
}
output

#check
mean(Chicago["AvgHigh_F",])
names(output) <- rownames(Chicago)
output

#find mean of every row with "apply" function
apply(Chicago, 1, mean)

#lapply function applied to only list or vector
t(Chicago) # t means transpoze
Weather
lapply(Weather, t) #list(t(Weather$Chicago), t(Weather$NewYork), t(Weather$houston), t(Weather$SanFrancisco))
Weather_t <- lapply(Weather, t)

#example 1
Chicago
rbind(Chicago, newRow=1:12)
lapply(Weather, rbind, NewRow=1:12) #lapply returns a list 

#example 2
?rowMeans
rowMeans(Chicago)
lapply(Weather, rowMeans) #returns of means of list components

#no need to use seperate apply functions to add a new row which give mean of components
#lapply is used for this

#rowMeans
#colMeans
#rowSums
#colSums
