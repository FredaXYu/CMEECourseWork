
####################################################################

# This is RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR Programme! 

####################################################################

MyList <- list(species=c("Quercus robur","Fraxinus excelsior"), age=c(123, 84))

print(MyList[[1]]) # [1] "Quercus robur"      "Fraxinus excelsior"
print(MyList[[1]][1]) # [1] "Quercus robur"

MyList2 <- list(species=c("Quercus robur","suiwei", "Fraxinus excelsior"), age=c(123, 84))

print(MyList2[[1]]) # [1] "Quercus robur"      "suiwei"             "Fraxinus excelsior"
print(MyList2[[1]][1]) # [1] "Quercus robur"


print(MyList$species)      # [1] "Quercus robur"      "Fraxinus excelsior"   same as below
print(MyList[["species"]]) # [1] "Quercus robur"      "Fraxinus excelsior"  same as above
print(MyList$species[1])   # [1] "Quercus robur"

#####################

pop1<-list(species='Cancer magister',
           latitude=48.3,longitude=-123.1,
           startyr=1980,endyr=1985,
           pop=c(303,402,101,607,802,35))   # 6 elements
print(pop1)
print(pop1[1])
print(pop1[6][2])     # I am trying, NA
print(pop1[[6]][2])     # [1] 402

#############################
# yxy1028@yxy-hp-borrowed:~/Documents/GitHub/CMEECourseWork/week03/Code$ Rscript Week03_R_17Oct.r
# [1] "Quercus robur"      "Fraxinus excelsior"
# [1] "Quercus robur"
#############################


pop1<-list(lat=19,long=57,
           pop=c(100,101,99))
pop2<-list(lat=56,long=-120,
           pop=c(1,4,7,7,2,1,2))
pop3<-list(lat=32,long=-10,
           pop=c(12,11,2,1,14))
pops<-list(sp1=pop1,sp2=pop2,sp3=pop3)

print("-----------------------------------------------------------")
print(sp3)

print(pops)


print(pops$sp1["pop"]) 









