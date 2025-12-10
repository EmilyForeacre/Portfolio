
library(ggplot2)

cars <- read.csv("C:\\Users\\forea\\OneDrive\\Documents\\DSS 445 R Statistical Programming Lang\\Honda_Civic_price.csv")
head(cars)
summary(cars)


model_linear_simple <- lm(Price ~ Mileage, data = cars)
summary(model_linear_simple)


plot(cars$Mileage, cars$Price,
     main= "Price vs Mileage",
     xlab= "Mileage", ylab = "Price",
     pch = 19)
abline(model_linear_simple, col = "red", lwd = 2)


anova(model_linear_simple)

new_df <- data.frame(Mileage = c(15713, 27894)) ## these numbers were taken straight from the example from the previous class
predict(model_linear_simple, newdata = new_df)

new_df <- data.frame(Mileage = c(8000, 58000)) ##but you can change it to any amount of miles
predict(model_linear_simple, newdata = new_df)


hist(cars$Mileage,
     main = "Distribution of Car Mileage",
     xlab = "Mileage",
     col = "pink")


boxplot(Price ~ Age, data = cars,
        main = "Boxplot of Price of Cars by Age",
        xlab = "Age",
        ylab = "Price",
        col = c(2:9))

#MLR 
model_linear_multi <- lm(Price ~ Mileage + Age + Year, data = cars)
summary(model_linear_multi)

ggplot(cars, aes(x = Mileage, y = Price, color = factor(Age))) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "Price vs Mileage by Age",
       x = "Mileage",
       y = "Price") +
  theme_minimal()

anova(model_linear_multi)

new_df2 <- data.frame(
  Mileage = c(15713, 27894),
  Age = c(2, 3),        # Example ages
  Year = c(2007, 2008)  # Example years
)

predict(model_linear_multi, newdata = new_df2)





