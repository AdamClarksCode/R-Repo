UniqueSum <- function(num1, num2, num3){
  if(num1 == num2 && num1 == num3) return(0)
  else if(num1 == num2) return(num3)
  else if(num1 == num3) return(num2)
  else if(num2 == num3) return(num1)
  else return(num1+num2+num3)
}
print(UniqueSum(1, 2, 3))
print(UniqueSum(3, 3, 3))
print(UniqueSum(1, 1, 2))