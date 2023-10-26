
# https://learn-eu-central-1-prod-fleet01-xythos.content.blackboardcdn.com/60faa9080242d/8804243?X-Blackboard-S3-Bucket=learn-eu-central-1-prod-fleet01-xythos&X-Blackboard-Expiration=1698343200000&X-Blackboard-Signature=u8YJDJvAKQCVAj46PmrVZJmg8lR4%2B15ceQAYQYzHWVc%3D&X-Blackboard-Client-Id=309628&X-Blackboard-S3-Region=eu-central-1&response-cache-control=private%2C%20max-age%3D21600&response-content-disposition=inline%3B%20filename%2A%3DUTF-8%27%2704.StatsWithSparrowsPrecisionSE_FT.pdf&response-content-type=application%2Fpdf&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEE0aDGV1LWNlbnRyYWwtMSJGMEQCICpMI%2BVqBPXRVjkwCGOi6e%2BP8%2FNN65VRxneNTad%2FY8IhAiAcT0i1iFiInRwzdrVQGKxU4kWwXcMXQwXDsS7i5tyNwyq%2BBQh2EAMaDDYzNTU2NzkyNDE4MyIM7XZ0ek%2BCVBQTHCxSKpsFD7Yu9TYj3tEMZxF9hjhmuvVj1ii7IZg2XNZx88Cwv%2Bq4hUYqhbqvP74kIkLs2adQRs6FiNTomZk%2BhdLCvmiicUTH7zIpk0278%2B08juXTuW70YNW%2BTm0dc8MO6m3fCc5CIR5YbuK3vugtDV%2FtzF05M9AQ0eQg3DG1PI23d3nWqNfNH8OWQYXjVfEnk27y68%2FLuLnYFsCJJoR5%2FZVwiV291vrvpkiDlCV0bO0Q6SIlgXyJgEbLbLQnaV8Jv3tJt2F6I1UfIpUEVHs6OgJ90ABCcubPwUUYENljn8zdRWt%2BFn1NXHaZvhvU2mkJCyfNQmcqf%2BkXh%2FntG4Wi9zbR2Kv%2B9Gm%2Bx6HPNy6SKGD8QWNe06Jz0Td04xyQUDROIOs%2FgQmTZ5OfhW6Me1vazBxu1pIOLEu7pJEbHqabiI4OYsYIL2ikE60N3QJNeHNAs7o3XQSdYb3TMq9haFG3REb4FnfufHH5Z0vDUoN%2FSXYIqP8vEz%2FHQCEhkN2SE9bVApmxRn8kN9M2lBnUgNFY7dypOV5nHwb2bw4wGtSi8Ot3fj1lFnIyGGGQ35G9dp0cgVH9VVnDYGqzB98B3oVZLwMIAcr8%2FdrYzK%2B1RUCOhffq6zgOuuLfXVwIucuW97mvG028Kln5qDmL6H4CHLz8pEpXAsN8RxUqBYLIvc8JW81pp1c2%2B9CmvlMxHxoPG0OPX8gh%2BCmvcmlBfrIzjDrHh9ctdmvsHi5M%2BN33VFlX6FlFJOkCxDeHyAtWU0wHDRGirTVIDgICOBAZBFnxpepelsTzxevT0vtLfsInNvluIZtAdEsTkpR7%2FKzWLxXsXIiR7VnSpckFPqdrbpQ1ll2%2BWTBlprjYU3GGmEtt04A08JeteEibAtvyGbZ5GmMRnwvDHjDgyOmpBjqyAclr2lOwGvkNA0hx5TjjL58Tr5mtVfcbXDm%2Bsya4dJVZg%2FbPv46OyHoE2O9tnlbvI%2FFJ3%2BwJ5zHsr8KxnM1jbp1sWCUjm5iRDuS5jIapeKLNr8U360woCj9ILLK1CAmA3giXE8S9z57QjxGN4Z3nlLhwCizRm6jReQOPvITD8OWXBFouAjuwjtbMrNrriUqaoZ1jNgcVW7%2Fy8gtlKGpw4svDPI9te8tnft39Re9WfTe%2B01M%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231026T120000Z&X-Amz-SignedHeaders=host&X-Amz-Expires=21600&X-Amz-Credential=ASIAZH6WM4PLXO3QC6OX%2F20231026%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Signature=672315252662fd082c3fa8739c64cd5cd5806c0a351af3528d68233600a28415
# Now I'm following the course pdf

rm(list=ls())
d<-read.table("../Data/SparrowSize.txt", header=TRUE)
d1<-subset(d, d$Tarsus!="NA")    # she deletes the NA's
seTarsus<-sqrt(var(d1$Tarsus)/length(d1$Tarsus))   # wonderful? converted data type?
seTarsus


d12001<-subset(d1, d1$Year==2001)
seTarsus2001<-sqrt(var(d12001$Tarsus)/length(d12001$Tarsus))
seTarsus2001

rm(list=ls())

TailLength<-rnorm(500,mean=3.8, sd=2)

summary(TailLength)

length(TailLength)

var(TailLength)

sd(TailLength)

hist(TailLength)  # can't see histogram   one line by line run!!!!

#########################

# rnorm() draws	random	numbers

x<-1:length(TailLength) # for ... iterable
y<-mean(TailLength)+0*x
min(TailLength)
max(TailLength)

plot(x,y, cex=0.03, ylim=c(2,5),xlim=c(0,500), xlab="Sample size n", ylab="Me
an of tail length ±SE (m)", col="red")

print("Standard Deviation: ")
SE<-c(1)
SE
print("mu: ")
mu<-c(1)
mu

for (n in 1:length(TailLength)) {
  d<-sample(TailLength, n, replace=FALSE)
  mu[n]<-mean(TailLength)
  SE[n]<-sd(TailLength)/sqrt(n)
}

head(SE)
head(mu)
length(SE)
length(mu)

up<-mu+SE
down<-mu-SE
x<-1:length(SE)
segments(x, up, x1=x, y1=down, lty=1)

rm(list=ls())
TailLength<-rnorm(201,mean=3.8, sd=2)
length(TailLength)
## [1] 201
x<-1:201
y<-mean(TailLength)+0*x
plot(x,y, cex=0.03, ylim=c(3,4.5),xlim=c(0,201), xlab="Sample size n", ylab="
Mean of tail length ±SE (m)", col="red")
n<-seq(from=1, to=201, by=10)
n
## [1] 1 11 21 31 41 51 61 71 81 91 101 111 121 131 141 151 161 1 71 181
## [20] 191 201
SE<-c(1)
mu<-c(1)
for (i in 1:length(n)) {
  d<-sample(TailLength, n[i], replace=FALSE)
  mu[i]<-mean(TailLength)
  SE[i]<-sd(TailLength)/sqrt(n[i])
}
up<-mu+SE
down<-mu-SE
length(up)
## [1] 21
length(n)
## [1] 21
plot(x,y, cex=0.03, ylim=c(3,4.5),xlim=c(0,201), xlab="Sample size n", ylab="
Mean of tail length ±SE (m)", col="red")
points(n,mu,cex=0.3, col="red")
segments(n, up, x1=n, y1=down, lty=1)

################################################################

# sd of Tarsus: 
print("Now it's mine: ")
sd(d$Tarsus, na.rm=TRUE)





