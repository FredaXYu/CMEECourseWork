
# R data types - Julia lecture

# https://learn-eu-central-1-prod-fleet01-xythos.content.blackboardcdn.com/60faa9080242d/8804241?X-Blackboard-S3-Bucket=learn-eu-central-1-prod-fleet01-xythos&X-Blackboard-Expiration=1698850800000&X-Blackboard-Signature=%2FuEvX5KjAvpN9%2BS%2BfkxtImNGVMm1C17bbvckM%2FKcpCg%3D&X-Blackboard-Client-Id=309628&X-Blackboard-S3-Region=eu-central-1&response-cache-control=private%2C%20max-age%3D21600&response-content-disposition=inline%3B%20filename%2A%3DUTF-8%27%27SwS.h03.22.pdf&response-content-type=application%2Fpdf&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaDGV1LWNlbnRyYWwtMSJIMEYCIQD%2FSeq4eydZ6WixCTV%2FlVLjTgp0%2FrsF5QGc3yPZCHGs7wIhAOOMLeBb%2BSvm%2B33QqyqOzVvd6Fuix1JBTzXJQiJISaZlKr0FCBIQAxoMNjM1NTY3OTI0MTgzIgzqwH2k00yRCm1UbCEqmgVVUADP9NjE2ayr5UFRL6Jf7BpFKF5%2B7Bzm3NeRtIVhFX%2FAWBobUWxVJgI8HYilF6dSTwny8ANkHi3ZbDlwVVY2Wp%2BBUNdFnhE48OgDmPB43%2BfV5CxNPwqtQtaMnXEmPvj3QWR8sADxGVkChfrRtHnQX%2FdiGnbnoMXiYFmCKCZceHpgTwq1t0kEryKJKL%2FITQ9OQYbjLw7A8lOUwOcftXJ%2BakpdE%2BAsMpQWn%2BrZVi7CO80nrOwJni%2FXxKfG62qbGNsJTqsYjuyr2tW6%2F%2FvHpecdTPEFSsZjCaFi0Cc%2BuwYr67FU7a%2BsDaQF1YPJjTgGCVV6%2BnAXj2%2BmkbwCR45D4ti1KsESoj9AJDuyX98guVtoaivUnIDvHGMjSmfDrF43K4O%2FVufKbPRpPp1sypNeMjhRLsqs%2BGa2TziUm5d2L3yq1WEnuj19M7IE4mrmoplETtMphGUSHrm%2FqJdSiUPCpirUopvJ46SBktCc55sejr4ZyfLjuHvwkrHPnWPv2l2h%2Fl6rrqBOdcFGUCc8mWuDSZLyVqW0Q5uQkPYgjP0H3Z5vv%2BVwj6oaDTQL%2FK10P1N8WGuJD4k8mGCDzbmb0KZoL8aq5qgb9%2FuNerwWIukc4giL9LxTUo2ooTwwHb2ywdHk7v6cCCbBr%2BHW3%2Bs8hs%2FubVXvcnosNaIxBAnJhOG5Z2wTqK7sOrXhZ%2FMudGFUbWE0zVCRAzSfdAt7rcTTiLKeLKevnYBGbYjP0v2LnoxFn%2BSNoO0fdeTg3SKmBoFGb2dJjKtfhCc2owGJbSXMB8kDZni1SStw8AfYlDKEqH8f%2FyjiqzLJ7LL41AyD3IxbfzkoDzY7We8bYJhJHFjFpI6Kv%2FmmT6E9HGnkYQ0%2F4BU7cEjihd%2BsImtF6mkd6rAwmayIqgY6sAF65kIAxlxvivTghEQR0ZpBYUFAXfi%2FUt47CIROLTesgVyG7IjO4SSoeAD%2BcenDrdHgDDxtMeDZzDJA4mFgGIu13AbS3WAzYHdrcc5bGaAyW3knB4rkJRRDerLbrb1rkNJfRSGunhdtV74JqZPAJ66O1AQipNyg37SB4xg763neAiuo8GaJHpTxqtyy5pX9%2F9ST2XEamNd%2FRyeEqefhsEYMxhDJRRr4jvuzvZJ73rLbEg%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231101T090000Z&X-Amz-SignedHeaders=host&X-Amz-Expires=21600&X-Amz-Credential=ASIAZH6WM4PLW75JFKHX%2F20231101%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Signature=83b69d4465f3f7947a9f6ec977b188d81b08d260769c5407893dd22b32270a35

rm(list=ls())
d<-read.table("../Data/SparrowSize.txt", header=T)
str(d)

d$BirdIDFact<-as.factor(d$BirdID)
str(d$BirdIDFact)
## Factor w/ 636 levels "1","2","3","4",..: 1 2 2 2 2 2 2 2 2 2 ...

mean(d$BirdID)
# mean(d$BirdIDFact) # can’t	take	a	mean	of a	bunch	of	names

plot(d$Mass~as.factor(d$Year), xlab="Year", ylab="House sparrow body mass(g)")
plot(d$Mass~d$Year, xlab="Year", ylab="House sparrow body mass(g)")
print("Hereeeeee")

##########################

rm(list=ls())
b <-read.table("../Data/BTLD.txt", header=T)
str(b)

mean(b$ClutchsizeAge7, na.rm = TRUE)
print("After calculating the mean of ClutchesizeAge7")  # can work 1 Nov

plot(b$LD.in_AprilDays.~b$Year, ylab="Laying date (April days)", xlab="Year", 
     pch=19, cex=0.3)

plot(b$LD.in_AprilDays.~jitter(b$Year), ylab="Laying date (April days)", xlab
     ="Year", pch=19, cex=0.3)   # jitter to add noise 

##########################

require(ggplot2)
## Loading required package: ggplot2
p <- ggplot(b, aes(x=Year, y=LD.in_AprilDays.)) +
  geom_violin()
p

boxplot(b$LD.in_AprilDays.~b$Year, ylab="Laying date (April days)", xlab="Yea
r")
#############################
# multiple violin plots: 
p <- ggplot(b, aes(x=as.factor(Year), y=LD.in_AprilDays.)) +
  geom_violin()
p

#-----------------------------------

p + stat_summary(fun.data="mean_sdl",
               geom="pointrange")











