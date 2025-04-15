# Select your dataset
data <- read.csv(file.choose()) 
# Load the dataset 
str(data)  # Check the structure of the dataset 
View(data)  # View the dataset in a table format 
# Load necessary libraries  
library(tidyverse) 
library(rpart) 
library(rpart.plot) 
library(caret) 
library(e1071) 
library(cluster) 
library(ggplot2) 
# Remove rows with missing values (if any) 
data <- na.omit(data) 
# Normalize the data (scaling numeric predictors) 
preproc <- preProcess(data[, c("NA_Sales", "EU_Sales", "JP_Sales", "Other_Sales")],   
                      method = c("center", "scale")) 
data_normalized <- predict(preproc, data) 
# Split data into training and test sets 
set.seed(123)  # For reproducibility 
train_index <- createDataPartition(data_normalized$Global_Sales, p = 0.8, list = FALSE) 
train_data <- data_normalized[train_index, ] 
test_data <- data_normalized[-train_index, ] 
### Linear Regression Model ### 
lm_model <- lm(Global_Sales ~ NA_Sales + EU_Sales + JP_Sales + Other_Sales, data = 
                 train_data) 
lm_predictions <- predict(lm_model, newdata = test_data) 
lm_rmse <- RMSE(lm_predictions, test_data$Global_Sales) 
print(paste("Linear Regression Test RMSE:", lm_rmse)) 
# Create a data frame with actual vs. predicted values for the test set 
lm_results <- data.frame( 
  Actual = test_data$Global_Sales, 
  Predicted = lm_predictions 
) 
# Plotting actual vs predicted values 
ggplot(lm_results, aes(x = Actual, y = Predicted)) +  
  geom_point(color = "blue", alpha = 0.6) +                 
  geom_abline(intercept = 0, slope = 1, color = "red") +    
  labs( 
    title = "Linear Regression: Actual vs. Predicted Global Sales",  
    x = "Actual Global Sales",  
    y = "Predicted Global Sales" 
  ) +  
  theme_minimal() +  
  theme(plot.title = element_text(hjust = 0.5)) 
### Decision Tree Model ### 
tree_model <- rpart(Global_Sales ~ NA_Sales + EU_Sales + JP_Sales + Other_Sales,  
                    data = train_data, method = "anova") 
tree_predictions <- predict(tree_model, newdata = test_data) 
tree_rmse <- RMSE(tree_predictions, test_data$Global_Sales) 
print(paste("Decision Tree Test RMSE:", tree_rmse)) 
# Plot the decision tree 
rpart.plot(tree_model) 
### k-Nearest Neighbors Model ### 
train_control <- trainControl(method = "cv", number = 10) 
knn_model <- train(Global_Sales ~ NA_Sales + EU_Sales + JP_Sales + Other_Sales,  
                   data = train_data, method = "knn", trControl = train_control, tuneLength = 10) 
knn_predictions <- predict(knn_model, newdata = test_data) 
knn_rmse <- RMSE(knn_predictions, test_data$Global_Sales) 
print(paste("k-NN Test RMSE:", knn_rmse)) 
# Summary of model performances 
cat("\nRMSE Comparison:\n") 
cat("Linear Regression RMSE:", lm_rmse, "\n") 
cat("Decision Tree RMSE:", tree_rmse, "\n") 
cat("k-NN RMSE:", knn_rmse, "\n") 
# Consolidate results into a data frame for easy comparison and visualization 
comparison_df <- data.frame( 
  Model = c("Linear Regression", "Decision Tree", "k-Nearest Neighbors"), 
  RMSE = c(lm_rmse, tree_rmse, knn_rmse) 
) 
# Print the comparison data frame 
print(comparison_df) 
# Visualize RMSE values 
ggplot(comparison_df, aes(x = Model, y = RMSE, fill = Model)) +  
  geom_bar(stat = "identity", position = "dodge") +  
  labs(title = "Model RMSE Comparison", y = "RMSE") +  
  theme_minimal() +  
  theme(legend.position = "none") 
### Hierarchical Clustering and Clusplot Visualization ### 
# Select relevant numeric features for clustering 
clustering_data <- data_normalized[, c("NA_Sales", "EU_Sales", "JP_Sales", 
                                       "Other_Sales")] 
# Calculate the Euclidean distance matrix 
distance_matrix <- dist(clustering_data, method = "euclidean") 
# Apply hierarchical clustering using Ward's method 
hc_model <- hclust(distance_matrix, method = "ward.D2") 
# Set the desired number of clusters, say k = 4 
k <- 4 
clusters <- cutree(hc_model, k = k) 
# Add cluster assignments to the data frame 
data_normalized$Cluster <- as.factor(clusters) 
# Clusplot for cluster visualization 
clusplot(data_normalized[, c("NA_Sales", "EU_Sales", "JP_Sales", "Other_Sales")],  
         data_normalized$Cluster, color = TRUE, shade = TRUE, labels = 2, lines = 0,  
         main = "Cluster Plot for Video Game Sales Data") 
# Print summary of clusters 
cat("Cluster Summary:\n") 
print(table(data_normalized$Cluster))

