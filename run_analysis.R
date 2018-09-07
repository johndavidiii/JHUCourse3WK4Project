#install.packages("XML")
#install.packages("methods")
#install.packages("plyr")
#install.packages("dplyr")
#install.packages("jpeg")
library(data.table)
library(xlsx)
library(XML)
library(methods)
library(dplyr)
library(jpeg)
#library(plyr)

# this program works the output data is what the professors wanted per their outline

# This is course three, week 4's project
# each text file is read in via the overall path.
# you will probably need to change the path to read the data
# I tried to make it as generic as possible
# the variables are self declaring and their are two output csv files on that has the melded total dataframe and the other
# that has the standard deviation and mean of each column of the melded total dataframe.

dataPath <- "your path here"             # don't forget the necessary backslashes
outputDataPath <- "your path here"

totalXTestFilePath <- paste(dataPath,"total_acc_x_test.txt",sep="")
totalYTestFilePath <- paste(dataPath, "total_acc_y_test.txt",sep="")
totalZTestFilePath <- paste(dataPath,"total_acc_z_test.txt",sep="")
totalXTestGyroFilePath <- paste(dataPath,"body_gyro_x_test.txt",sep="")
totalYTestGyroFilePath <- paste(dataPath,"body_gyro_y_test.txt",sep="")
totalZTestGyroFilePath <- paste(dataPath,"body_gyro_z_test.txt",sep="")

totalXTrainFilePath <- paste(dataPath,"total_acc_x_train.txt",sep="")
totalYTrainFilePath <- paste(dataPath,"total_acc_y_train.txt",sep="")
totalZTrainFilePath <- paste(dataPath,"total_acc_z_train.txt",sep="")
totalXTrainGyroFilePath <- paste(dataPath,"body_gyro_x_train.txt",sep="")
totalYTrainGyroFilePath <- paste(dataPath,"body_gyro_y_train.txt",sep="")
totalZTrainGyroFilePath <- paste(dataPath,"body_gyro_z_train.txt",sep="")

print("Reading and Processing Data")

xTestTable <- read.table(totalXTestFilePath,header=F,sep = "")
#xTestTable <- as.data.frame(read.delim(totalXTestFilePath, header = FALSE,sep = " ", dec = ".")) 
#print(head(xTestTable,2))
#print(str(xTestTable))
#xTestTable2 <- na.omit(xTestTable)
xNameAry <- c(names(xTestTable))
xNameAry <- gsub("V","x-Test-Person-", xNameAry)
#print("x name ary")
#print(xNameAry)
colnames(xTestTable) <- xNameAry
#print(head(xTestTable,2))

yTestTable <- read.table(totalYTestFilePath,header=F,sep = "")
#yTestTable <- as.data.frame(read.delim(totalYTestFilePath, header = FALSE,sep = " ", dec = ".")) 
#print(names(yTestTable))
yNameAry <- c(names(yTestTable))
yNameAry <- gsub("V", "y-Test-Person-", yNameAry)
#print("y name ary")
#print(yNameAry)
colnames(yTestTable) <- yNameAry
#print(head(yTestTable,2))


zTestTable <- read.table(totalZTestFilePath,header=F,sep = "")
zNameAry <- c(names(zTestTable))
zNameAry <- gsub("V", "z-Test-Person-", zNameAry)
colnames(zTestTable) <- zNameAry
#print(head(zTestTable,2))

#xGyroTable <- read.delim(totalXTestGyroFilePath, header = FALSE,sep = " ", dec = ".") 
xGyroDF <- read.table(totalXTestGyroFilePath,header=F,sep = "")
xGyroNameAry <- c(names(xGyroDF))
xGyroNameAry <- gsub("V", "x-Gryo-Person-", xGyroNameAry)
colnames(xGyroDF) <- xGyroNameAry
#print(head(xGyroDF,2))

#yGyroTable <- read.delim(totalYTestGyroFilePath, header = FALSE,sep = " ", dec = ".") 
yGyroDF <- read.table(totalYTestGyroFilePath,header=F,sep = "")
yGyroNameAry <- c(names(yGyroDF))
yGyroNameAry <- gsub("V", "y-Gyro-Person-", yGyroNameAry)
colnames(yGyroDF) <- yGyroNameAry
#print(head(yGyroDF,2))

#zGyroTable <- read.delim(totalZTestGyroFilePath, header = FALSE,sep = " ", dec = ".") 
zGyroDF <- read.table(totalZTestGyroFilePath,header=F,sep = "")
zGyroNameAry <- c(names(zGyroDF))
zGyroNameAry <- gsub("V", "z-Gyro-Person-", zGyroNameAry)
colnames(zGyroDF) <- zGyroNameAry
#print(head(zGyroDF,2))


#xTrainTable <- read.delim(totalXTrainFilePath, header = FALSE,sep = " ", dec = ".") 
xTrainTable2 <- read.table(totalXTrainFilePath,header=F,sep = "")
xTrainNameAry <- c(names(xTrainTable2))
xTrainTable <- data.frame(xTrainTable2[1:2947,xTrainNameAry])
xTrainNameAry <- gsub("V", "x-Train-Person-", xTrainNameAry)
colnames(xTrainTable) <- xTrainNameAry
#print(head(xTrainTable,2))

#yTrainTable <- read.delim(totalYTrainFilePath, header = FALSE,sep = " ", dec = ".") 
yTrainTable2 <- read.table(totalYTrainFilePath,header=F,sep = "")
yTrainNameAry <- c(names(yTrainTable2))
yTrainTable <- data.frame(yTrainTable2[1:2947,yTrainNameAry])
yTrainNameAry <- gsub("V", "y-Train-Person-", yTrainNameAry)
colnames(yTrainTable) <- yTrainNameAry
#print(head(yTrainTable,2))

#zTrainTable <- read.delim(totalZTrainFilePath, header = FALSE,sep = " ", dec = ".") 
zTrainTable2 <- read.table(totalZTrainFilePath,header=F,sep = "")
zTrainNameAry <- c(names(zTrainTable2))
zTrainTable <- data.frame(zTrainTable2[1:2947,zTrainNameAry])
zTrainNameAry <- gsub("V", "z-Train-Person-", zTrainNameAry)
colnames(zTrainTable) <- zTrainNameAry
#print(head(zTrainTable,2))

#xTrainGyroTable <- read.delim(totalXTrainGyroFilePath, header = FALSE,sep = " ", dec = ".") 
xTrainGyroTable2 <- read.table(totalXTrainGyroFilePath,header=F,sep = "")
xTrainNameAry <- c(names(xTrainGyroTable2))
xTrainGyroTable <- data.frame(xTrainGyroTable2[1:2947,xTrainNameAry])
xTrainNameAry <- gsub("V", "x-Train-Gyro-Person-", xTrainNameAry)
colnames(xTrainGyroTable) <- xTrainNameAry
#print(head(xTrainGyroTable,2))

#yTrainGyroTable <- read.delim(totalYTrainGyroFilePath, header = FALSE,sep = " ", dec = ".") 
yTrainGyroTable2 <- read.table(totalYTrainGyroFilePath,header=F,sep = "")
yTrainNameAry <- c(names(yTrainGyroTable2))
yTrainGyroTable <- data.frame(yTrainGyroTable2[1:2947,yTrainNameAry])
yTrainNameAry <- gsub("V", "y-Train-Gyro-Person-", yTrainNameAry)
colnames(yTrainGyroTable) <- yTrainNameAry
#print(head(yTrainGyroTable,2))

#zTrainGyroTable <- read.delim(totalZTrainGyroFilePath, header = FALSE,sep = " ", dec = ".")
zTrainGyroTable2 <- read.table(totalZTrainGyroFilePath,header=F,sep = "")
zTrainNameAry <- c(names(zTrainGyroTable2))
zTrainGyroTable <- data.frame(zTrainGyroTable2[1:2947,zTrainNameAry])
zTrainNameAry <- gsub("V", "z-Train-Gyro-Person-", zTrainNameAry)
colnames(zTrainGyroTable) <- zTrainNameAry
#print(head(zTrainGyroTable,2))

print(nrow(xTestTable))

print("building final DF")
meldedDF <- data.frame(xTestTable,yTestTable,zTestTable,xGyroDF,yGyroDF,zGyroDF,xTrainTable,yTrainTable,zTrainTable,xTrainGyroTable,yTrainGyroTable,zTrainGyroTable)

#write the total DataFrame to a csv file

totalOutpututputDFDataPath <- paste(outputDataPath,"course3_wk4_project_DF_output.csv",sep="")

write.csv(meldedDF, totalOutpuDFtDataPath)
#write.csv(meldedDF,"course3_wk4_project_DF_output.csv")

stdAry1 <- apply(meldedDF,2,sd)
meanAry1 <- apply(meldedDF,2,mean)

statsDF <- data.frame(stdAry1,meanAry1)
colnames(statsDF) <- c("std","mean")
rowNameAry1 <- c(row.names(statsDF))
rowNameAry1 <- gsub("x.Test.Person.", "Test-Person-",rowNameAry1)
rownames(statsDF) <- rowNameAry1
print(head(statsDF1))

totalOutputStatsDataPath = paste(outputDataPath, "course3_wk4_project_stats_output.csv",sep="")
write.csv(statsDF,totalOutputStatsDataPath)

#write.csv(statsDF,"course3_wk4_project_stats_output.csv")
