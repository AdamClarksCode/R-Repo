TooHot <- function(temperature, isSummer){
  if(isSummer == T && temperature >= 60 && temperature <= 100) return(TRUE)
  else if(isSummer == F && temperature >= 60 && temperature <= 90) return(TRUE)
  else(FALSE)
}
print(TooHot(91, T))
print(TooHot(91, F))
print(TooHot(61, F))