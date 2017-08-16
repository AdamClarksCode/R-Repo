library(rpart)
#install.packages(('rattle'))
#install.packages('rpart.plot')
#install.packages('RColorBrewer')
library(rattle)
library(rpart.plot)
library(RColorBrewer)
setwd("C:/Users/Administrator/Documents/r/Salary_data")
CensusData <- read.csv("censusData_train.csv", header<-F, names = c("Age", "Workclass", "FinalWeight", "Education", 
                                                                    "Education", "EducationNum", "MaritalStatus", 
                                                                    "Occupation", "Relationship", "Race", "Sex",
                                                                    "CapitalGain", "CapitalLoss", "HoursPerWeek",
                                                                    "NatuveCountry", "Salary"))
toGet <- "Private"
PrivateWorkers <- subset(CensusData, Workclass == " Private")
fit <- rpart(Salary ~ Education + EducationNum + Age, data=PrivateWorkers, method='class')
print(PrivateWorkers)