install.packages("ggplot2")
library(ggplot2)
data(ChickWeight)
chicklist = list()
for(chicken in 1:50){
  tempSet <- subset(ChickWeight, Chick == chicken)
  chickDiet <- head(tempSet$Diet, n=1)
  sumWieght <- sum(tempSet$weight)
  sumTime <- sum(tempSet$Time)
  past <- tempSet$weight[[1]]
  present <- tail(tempSet$weight, n=1)
  growthRate <- (((present-past)/past)*100)
  tempFrame <- data.frame(chicken, sumWieght, sumTime, chickDiet, growthRate)
  chicklist[[chicken]] <- tempFrame
}
chickFrame = do.call(rbind, chicklist)
boxplot(sumWieght~chickDiet, data=chickFrame, xlab="Diet", ylab="Sum Wieght Gain")
plot(sumWieght~chicken,
     data=chickFrame,
     pch= c(15, 16, 17, 18)[as.numeric(chickDiet)],
     col = c("black", "red", "blue", "green")[as.numeric(chickDiet)])
qplot(chicken, growthRate, data = chickFrame, colour = chickDiet)
