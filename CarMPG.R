carData <- read.csv("C:/Users/aljas/OneDrive/Documents/Development/R/CarMPG/Cars.csv", header = TRUE)
summary(carData)

Multiple_Model_forLR <- lm(mpg~.,data = carData)
summary(Multiple_Model_forLR)
# Split the data to train and test 
install.packages("caTools")
set.seed(0)
split= sample.split(carData, SplitRatio = 0.8)
trainingSet = subset(carData, split == TRUE)
testSet= subset(carData, split == FALSE)

training_a_LR = lm(mpg~., data = trainingSet)
train_a = predict(training_a_LR, trainingSet)
test_a = predict(training_a_LR, testSet)
mean((trainingSet$mpg - train_a)^2)
mean((testSet$mpg - test_a)^2)

