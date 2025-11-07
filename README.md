# 🛒 Supply Chain & Sales Performance Dashboard

A **Power BI dashboard** designed to visualize and monitor **key sales and supply chain performance metrics** for a global retail company.  
The report helps stakeholders track business operations, product performance, and customer behavior—supporting data-driven decision-making in sales and logistics management.

## 📈 Dashboard Preview

![Dashboard Preview](https://drive.google.com/uc?export=view&id=1o5-vCvvzL6vB3Zq0UCpgW8voKKxKjzXz)

## 📊 Key Features

- **Total sales and profit over time**  
- **Supply chain performance by region**  
- **Sales performance by region and category**  
- **Cohort retention analysis using SQL**  
- **Interactive filters for drill-down analysis**  
- **Visual storytelling with retail KPIs**
- 
## 🧹 Data Preparation & Modeling

The dashboard was built from a **single raw CSV file**, which was **transformed into a star schema model** consisting of six tables:

- **Fact_Orders** – Central fact table containing order details (sales, profit, quantity, discount, etc.)  
- **Dim_Customer** – Customer demographics and membership information  
- **Dim_Product** – Product catalog including name, category  
- **Dim_Ship_Mode** – Shipping methods and delivery details  
- **Dim_Geography** – Region and country information
- **Dim_Date** – Calendar table containing date, month, quarter, and year attributes for time-based analysis 

All **data modeling** and **transformations** were done in **Power Query** and **Power BI**, ensuring:

- Clean and standardized data formats  
- Proper key relationships between dimensions and fact tables  
- Accurate DAX measures for KPIs such as total sales, profit, and delivery time  
- Structured star schema for efficient analysis and performance  

## 📁 Tools & Technologies

- **Power BI** – Data modeling, visualization, and DAX calculations  
- **Power Query** – ETL workflows and data transformation  
- **SQL** – Cohort retention analysis
- **Power BI Relationship Diagram** – Optimized star schema design  
- **Business-focused report layout** for intuitive navigation and storytelling  

## 🧠 Key Insights

- The **overall supply chain performance** is influenced by **long delivery times in the Central region** and **high return rates in the West region**.  
- **Technology** remains the **main revenue driver**, but requires **stronger quality control and after-sales service** to reduce returns.  
- **Cohort retention analysis** indicates that the **first three months after a customer’s initial purchase** are the most critical, showing the lowest retention rates.  
- **Optimizing shipping modes** and **enhancing early-stage customer experience** can significantly **increase profitability**, **reduce returns**, and **improve operational efficiency**.
