BlackJack <- function(num1, num2){
  if(num1 > 21 && num2 > 21) return(0)
  else if(num1 > num2 && num1 < 22) return(num1)
  else if(num2 > num1 && num2 < 22) return(num2)
  else return(num1)
}
print(BlackJack(18,21))
print(BlackJack(20,18))
print(BlackJack(22,22))