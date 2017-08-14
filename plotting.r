data(iris)
boxplot(Sepal.Width~Species, data=iris, ylab="Sepal Width")
plot(Petal.Width~Petal.Length, 
     data=iris, 
     pch= c(15, 16, 17)[as.numeric(Species)], 
     col = c("black", "red", "blue")[as.numeric(Species)])
legend('topleft', 
       legend=c("Setosa", "Versicolor", "Virginica"), 
       pch= c(15, 16, 17), 
       col = c("black", "red", "blue"))

