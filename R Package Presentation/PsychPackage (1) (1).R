library(psych)
data(bfi)

# get the first few observations to see what the data set looks like
head(bfi)

#Demo: Perform factor analysis to retrieve the latent table and individual personality trait 
# descriptive statistics
describe(bfi)

# include only the first five personality items
corPlot(bfi[,1:5]) # makes a correlation heat map

# makes a correlation map and scatter plot of first 3 BFI Items
pairs.panels(bfi[,1:3],
             col = "blue",
             pch = 19,
             main = "Correlation and Scatterplot of First 3 BFI Items")

# Include only the 25 personality items
bfi_items <- bfi[,1:25]

fa_result <- fa(bfi_items, nfactors = 5)   #set the factors to 5 (the Big Five Factors)

#retrieve the latent table
#rename factors to the correspondent factor
colnames(fa_result$loadings) <- c("Neuroticism", "Extraversion", "Conscientiousness", "Agreeableness", "Openness")
fa.diagram(fa_result)

#retrieve individual trait score 
colnames(fa_result$scores) <- c("Neuroticism", "Extraversion", "Conscientiousness", "Agreeableness", "Openness")
trait_scores <- fa_result$scores
trait_scores
