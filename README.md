🎮 Video Game Sales Prediction
This project utilizes R to predict and analyze global video game sales. It encompasses data preprocessing, exploratory data analysis (EDA), clustering, and regression models to forecast sales trends across different regions.

📁 Project Structure
bash
Copy
Edit
video-game-sales-prediction/
├── video_game_sales.R              # Main R script
├── cleaned_dataset.csv             # Cleaned dataset
├── output_graphs/                  # Visualizations (PNG format)
│   ├── linear_regression.png
│   ├── decision_tree.png
│   └── cluster_dendrogram.png
└── README.md                       # Project overview
📊 Dataset
Source: Kaggle - Video Game Sales with Ratings

Features:

Name, Platform, Year_of_Release, Genre, Publisher

NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales

🛠 Tools & Libraries
R: Core programming language

Libraries:

ggplot2: Data visualization

dplyr: Data manipulation

rpart: Decision tree modeling

cluster: Clustering analysis

ggdendro: Dendrogram visualization

📈 Methodology
Data Preprocessing:

Handled missing values

Filtered relevant columns

Converted data types appropriately

Exploratory Data Analysis (EDA):

Visualized sales distributions

Identified top-selling genres and platforms

Clustering:

Performed hierarchical clustering to group similar games based on sales patterns

Regression Modeling:

Implemented linear regression to predict global sales

Built decision tree models for regional sales predictions

📊 Visualizations
Linear Regression Output

Decision Tree Model

Clustering Dendrogram

📌 Conclusion
The project successfully demonstrates the application of machine learning techniques in R to predict video game sales. Through clustering and regression models, it provides insights into sales trends across different regions, aiding in strategic decision-making for game publishers.
