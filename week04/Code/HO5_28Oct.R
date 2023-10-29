
rm(list=ls())
d<-read.table("SparrowSize.txt", header=TRUE)

boxplot(d$Mass~d$Sex.1, col = c("red", "blue"), ylab="Body mass (g)")


t.test1 <- t.test(d$Mass~d$Sex.1)
t.test1









