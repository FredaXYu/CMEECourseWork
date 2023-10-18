yxy1028@yxy-hp-borrowed:~$ source("basic_io.R")
bash: syntax error near unexpected token `"basic_io.R"'
yxy1028@yxy-hp-borrowed:~$ ^[[200~getwd()
> q
bash: syntax error near unexpected token `q'
yxy1028@yxy-hp-borrowed:~$ Rscript
7Usage: /path/to/Rscript [--options] [-e expr [-e expr2 ...] | file] [args]

--options accepted are
  --help              Print usage and exit
  --version           Print version and exit
  --verbose           Print information on progress
  --default-packages=list
                      Where 'list' is a comma-separated set
                        of package names, or 'NULL'
or options to R, in addition to --no-echo --no-restore, such as
  --save              Do save workspace at the end of the session
  --no-environ        Don't read the site and user environment files
  --no-site-file      Don't read the site-wide Rprofile
  --no-init-file      Don't read the user R profile
  --restore           Do restore previously saved objects at startup
  --vanilla           Combine --no-save, --no-restore, --no-site-file
                        --no-init-file and --no-environ

'file' may contain spaces but not shell metacharacters
Expressions (one or more '-e <expr>') may be used *instead* of 'file'
See also  ?Rscript  from within R
yxy1028@yxy-hp-borrowed:~$ a <- 1.0
class(a)
bash: -: No such file or directory
bash: syntax error near unexpected token `a'
yxy1028@yxy-hp-borrowed:~$ R

R version 4.1.2 (2021-11-01) -- "Bird Hippie"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> a <- 1.0
class(a)
[1] "numeric"
> type(a)
Error in type(a) : could not find function "type"
> typeof(a)
[1] "double"
> M <- matrix(runif(1000000),1000,1000)

SumAllElements <- function(M) {
  Dimensions <- dim(M)
  Tot <- 0
  for (i in 1:Dimensions[1]) {
    for (j in 1:Dimensions[2]) {
      Tot <- Tot + M[i,j]
    }
  }
  return (Tot)
}
 
print("Using loops, the time taken is:")
print(system.time(SumAllElements(M)))

print("Using the in-built vectorized function, the time taken is:")
print(system.time(sum(M)))
7[1] "Using loops, the time taken is:"
   user  system elapsed 
  0.032   0.004   0.036 
[1] "Using the in-built vectorized function, the time taken is:"
   user  system elapsed 
  0.001   0.000   0.001 
> NoPreallocFun <- function(x) {
    a <- vector() # empty vector
    for (i in 1:x) {
        a <- c(a, i) # concatenate
        print(a)
        print(object.size(a))
    }
}

system.time(NoPreallocFun(10))7
Error: unexpected numeric constant in "system.time(NoPreallocFun(10))7"
> NoPreallocFun <- function(x) {
    a <- vector() # empty vector
    for (i in 1:x) {
        a <- c(a, i) # concatenate
        print(a)
        print(object.size(a))
    }
}

system.time(NoPreallocFun(10))
[1] 1
56 bytes
[1] 1 2
56 bytes
[1] 1 2 3
64 bytes
[1] 1 2 3 4
64 bytes
[1] 1 2 3 4 5
80 bytes
[1] 1 2 3 4 5 6
80 bytes
[1] 1 2 3 4 5 6 7
80 bytes
[1] 1 2 3 4 5 6 7 8
80 bytes
[1] 1 2 3 4 5 6 7 8 9
96 bytes
 [1]  1  2  3  4  5  6  7  8  9 10
96 bytes
   user  system elapsed 
  0.003   0.003   0.022 
> NoPreallocFun <- function(x) {
    a <- vector() # empty vector
    for (i in 1:x) {
        a <- c(a, i) # concatenate
        print(a)
        print(object.size(a))
    }
}

system.time(NoPreallocFun(10))
[1] 1
56 bytes
[1] 1 2
56 bytes
[1] 1 2 3
64 bytes
[1] 1 2 3 4
64 bytes
[1] 1 2 3 4 5
80 bytes
[1] 1 2 3 4 5 6
80 bytes
[1] 1 2 3 4 5 6 7
80 bytes
[1] 1 2 3 4 5 6 7 8
80 bytes
[1] 1 2 3 4 5 6 7 8 9
96 bytes
 [1]  1  2  3  4  5  6  7  8  9 10
96 bytes
   user  system elapsed 
  0.002   0.000   0.002 
> 

