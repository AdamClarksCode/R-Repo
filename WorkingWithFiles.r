vRange<-seq(2,1000,2)
setwd("C:/Users/Administrator/Documents/r")
write.csv(vRange, "evens.csv")
evens<-read.csv("evens.csv")
evens[2] <- evens[2] + 1
write.csv(evens[2], "odds.csv")