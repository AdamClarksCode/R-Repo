library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
setwd("C:/Users/Administrator/Documents/r/Salary_data")
CensusData <- read.csv("censusData_train.csv", header<-F, stringsAsFactors=F) 
names(CensusData) = c("Age", "Workclass", "FinalWeight", "Education", 
                      "EducationNum", "MaritalStatus", 
                      "Occupation", "Relationship", "Race", "Sex",
                      "CapitalGain", "CapitalLoss", "HoursPerWeek",
                      "NativeCountry", "Salary")
CensusData$CapitalGain[CensusData$CapitalGain < 5119] <- 0
CensusData$CapitalGain[CensusData$CapitalGain >= 5119] <- 1
fit <- rpart(Salary ~ CapitalGain + Education + CapitalLoss, data=CensusData, method='class')
fancyRpartPlot(fit)
