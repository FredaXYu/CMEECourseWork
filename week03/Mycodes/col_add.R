
df=read.csv("aa.csv",sep=" ")

df$A
df$D<-df$A+df$B
df[["D"]]<-df[["A"]]+df[["B"]]*2
df$OUT<-df$A+df$B                     #add new col "E"

write.csv(df,file="out.csv",row.names=F)


