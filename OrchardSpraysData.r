data(OrchardSprays)
max_decrease <- subset(OrchardSprays, 
    decrease==max(OrchardSprays$decrease, na.rm=T))
print(max_decrease)
boxplot(decrease~treatment, data = OrchardSprays)