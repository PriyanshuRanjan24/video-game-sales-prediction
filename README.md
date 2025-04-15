# 🎮 Video Game Sales Prediction

This project utilizes R to predict and analyze global video game sales. It includes data preprocessing, exploratory data analysis (EDA), clustering, and regression models to forecast sales trends across different regions.

---

## 📁 Project Structure

video-game-sales-prediction/ ├── output_graphs/ # Folder containing the visualizations in PNG format │ ├── Linear Regression.png # Linear regression model output visualization │ ├── Decision Tree visualization.png # Decision tree model visualization │ ├── Cluster Plot for VG Sales Data.png # Cluster plot of the video game sales data │ └── RMSE Comparison.png # Comparison of Root Mean Squared Error (RMSE) for different models ├── vgsales.csv # Original dataset containing video game sales data ├── video_game_sales.R # Main R script for data preprocessing, analysis, and modeling └── README.md

---

## 📊 **Dataset**

- **Source**: [Kaggle - Video Game Sales with Ratings](https://www.kaggle.com/datasets/gregorut/videogamesales)
- **Features**:
  - `Name`, `Platform`, `Year_of_Release`, `Genre`, `Publisher`
  - `NA_Sales`, `EU_Sales`, `JP_Sales`, `Other_Sales`, `Global_Sales`

---

## 🛠 **Tools & Libraries**

- **Language**: R
- **Libraries Used**:
  - `ggplot2` - Data visualization
  - `dplyr` - Data manipulation
  - `rpart` - Decision tree modeling
  - `cluster` - Clustering analysis
  - `ggdendro` - Dendrogram visualization

---

## 📈 **Methodology**

### 🔹 **Data Preprocessing**
- Handled missing values
- Filtered relevant columns
- Converted data types appropriately

### 🔹 **Exploratory Data Analysis (EDA)**
- Visualized sales distributions
- Identified top-selling genres and platforms

### 🔹 **Clustering**
- Performed hierarchical clustering to group similar games based on sales patterns

### 🔹 **Regression Modeling**
- Implemented linear regression to predict global sales
- Built decision tree models for regional sales predictions

---

## 📊 **Visualizations**

- **📉 Linear Regression Output**  
  ![Linear Regression](output_graphs/Linear_Regression.png)

- **🌲 Decision Tree Model**  
  ![Decision Tree Visualization](output_graphs/Decision_Tree_visualization.png)

- **🔗 Clustering Dendrogram**  
  ![Cluster Plot VG Sales Data](output_graphs/Cluster_Plot_for_VG_Sales_Data.png)

- **📏 RMSE Comparison**  
  ![RMSE Comparison](output_graphs/RMSE_Comparison.png)

---

## 📌 **Conclusion**

The project successfully demonstrates the application of machine learning techniques in R to predict video game sales. Through clustering and regression models, it provides insights into sales trends across different regions, aiding in strategic decision-making for game publishers.
