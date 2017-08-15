data(CO2)
str(CO2) #Ord.factor
mean_uptake = mean(CO2[["uptake"]])
print(mean_uptake)
boxplot(uptake~Type, data=CO2)
quebec_CO2 <- subset(CO2, Type=="Quebec")
print(quebec_CO2)
mississippi_CO2 <- subset(CO2, Type=="Mississippi")
print(mississippi_CO2)
calMean <- function(set1, set2){
  mean1 <- mean(set1[["uptake"]])
  mean2 <- mean(set2[["uptake"]])
  if(mean1 > mean2) {
    print(cat("Set 1 has a higher mean of", mean1))
    print(cat("Set 2 has a mean of", mean2))
  } else if(mean2 > mean1){
    print(cat("Set 2 has a higher mean of", mean2))
    print(cat("Set 1 has a mean of", mean1))
  } else{
    print(cat("Set 1 and 2 have the same mean of ", mean1))
  }
}
calMean(quebec_CO2, mississippi_CO2)