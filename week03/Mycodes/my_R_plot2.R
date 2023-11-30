
# source: The book - The R Student Companion (EBL-Schweitzer) Dennis, Brian-CRC Press 
# pp. 57-71

##### A scatterplot and side-by-side boxplot are useful for depicting
##### associations between two variables.

# Examples:
  
  # Scatterplot example script.
  # Data from the election-at-large for city council,
  # Moscow, Idaho, 1999. Seven candidates ran, highest
  # number of votes got a city council seat.
  # Variables are dollars spent by candidates on their
  # campaigns, and the resulting number of votes garnered.
  #----------------------------------------------------
  
dollars.spent=c(0,0,404,338,583,1992,1849)
number.votes=c(159,305,706,912,1159,1228,1322)
plot(dollars.spent,number.votes,xlab="Dollars spent",
     ylab="Number of votes")

# Side-by-side boxplot example script.
# Data from Margolese 1970 Hormones and Behavior.
# Androsterone levels (mg in 24 hr in urine sample)
# and sexual orientation (S: straight, G: gay)
# in 26 human males.
#----------------------------------------------------

level.andro=c(3.9, 4.0, 3.8, 3.9, 2.9, 3.2, 4.6, 4.3, 3.1, 2.7, 
              2,3, 2.5, 1.6, 3.9, 3.4, 2.3, 1.6, 2.5, 3.4, 1.6, 
              4.3, 2.0, 1.8, 2.2, 3.1, 1.3)

orientation=c("S", "S", "S", "S", "S", "S", "S", "S", "S", "S", 
              "S", "G", "G", "G", "G", "G", "G", "G", "G", "G", 
              "G", "G", "G", "G", "G", "G")

boxplot(level.andro~orientation, 
        range=0, 
        names=c("Gay","Straight"), 
        boxwex=.5,
        ylab="Androsteronelevel")

# Error in stats::model.frame.default(formula = level.andro ~ orientation) : 
# 变数的长度不一样('orientation')
