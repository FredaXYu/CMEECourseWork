# Is Florida getting warmer?
# Me: the answer MUST BE: yes. Then, why yes? 
# Me:  correlation coefficients  is big. So I must get the codes answer to be ... big. 


rm(list=ls())

load("../Data/KeyWestAnnualMeanTemperature.RData")   # 'load' =_=
ats   # now I see you have 100 key-values pairs

ls()
# class(ats)
# head(ats)
plot(ats)
# goodbye
######################################

e <- read.table("../Data/KeyWestAnnualMeanTemperature.RData", header=TRUE) 	
# str(a) 	   # https://github.com/abiB1994/CMEECourseWork/blob/master/Week4/Code/Day1sws.R

print("look now")
temp <- e$temp    # it's null
temp


# Compute the appropriate correlation coefficient between years and 
# Temperature and store it (look at the help file for cor(): 

# I have learnt: new <- c(a=1, b=2, c=3, d=4, e=5, f=6)

# Now I close my eyes and say that I want 100 c(pairs)

cor_year_temp <- function(year, temp)
{

    # Parameters: 
    #   year: a seqence of year numbers in order (from min to max)
    #   temp: a list of numbers, now it can be a dictionary (assuming float)
    # Output: 
    #   cor number 

  
  # new <- c()
  # for (i in 1:100)    # now I have problem of naming 100 things, it is in order 
  # {
  #   name_key <- toString(i)
  #   new <- c(new, c(name_key=temp[1]))
  # }
  # new
  
  R_structure_to_dictionary(100)  # num to string dict, is a dict
  temp <- ats$temp
  
  # sample(, replace=FALSE)
  
}

# I really really want this number to be possibly similar to 1. 
# cor_year_temp(100, )


###########################################

# cor()


##########################################

# Now I have a useful function, which is the dictionary (omit blood)
R_structure_to_dictionary <- function(num)
{
  new <- c()
  
  for (i in 1:num)    # now I have problem of naming 100 things
  {
    name_key <- toString(i)
    new <- c(new, name_key)
  }
  
  return (new)
}
R_structure_to_dictionary(100)

##########################################

R_structure_to_dictionary(100)  # num to string dict, is a dict
temp <- ats$temp







