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
#lapply can be used for this to get improved results.

#rowMeans
#colMeans
#rowSums
#colSums

#Combining lapply with the [] operator
Weather
Weather[[1]][1,1]
Weather$Chicago[1,1]
?lapply


lapply(Weather, "[", 1, 1) #"[" refers to the second brackets to take col and row names.
lapply(Weather, "[", 1, )
lapply(Weather, "[", , 2)
lapply(Weather, "[", 1, 3)
#Adding my own functions
lapply(Weather, rowMeans) #rowMeans get average of rows
lapply(Weather, function(x) x[1,])
lapply(Weather, function(x) x[5,])
lapply(Weather, function(x) x[,12])
lapply(Weather, function(x) x[,12])

Weather
lapply(Weather, function(y) y[1,]-y[2,])
lapply(Weather, function(y) round((y[1,]-y[2,])/y[2,],2)) #round function is for to adjust decimal points

#using sapply
#it is simplier version of lapply 
Weather
#AvgHigh_F for July:
lapply(Weather, "[", 1, 7) #bracket is to extract something from the list - the result also returns a list.
a <- sapply(Weather, "[", 1, 7) #the result returns 
is.matrix((sapply(Weather, "[", 1, 7)))
#AvgHigh_F for 4th quarter:
lapply(Weather, "[", 1, 10:12)
(sapply(Weather, "[", 1, 10:12))
is.matrix((sapply(Weather, "[", 1, 10:12)))
lapply(Weather, rowMeans)
sapply(Weather, rowMeans)
round(sapply(Weather, rowMeans), 2)
?rowMeans

#another example:
lapply(Weather, function(z) round((z[1,]-z[2,])/z[2,],2))
sapply(Weather, function(z) round((z[1,]-z[2,])/z[2,],2))

#sapply trick
sapply(Weather, rowMeans, simplify = FALSE) #same as apply

#Nesting Apply Functions
Weather
lapply(Weather, rowMeans)
?rowMeans
#how can we look at maximum in rows?
Chicago
apply(Chicago, 1, max)
#apply across whole list
lapply(Weather, apply, 1, max) #lapply iterate over through Weather list it will pass those matrices to 
#apply one by one and apply take the matrix to get maximum of every single row.
lapply(Weather, function(x) apply(x, 1, max)) #the same result but not preferred
#tidy up
sapply(Weather, apply, 1, max)
sapply(Weather, apply, 1, min)

#which.max
?which.max
which.max(Chicago[1,]) 
names(which.max(Chicago[1,]))

#we will have apply - to iterate over rows of the matrices
#and we will have lapply or sapply - to iterate over components of the list
apply(Chicago, 1, function(x) names(which.max(x)))
lapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))
sapply(Weather, function(y) apply(y, 1, function(x) names(which.max(x))))




