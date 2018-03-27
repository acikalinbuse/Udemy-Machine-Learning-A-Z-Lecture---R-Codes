setwd("C:/Users/busea/Desktop/Machine Learning A-Z")
dataset <- read.csv("C:/Users/busea/Desktop/Machine Learning A-Z/Part 2 - Regression/Section 4 - Simple Linear Regression/Salary_Data.csv")

library(readr)

View(dataset)


#Splitting the dataset into the training set and test set
install.packages('caTools')
library(caTools)

set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
View(split)
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)
View(training_set)
View(test_set)

regressor = lm(formula = Salary ~ YearsExperience,
               data=training_set)

y_pred = predict(regressor, newdata = test_set)

install.packages('ggplot2')
library(ggplot2)
#training
ggplot() +
  geom_point(aes(x= training_set$YearsExperience , y=training_set$Salary),
             colour='red') +
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata = training_set)),
            colour='blue') +
  ggtitle('Salary vs Experience (training set)') +
  xlab('Years of experience') +
  ylab('salary')

#test
ggplot() +
  geom_point(aes(x= test_set$YearsExperience , y=test_set$Salary),
             colour='red') +
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata = training_set)),
            colour='blue') +
  ggtitle('Salary vs Experience (test_set)') +
  xlab('Years of experience') +
  ylab('salary')