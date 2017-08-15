data(ChickWeight)
chicklist = list()
for(chicken in 1:50){
  tempSet <- subset(ChickWeight, Chick == chicken)
  chickDiet <- tempSet$Diet[[1]]
  sumWieght <- sum(tempSet$weight)
  sumTime <- sum(tempSet$Time)
  tempFrame <- data.frame(chicken, sumWieght, sumTime, chickDiet)
  chicklist[[chicken]] <- tempFrame
}
chickFrame = do.call(rbind, chicklist)
boxplot(sumWieght~chickDiet, data=chickFrame, xlab="Diet", ylab="Sum Wieght Gain")
plot(sumWieght~chicken,
     data=chickFrame,
     pch= c(15, 16, 17, 18)[as.numeric(chickDiet)],
     col = c("black", "red", "blue", "green")[as.numeric(chickDiet)])
hist(chickFrame$sumWieght)