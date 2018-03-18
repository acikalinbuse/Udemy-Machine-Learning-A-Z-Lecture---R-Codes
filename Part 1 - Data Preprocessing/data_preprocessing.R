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

#Splitting the dataset into the training set and test set
install.packages('caTools')
library(caTools)

set.seed(123)
split = sample.split(Data$Purchased, SplitRatio = 0.8)
View(split)
training_set = subset(Data, split==TRUE)
test_set = subset(Data, split==FALSE)
View(training_set)
View(test_set)

#Feature Scaling
training_set[, 2:3]= scale(traing_set[, 2:3])
test_set[, 2:3]= scale(test_set[, 2:3])
View(training_set)
View(test_set)