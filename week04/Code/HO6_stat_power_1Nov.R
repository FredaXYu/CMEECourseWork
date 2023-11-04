
# Julia week04 
# https://learn-eu-central-1-prod-fleet01-xythos.content.blackboardcdn.com/60faa9080242d/8805373?X-Blackboard-S3-Bucket=learn-eu-central-1-prod-fleet01-xythos&X-Blackboard-Expiration=1698850800000&X-Blackboard-Signature=rryfQBvV1bzQAmo7MpX4M4accswRkerKu1Jn9whvCMU%3D&X-Blackboard-Client-Id=309628&X-Blackboard-S3-Region=eu-central-1&response-cache-control=private%2C%20max-age%3D21600&response-content-disposition=inline%3B%20filename%2A%3DUTF-8%27%27SwS%2520h06.22%2520Power%25281%2529.pdf&response-content-type=application%2Fpdf&X-Amz-Security-Token=IQoJb3JpZ2luX2VjENr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaDGV1LWNlbnRyYWwtMSJGMEQCIEi%2BScNeii2QVMFj%2FFFsspGIgat8DNrtmor1Z%2F6rZTNmAiBMHke45rcnojxwzU%2BRxmVN7xqqt66MALDiahRUwSexTCq9BQgTEAMaDDYzNTU2NzkyNDE4MyIM9Fae%2B4ml%2B98UJUdWKpoFTYFb3cpf96QI6qTyFEKTjGZoAbLKded%2F7xlb0wZXx5Eot9%2FdW1R0ieXhZtq4BDG3GpSS6luNUOxmTKOvXfVuq3g1lUx64vf0PI2Vu6t1ZMUDxOf2LKtFytlHZRWrYvgN6JR0OcgK%2FpdIR3J5xBk1qBdtiFsk%2Fr9umuHCngb0l%2Fn8B57i4pHCWlB2v%2B1DOJIN9f9YmO8EBNFGQsOvAWOaV6YhW5VvlibylLb9pg%2BV%2BFXmTfTgEqr%2BcOexl49FQcv%2FQhRKwP3Gglq6yUuR8jUvu%2Bate4%2FSuLKSQpEtg2AeeKzQw5Up%2BtziB83pzDMqYGiHLv3xi79%2BCkEPiOob9IMSnl2cjpXhmt5n4KSwIcKH9plgNxyVLvtwHGfbGbFjdx5UJHbnz3ULZhcR0eR3jdSfuVimjFuLf8czV310JECih0APXb%2B0z7VeFiidiIOsXmOzyPOGLkqboTQHZvdRcJlcEO6BXbo%2Fyuklo3T5dKozyylnlW7fZ4bqpzLyp3XPGQHOtOnBqCpwU7CZs97va9Jwz9JOA3F3mAK24t3lGJrqeVPguLPrLg3MhJYeOpjSxLkeYxnNxLx6hcnYvka8q%2Bzec5%2FIeiLhUVuL%2BXY8Z9whRSnk5QR2SubLePenxHZ9iXIESD4TMsIpyZV9iP%2FlLemPFMRh1f%2F7puXrUwg1YMmthhKCNfRFsTpiwn2K4xdDOPRCDBVk%2F4HcVKG%2BrxfwP0j0tybhLwtQ5kJVbJhbjiwRSjk4cvpj3MoBjC3eLPh%2F9CNN0xgdQtEnuHe8cbv9Qtn4RS3RV3gTXZvNjrHJ3v%2BeLlQPCJbafWLoQ79gg1pNyq4m5Y8LhDFmeOWxpDGHill7LZa4SjihRsLmIpz2rkc6WYIvQoB%2FQphLt2pFMMHIiKoGOrIBctOnCkFUASshdKSQJ%2Bo8mDV4ozK6oX8vHjhngOMnaqUfOVB9PEUk6pnCcoQtXNKRqfdH4atgSNOedijRPQrNcrE5TKHWnoRAAuKlb7h2qzauOh4xNORoXC51pKZCuox2QyRtgonytAz40v2iJxyilaDzjOd7TyTIBbHPKb%2Fb4HfT2GrLMqmN57jLvq0OXExQ4LLhXj0ZPA4Jj2ccv2YUY754Uc1WdQc0EDGCdcrLw7XmBQ%3D%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20231101T090000Z&X-Amz-SignedHeaders=host&X-Amz-Expires=21600&X-Amz-Credential=ASIAZH6WM4PL7TGJL26Q%2F20231101%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Signature=a4161b65a1eb8d6dd9648b6d84097a90d05ac7efa6f79dd61a30a976c2025d9b

rm(list=ls())
# we never forget this one! 
require(WebPower)
?WebPower


y <- rnorm(51, mean=1, sd=1.3)
x<-seq(from=0, to=5, by=0.1)
length(x)
## [1] 51
plot(hist(y, breaks=10))

mean(y)
## [1] 1.260218
sd(y)

segments(x0=(mean(y)), y0=(0), x1=(mean(y)), y1=40, lty=1, col="blue")
# and now 0.25 sd left of the mean (because females are larger)
segments(x0=(mean(y)+0.25*sd(y)), y0=(0), x1=(mean(y)+0.25*sd(y)), y1=40, lty
         =1, col="red")

wp.t(d=0.25, power=0.8, type="two.sample", alternative="two.sided")
## Two-sample t-test
## 
## n d alpha power
## 252.1275 0.25 0.05 0.8
## 
## NOTE: n is number in *each* group
## URL: http://psychstat.org/ttest

res.1<-wp.t(n1=seq(20,300,20), n2=seq(20,300,20), d=0.25, type="two.sample.2n
", alternative="two.sided")
res.1

plot(res.1, xvar='n1', yvar='power')










