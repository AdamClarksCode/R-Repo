LeapYear <- function(year){
  if(year %% 4 == 0) return(cat(year, "is a leap year."))
  else return(cat(year, "is not a leap year."))
}
LeapYear(2016)
LeapYear(2019)