
# source: The book - The R Student Companion (EBL-Schweitzer) Dennis, Brian-CRC Press 
# pp. 57-71

year=1960:2010
unemploy=c(5.5, 6.7, 5.5, 5.7, 5.2, 4.5, 3.8, 3.8, 3.6, 3.5,
           4.9, 5.9, 5.6, 4.9, 5.6, 8.5, 7.7, 7.1, 6.1, 5.8,
           7.1, 7.6, 9.7, 9.6, 7.5, 7.2, 7.0, 6.2, 5.5, 5.3,
           5.6, 6.8, 7.5, 6.9, 6.1, 5.6, 5.4, 4.9, 4.5, 4.2,
           4.0, 4.7, 5.8, 6.0, 5.5, 5.1, 4.6, 4.6, 5.8, 9.3,
           9.6)

surplus=c(0.1, -0.6, -1.3, -0.8, -0.9, -0.2, -0.5, -1.1, -2.9,
          0.3,-0.3, -2.1, -2.0, -1.1, -0.4, -3.4, -4.2, -2.7, -2.7,
          -1.6, -2.7, -2.6, -4.0, -6.0, -4.8, -5.1, -5.0, -3.2, -3.1,
          -2.8, -3.9, -4.5, -4.7, -3.9, -2.9, -2.2, -1.4, -0.3, 0.8,
          1.4, 2.4, 1.3, -1.5, -3.5, -3.6, -2.6, -1.9, -1.2, -3.2,
          -10.0, -8.9)

party=c("R", "R", "D", "D", "D", "D", "D", "D", "D", "D",
        "R", "R", "R", "R", "R", "R", "R", "R", "D", "D",
        "D", "D", "R", "R", "R", "R", "R", "R", "R", "R",
        "R", "R", "R", "R", "D", "D", "D", "D", "D", "D",
        "D", "D", "R", "R", "R", "R", "R", "R", "R", "R",
        "D")

### Graphs of One Variable: ###

stripchart(unemploy,xlab="percent civilian unemployment 1960-2010", method="stack",pch=1,cex=3)

hist(unemploy, main=" ",xlab="Percent civilian unemployment 1960-2010")

hist(unemploy,main=" ",breaks=c(3,4,6,8,9,10),xlab="Percent civilian unemployment 1960-2009")

stem(unemploy)  # stem plot will be shown in R console

min(unemploy)
max(unemploy)
median(unemploy)

boxplot(unemploy)

boxplot(unemploy,ylab="Percent civilian unemployment 1960-2010") # give y label

plot(year,unemploy,type="l",xlab="Year",ylab="Civilian unemployment") # type is line plot

### Graphs of Two Variables: ###

boxplot(unemploy~party, range=0, names=c("Democratic", "Republican"), 
        boxwex=.5, ylab="Civilian unemployment")    # side-by-side boxplot
# range: A value of zero causes the whiskers to extend to the data extremes.

#========================================

x=c(4,5,7,9)
barplot(x)
pie(x)


mns=c(mean(unemploy[party=="D"]),mean(unemploy[party=="R"]))
barplot(mns)

barplot(mns,xlim=c(0,1),width=.1,ylim=c(0,7),
        ylab="average unemployment",names.arg=c("Dem","Rep"),space=2)

num.yrs=c(length(year[party=="D"]),length(year[party=="R"]))
pie(num.yrs)

pie(num.yrs,labels=c("Democratic","Republican"))   # add labels

