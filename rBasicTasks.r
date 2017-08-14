myVariable <- "Hello World"
myVariable
printString <- function(stringToPrint){
  stringToPrint
}
printString("This message was passed to a function")
sumOfThem <- function(num1, num2){
  return(num1 + num2)
}
sumOfThem(3, 3)
sumOrMultiply <- function(num1, num2, addThem){
  if(addThem == TRUE)return(num1 + num2)
  else return(num1 * num2)
}
sumOrMultiply(3, 3, TRUE)
sumOrMultiply(3, 3, FALSE)
sumOrMultiplyNotZero <- function(num1, num2, addThem){
  if(num1 == 0 || num2 == 0){
    if(num1==0) return(num2)
    else return(num1)
  }
  else if(addThem == TRUE)return(num1 + num2)
  else return(num1 * num2)
}
sumOrMultiplyNotZero(0, 3, TRUE)
sumOrMultiplyNotZero(7, 0, FALSE)
sumOrMultiplyNotZero(3, 3, TRUE)
sumOrMultiplyNotZero(3, 3, FALSE)
for(i in 0:9){
  print(sumOrMultiplyNotZero(2, i, FALSE))
}
increment <- function(func, y){
  func(y)
}
increment(function(x){x+1}, 6)
