
# https://mhasoba.github.io/TheMulQuaBio/notebooks/08-Data_R.html#handling-big-data-in-r

# Practicals
# Body mass distributions

MyDF <- read.csv("../Data/EcolArchives-E089-51-D1.csv")
dim(MyDF) #check the size of the data frame you loaded

# str(MyDF)

head(MyDF)

require(tidyverse)
glimpse(MyDF)

MyDF$Type.of.feeding.interaction <- as.factor(MyDF$Type.of.feeding.interaction)
MyDF$Location <- as.factor(MyDF$Location)
str(MyDF)


################## teacher's codes: ############################
# plot(MyDF$Predator.mass,MyDF$Prey.mass)
# 
# plot(log(MyDF$Predator.mass),log(MyDF$Prey.mass))
# # look at the same using a base-10 log transform: 
# plot(log10(MyDF$Predator.mass),log10(MyDF$Prey.mass))
# # let’s change the symbols by specifying the plot characters using pch:
# plot(log10(MyDF$Predator.mass),log10(MyDF$Prey.mass),pch=20) # Change marker
# 
# hist(MyDF$Predator.mass)
# 
# hist(log10(MyDF$Predator.mass),xlab="log10(Predator Mass (g))",ylab="Count", 
#      col = "lightblue", border = "pink") # Change bar and borders colors 
# #####
# 
# par(mfcol=c(2,1)) #initialize multi-paneled plot
# par(mfg = c(1,1)) # specify which sub-plot to use first 
# hist(log10(MyDF$Predator.mass),
#      xlab = "log10(Predator Mass (g))", ylab = "Count", col = "lightblue", border = "pink", 
#      main = 'Predator') # Add title
# par(mfg = c(2,1)) # Second sub-plot
# hist(log10(MyDF$Prey.mass), xlab="log10(Prey Mass (g))",ylab="Count", col = "lightgreen", border = "pink", main = 'prey')
# 
# #####
# 
# hist(log10(MyDF$Predator.mass), # Predator histogram
#      xlab="log10(Body Mass (g))", ylab="Count", 
#      col = rgb(1, 0, 0, 0.5), # Note 'rgb', fourth value is transparency
#      main = "Predator-prey size Overlap") 
# hist(log10(MyDF$Prey.mass), col = rgb(0, 0, 1, 0.5), add = T) # Plot prey
# legend('topleft',c('Predators','Prey'),   # Add legend
#        fill=c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5))) # Define legend colors
# 
# #####
# boxplot(log10(MyDF$Predator.mass), xlab = "Location", ylab = "log10(Predator Mass)", main = "Predator mass")
# 
# #####
# 
# boxplot(log(MyDF$Predator.mass) ~ MyDF$Location, # Why the tilde?
#         xlab = "Location", ylab = "Predator Mass",
#         main = "Predator mass by location")
# 
# boxplot(log(MyDF$Predator.mass) ~ MyDF$Type.of.feeding.interaction,
#         xlab = "Location", ylab = "Predator Mass",
#         main = "Predator mass by feeding interaction type")
# 
# par(fig=c(0,0.8,0,0.8)) # specify figure size as proportion
# plot(log(MyDF$Predator.mass),log(MyDF$Prey.mass), xlab = "Predator Mass (g)", ylab = "Prey Mass (g)") # Add labels
# par(fig=c(0,0.8,0.4,1), new=TRUE)
# boxplot(log(MyDF$Predator.mass), horizontal=TRUE, axes=FALSE)
# par(fig=c(0.55,1,0,0.8),new=TRUE)
# boxplot(log(MyDF$Prey.mass), axes=FALSE)
# mtext("Fancy Predator-prey scatterplot", side=3, outer=TRUE, line=-3)
# 
# ##### conbining plot types
# par(fig=c(0,0.8,0,0.8)) # specify figure size as proportion
# plot(log(MyDF$Predator.mass),log(MyDF$Prey.mass), xlab = "Predator Mass (g)", ylab = "Prey Mass (g)") # Add labels
# par(fig=c(0,0.8,0.4,1), new=TRUE)
# boxplot(log(MyDF$Predator.mass), horizontal=TRUE, axes=FALSE)
# par(fig=c(0.55,1,0,0.8),new=TRUE)
# boxplot(log(MyDF$Prey.mass), axes=FALSE)
# mtext("Fancy Predator-prey scatterplot", side=3, outer=TRUE, line=-3)
# 
# pdf("../Records/Pred_Prey_Overlay.pdf", # Open blank pdf page using a relative path
#     11.7, 8.3) # These numbers are page dimensions in inches
# hist(log(MyDF$Predator.mass), # Plot predator histogram (note 'rgb')
#      xlab="Body Mass (g)", ylab="Count", col = rgb(1, 0, 0, 0.5), main = "Predator-Prey Size Overlap") 
# hist(log(MyDF$Prey.mass), # Plot prey weights
#      col = rgb(0, 0, 1, 0.5), 
#      add = T)  # Add to same plot = TRUE
# legend('topleft',c('Predators','Prey'), # Add legend
#        fill=c(rgb(1, 0, 0, 0.5), rgb(0, 0, 1, 0.5))) 
# graphics.off(); #you can also use dev.off() 

#--------------------------------------------------------------------


# 编写一个脚本，绘制并保存三个图形，每个图形包含捕食者质量、猎物质量以及按喂养交互类
# 型划分的猎物质量与捕食者质量的大小比的分布子图。 对所有三个图使用质量对数（或尺寸比）。
# 此外，该脚本应计算 csv 文件的（对数）平均和中值捕食者质量、猎物质量和捕食者-猎物大小比率。
# 
# 调用脚本 PP_Dists.R 并将其保存在代码目录中 — 获取或运行此脚本应生成三个文件，分别为 
# Pred_Subplots.pdf、Prey_Subplots.pdf 和 SizeRatio_Subplots.pdf（名称应该是不言自明的），
# 以及一个 csv 文件 PP_Results.csv 包含按饲养类型划分的捕食者质量、猎物质量和捕食者-猎物尺寸
# 比的平均值和中位数日志。 csv 文件应具有适当的标题（例如，喂养类型、平均值、中位数）。 
# （提示：您必须在脚本中初始化一个新的数据框或矩阵才能首先存储计算结果）
# 
# 该脚本应该是自给自足的，不需要任何外部输入。 它应该从适当的目录导入上述捕食者-猎物数据集，
# 并将图形保存到适当的目录（提示：使用相对路径！）。
# 
# 使用 par() 函数创建子图。 要按喂养类型计算体型统计数据，您可以使用“循环”方式 - 首先获取喂养
# 类型列表（查找唯一或级别函数），然后循环它们，使用子集通过喂养提取数据集 在每次迭代时键入，
# 或者使用 R 精通的方式，通过使用 tapply 或 ddply 并完全避免循环。 您还可以使用 tidyverse 和 
# dplyr 进行数据操作。
# 

##### Me: examine how many feeding interaction types are there: 

int_types <- MyDF$Type.of.feeding.interaction
int_types_uniq <- unique(int_types)
print(paste("int_types_uniq", int_types_uniq))   # 5 types: 
# [1] "int_types_uniq predacious/piscivorous" "int_types_uniq piscivorous"           
# [3] "int_types_uniq planktivorous"          "int_types_uniq predacious"            
# [5] "int_types_uniq insectivorous" 


########### distributions of predator mass: 

par(mfcol=c(2,3)) #initialize multi-paneled plot

# 1. predacious/piscivorous
par(mfg = c(1,1)) # specify which sub-plot to use first 
# get the rows which the feeding type is only predacious/piscivorous: 
MyDF_pred_pis <- subset(MyDF, MyDF$Type.of.feeding.interaction=="predacious/piscivorous")
print(paste("The number of rows in MyDF_pred_pis is ", nrow(MyDF_pred_pis)))

hist(log10(MyDF_pred_pis$Predator.mass),
     xlab = "log10(Predator Mass (g))", ylab = "Count", col = "lightblue", border = "pink", 
     main = 'Predator') # Add title     # bug here!! 

# 2. piscivorous

par(mfg = c(1,2)) # specify which sub-plot to use first 
# get the rows which the feeding type is only piscivorous: 
MyDF_pisci <- subset(MyDF, MyDF$Type.of.feeding.interaction=="piscivorous")
print(paste("The number of rows in MyDF_pisci is ", nrow(MyDF_pisci)))

hist(log10(MyDF_pisci$Predator.mass),
     xlab = "log10(Predator Mass (g))", ylab = "Count", col = "lightblue", border = "pink", 
     main = 'Predator') # Add title     # bug here!! 

# 3. planktivorous

par(mfg = c(1,3)) # specify which sub-plot to use first 
# get the rows which the feeding type is only planktivorous: 
MyDF_plank <- subset(MyDF, MyDF$Type.of.feeding.interaction=="planktivorous")
print(paste("The number of rows in MyDF_plank is ", nrow(MyDF_plank)))

hist(log10(MyDF_plank$Predator.mass),
     xlab = "log10(Predator Mass (g))", ylab = "Count", col = "lightblue", border = "pink", 
     main = 'Predator') # Add title     # bug here!! 

# 4. predacious



# 5. insectivorous


par(mfcol=c(2,1)) #initialize multi-paneled plot
par(mfg = c(1,1)) # specify which sub-plot to use first 
hist(log10(MyDF$Predator.mass),
     xlab = "log10(Predator Mass (g))", ylab = "Count", col = "lightblue", border = "pink", 
     main = 'Predator') # Add title


########### distributions of prey mass: 

# 1. predacious/piscivorous


par(mfcol=c(2,1)) #initialize multi-paneled plot
par(mfg = c(1,1)) # specify which sub-plot to use first 
hist(log10(MyDF$Prey.mass),
     xlab = "log10(Predator Mass (g))", ylab = "Count", col = "lightblue", border = "pink", 
     main = 'Predator') # Add title

# 2. piscivorous

# 3. planktivorous

# 4. predacious

# 5. insectivorous



########### distributions of the size ratio (of prey mass over predator mass): 

# 1. predacious/piscivorous

# 2. piscivorous

# 3. planktivorous

# 4. predacious

# 5. insectivorous












