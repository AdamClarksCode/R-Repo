library(rpart)
library(rattle)
library(rpart.plot)
library(RColorBrewer)
library(ggplot2)
library(randomForest)
setwd("C:/Users/Administrator/Documents/r/")
TrainData <- read.csv("train.csv", header<-T, stringsAsFactors=T)
TestData <- read.csv("test.csv", header<-T, stringsAsFactors=T)
TestData$MSSubClass <- as.factor(TestData$MSSubClass)
fit1 <- rpart(SalePrice ~ MSZoning + MSSubClass + LotArea
                , data=TestData, method='class', minsplit = 2, cp = 0.001)
fancyRpartPlot(fit1)
TestData$FireplaceQu[TestData$FireplaceQu == "NA"] <- "None"
TestData$PoolQc[TestData$PoolQc == "NA"] <- "None"
TestData$Fence[TestData$Fence == "NA"] <- "None"
TestData$MiscFeature[TestData$MiscFeature == "NA"] <- "None"
TestData$BsmtCond[TestData$BsmtCond == "NA"] <- "None"
TestData$BsmtFinType1[TestData$BsmtFinType1 == "NA"] <- "None"
TestData$MasVnrArea[TestData$MasVnrArea == "NA"] <- 0
TestData$GarageType[TestData$GarageType == "NA"] <- "None"
TestData$GarageFinish[TestData$GarageFinish == "NA"] <- "None"
TestData$GarageCond[TestData$GarageCond == "NA"] <- "None"
TestData$LotFrontage[TestData$LotFrontage == "NA"] <- 0
TestData$Alley[TestData$Alley == "NA"] <- "None"
TestData$MasVnrType[TestData$MasVnrType == "NA"] <- "None"
TestData$BsmtQual[TestData$BsmtQual == "NA"] <- "None"
TestData$BsmtExposure[TestData$BsmtExposure == "NA"] <- "None"
TestData$BsmtFinType2[TestData$BsmtFinType2 == "NA"] <- "None"
TestData$Electrical[TestData$Electrical == "NA"] <- "None"
TestData$GarageYrBlt[TestData$GarageYrBlt == "NA"] <- 0
TestData$GarageQual[TestData$GarageQual == "NA"] <- "None"
fit <- randomForest(SalePrice ~  LotArea + Neighborhood + OverallQual
                    + FullBath,
                    data=TestData, importance=T, ntree=2000)
fit1 <- rpart(SalePrice ~ LotArea + Neighborhood + OverallQual + FullBath
                , data=TrainData, method='class', minsplit = 2, cp = 0.001)
Prediction <- predict(fit1, data=TestData, type='class')
fit2 <- rpart(SalePrice ~ MSZoning + MSSubClass + LotArea + Neighborhood + OverallQual
              +                     + OverallCond + BedroomAbvGr + FullBath + HalfBath + Utilities
              , data=TrainData, method='class', minsplit = 2, cp = 0.001)
Prediction <- predict(fit2, data=TestData, type='class')
fit3 <- rpart(SalePrice ~ MSSubClass + MSZoning + LotFrontage + LotArea
              + Street + Alley + LotShape + LandContour + Utilities + LotConfig
              + LandSlope + Neighborhood + Condition1 + Condition2 + BldgType
              + HouseStyle + OverallQual + OverallCond + YearBuilt + YearRemodAdd
              + RoofStyle + RoofMatl + Exterior1st + Exterior2nd + MasVnrType + MasVnrArea
              + ExterQual + ExterCond + Foundation + BsmtQual + BsmtCond + BsmtExposure
              + BsmtFinType1 + BsmtFinSF1 + BsmtFinType2 + BsmtFinSF2 + BsmtUnfSF + TotalBsmtSF
              + Heating + HeatingQC + CentralAir + Electrical + LowQualFinSF
              + BsmtFullBath + BsmtHalfBath + FullBath + HalfBath + BedroomAbvGr
              + KitchenQual + TotRmsAbvGrd + Functional + Fireplaces + FireplaceQu
              + GarageYrBlt + GarageFinish + GarageCars + GarageArea + GarageQual
              + PavedDrive + WoodDeckSF + OpenPorchSF + EnclosedPorch
              + PoolArea + PoolQC + Fence + MiscFeature + MiscVal + MoSold + YrSold + SaleType + SaleCondition,
              data=TrainData, method='class', minsplit = 2, cp = 0.001)
Prediction <- predict(fit3, data=TestData, type='class')
fit4 <- rpart(SalePrice ~ LotArea
              , data=TrainData, method='class', minsplit = 2, cp = 0.001)
Prediction <- predict(fit4, data=TestData, type='class')
TrainData <- subset(TrainData, select = -c(Utilities, RoofMatl, MasVnrArea, BsmtFinSF1, BsmtFinSF2, BsmtUnfSF, Heating, LowQualFinSF,
                                           BsmtFullBath, BsmtHalfBath, Functional, GarageYrBlt, GarageArea, GarageCond, WoodDeckSF,
                                           OpenPorchSF, EnclosedPorch, X3SsnPorch, ScreenPorch, PoolArea, PoolQC, Fence, MiscFeature, MiscVal))
TestData <- subset(TestData, select = -c(Utilities, RoofMatl, MasVnrArea, BsmtFinSF1, BsmtFinSF2, BsmtUnfSF, Heating, LowQualFinSF,
                                           BsmtFullBath, BsmtHalfBath, Functional, GarageYrBlt, GarageArea, GarageCond, WoodDeckSF,
                                           OpenPorchSF, EnclosedPorch, X3SsnPorch, ScreenPorch, PoolArea, PoolQC, Fence, MiscFeature, MiscVal))
fit5 <- rpart(SalePrice ~ MSSubClass + MSZoning + LotFrontage + LotArea
              + Street + Alley + LotShape + LandContour + LotConfig
              + LandSlope + Neighborhood + Condition1 + Condition2 + BldgType
              + HouseStyle + OverallQual + OverallCond + YearBuilt + YearRemodAdd
              + RoofStyle + Exterior1st + Exterior2nd + MasVnrType
              + ExterQual + ExterCond + Foundation + BsmtQual + BsmtCond + BsmtExposure
              + BsmtFinType1 + BsmtFinType2 + TotalBsmtSF
              + HeatingQC + CentralAir + Electrical
              + FullBath + HalfBath + BedroomAbvGr
              + KitchenQual + TotRmsAbvGrd + Fireplaces + FireplaceQu
              + GarageFinish + GarageCars + GarageQual
              + PavedDrive
              + MoSold + YrSold + SaleType + SaleCondition,
              data=TrainData, method='class', minsplit = 2, cp = 0.001)
Prediction <- predict(fit5, data=TestData, type='class')
fit6 <- rpart(SalePrice ~ LotArea + Neighborhood + OverallQual + FullBath
                       , data=TrainData, method='class', minsplit = 2, cp = 0.001)
Prediction <- predict(fit6, data=TestData, type='class')
fit7 <- rpart(SalePrice ~ LotArea
                             , data=TrainData, method='class', minsplit = 2, cp = 0.001)
fit10 <- randomForest(SalePrice ~ MSSubClass + MSZoning + LotArea
                                    + Street + LotShape + LandContour + LotConfig
                                    + LandSlope + Neighborhood + Condition1 + Condition2 + BldgType
                                    + HouseStyle + OverallQual + OverallCond + YearBuilt + YearRemodAdd
                                    + RoofStyle + Exterior1st + Exterior2nd + ExterQual + ExterCond 
                                    + Foundation + TotalBsmtSF + HeatingQC + CentralAir + FullBath 
                                    + HalfBath + BedroomAbvGr + KitchenQual + TotRmsAbvGrd + Fireplaces
                                    + GarageCars + PavedDrive + MoSold + YrSold + SaleType + SaleCondition,
                    data=TrainData, importance=T, ntree=2000)
Prediction <- predict(fit10, data=TestData, type='class')
write.csv(Prediction, "Prediction10.csv")
