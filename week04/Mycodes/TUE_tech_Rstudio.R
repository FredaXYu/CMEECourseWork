

## 
# wide and long dataframes
# Data Wrangling: https://mhasoba.github.io/TheMulQuaBio/notebooks/08-Data_R.html#data-wrangling-with-tidyverse
# tidyverse tidyr; dplyr

# no gather and spread  - not updated
# yes pivot_longer and pivot_wider

library(dplyr)
library(tidyr)

speciesdiversity <- read.csv("speciesdiversity.csv", header=T, row.names=1)

long <- pivot_longer(speciesdiversity, names_to="Year", values_to="SpDiv", co)
long <- pivot_longer(speciesdiversity, names_to="Year", values_to="SpDiv", co)


# arguments: names_prefix="SpDiv." and values_drop_na=TRUE or FALSE

long <- pivot_longer(speciesdiversity, names_to="Year", values_to="SpDiv", 
                     cols=SpDiv.1991:SpDiv.1992, names_prefix="SpDiv.")

list.files()






