setwd("C:/Users/busea/Desktop/Machine Learning A-Z")
Data <- read.csv("C:/Users/busea/Desktop/Machine Learning A-Z/Part 1 - Data Preprocessing/Data.csv")

library(readr)

View(Data)

#Taking care of missing data
Data$Age = ifelse(is.na(Data$Age), ave(Data$Age, FUN = function(x) mean(x, na.rm = TRUE)), Data$Age)
Data$Salary = ifelse(is.na(Data$Salary), ave(Data$Salary, FUN = function(x) mean(x, na.rm = TRUE)), Data$Salary)
View(Data)

#Encoding Categorical Data
Data$Country=factor(Data$Country, levels = c('France', 'Spain', 'Germany'), labels=c(1, 2, 3))
Data$Purchased=factor(Data$Purchased, levels = c('No', 'Yes'), labels=c(0,1))
View(Data)



