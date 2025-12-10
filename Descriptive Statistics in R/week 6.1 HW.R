
library(ggplot2)

evals <- read.csv("C:\\Users\\forea\\OneDrive\\Documents\\DSS 445 R Statistical Programming Lang/evals.csv",header=T)

#Problem 1
head(evals)
mean(evals$age)
sd(evals$age)
var(evals$age)
median(evals$age)

summary(evals$age)

hist(evals$age,
     main = "Histogram of Ages",
     xlab = "Age (in years)",
     ylab = "Frequency",
     xlim = c(25,85),
     col = c(1:10))

# Ages range from late 20s to early 70s; with the avg being 48. The histogram
# seems to have a fairly normal distribution, and the length of the dataset is 463.

ggplot(evals, aes(age)) +
  geom_histogram(binwidth = 5, fill = c(1:10), color = "black") +
  labs(title = "Distribution of Professors' Ages",
       x = "Age (Years)",
       y = "Frequency")

#Problem 2

plot(evals$score, evals$age,
     xlab = "Course Evaluation Score",
     ylab = "Age (in years)",
     main = "Score VS Age (of Professors)",
     xlim = c(1,5),
     ylim = c(20,80),
     pch = 16, 
     col = "aquamarine3")
# Visually, it looks like most professors receive in between a 3-5 score.
# Regarding age, it looks pretty even across the board.
?colors
colors (distinct = FALSE)
?pch

cor.test(evals$score, evals$age)
#There is a weak but significant negative association 
#between professor age and course evaluation score:
#older professors tend to receive slightly lower scores

ggplot(evals, aes(x = age, y = score)) +
  geom_point(color = "darkgreen") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Course Evaluation Score vs Professor Age",
       x = "Age (Years)",
       y = "Evaluation Score")

# Problem 3
boxplot(score ~ language , data = evals,
        main = "Boxplot of Score by Native Language",
        xlab = "Language",
        ylab = "Course Evaluation Score",
        col = c(2:3))

hist(evals$score[evals$language == "english"],
     col = "blue", 
     xlim = c(1,5),
     ylim = c(0,80),
     xlab = "Course Evaluation Score",
     ylab = "Frequency",
     main = "Histogram of Scores When Prof. Native Language is English")

win.graph()

hist(evals$score[evals$language == "non-english"],
     col = 'hotpink3', 
     xlim = c(3,5),
     ylim = c(0,15),
     xlab = "Course Evaluation Score",
     ylab = "Frequency",
     main = "Histogram of Scores When Prof. Native Language is Non-English")

ggplot(evals, aes(x = language, y = score, fill = language)) +
  geom_boxplot() +
  labs(title = "Course Evaluation Scores by Native Language",
       x = "Native Language",
       y = "Evaluation Score") +
  scale_fill_manual(values = c("skyblue", "pink"))

# Visually, there does appear to be a difference in score when compared
# to the professors native language. non-English native speaker have a lower score
# then professors whose native language is English.

mean(evals$score[evals$language == "english"])
mean(evals$score[evals$language == "non-english"])

median(evals$score[evals$language == "non-english"])
median(evals$score[evals$language == "english"])

tapply(evals$score, evals$language, mean, na.rm = TRUE)

t.test(evals$score ~ evals$language, na.rm = TRUE)
# English native speaking Professors score slightly, but statistically significantly 
# higher then professors that are non-English native speakers. 

# Problem 4
gender_table <- table(evals$gender)

gender_matrix <- matrix(gender_table, nrow = 1)

rownames(gender_matrix) <- c("Num_of_Prof.")
colnames(gender_matrix) <- c("Female", "Male")
gender_matrix

barplot(gender_table,
        main = "Number of Professors by Gender",  
        xlab = "Gender",                          
        ylab = "Number of Professors",           
        col  = c("red4", "purple4"),           
        ylim = c(0, 300))

195 + 268
268/463
195/463
# Male professors outnumber female professors with male professors making up 57% 
# of the data set and female professor making up 42%.

# Problem 5
rank_level <- table(evals$rank, evals$cls_level)
rank_level

barplot(rank_level,
        beside = TRUE,                     
        col = c(2:4),     
        main = "Rank vs. Course",  
        xlab = "Rank of Professor",
        ylab = "Number of Courses",
        ylim = c(0,250),
        legend.text = TRUE)

# Seems that in the lower and upper levels, tenured professors make up the 
# majority of the courses. As for teaching and tenure track; in the lower ranked professors,
# teaching professors have more courses. In the upper level, tenure track professor have
# more courses.
