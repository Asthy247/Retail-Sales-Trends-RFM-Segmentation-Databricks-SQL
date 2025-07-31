# Retail Sales Trends & RFM Segmentation (Databricks SQL)

**Project Overview**

This project performs a comprehensive analysis of retail sales data using SQL within the Databricks environment. The primary goals are to:

Clean and transform raw sales data into a structured format.

Identify key sales trends and patterns over time (monthly, daily, day-of-week).

Evaluate the performance of different product categories and demographics.

Segment customers based on their purchasing behavior using RFM (Recency, Frequency, Monetary) analysis to enable targeted marketing strategies.



**Business Problem**

Retail businesses often face challenges in understanding their sales performance, identifying effective marketing strategies, and retaining valuable customers. Without clear, data-driven insights, decisions regarding inventory, promotions, and customer engagement can be inefficient and lead to missed opportunities or declining revenue. Key questions addressed by this project include:

What are the underlying sales trends and seasonal patterns?

Which products and customer demographics drive the most revenue?

How can customers be effectively segmented to personalize marketing efforts?

Which customers are at risk of churning, and who are the most loyal?



**Solution**

This project provides a robust, SQL-based solution to address these challenges by transforming raw transactional data into actionable business intelligence. By leveraging Databricks SQL Editor and the Serverless Starter Warehouse, the analysis delivers:

Clean and Structured Data: A reliable foundation for all subsequent analysis.

Granular Sales Trends: Insights into daily, weekly, and monthly sales fluctuations and patterns.

Performance Insights: Identification of top-performing product categories and key demographic segments.

Actionable Customer Segmentation: RFM analysis to categorize customers into distinct groups (e.g., Champions, At Risk, Loyal Customers), enabling highly targeted marketing and retention strategies.

The visualizations and derived insights empower businesses to make informed decisions, optimize operations, and enhance customer relationships.




**Tools Used:**

Databricks SQL Editor

Databricks Serverless Starter Warehouse

SQL (for data manipulation, aggregation, and analysis)




**Data Source:**

The dataset used for this analysis is a publicly available Retail Sales Dataset from Kaggle. It contains transactional data including customer details, product information, quantities, prices, and transaction dates.




**Project Structure**
The analysis is structured into several key phases, each documented with SQL scripts and visualizations.




**1. Data Cleaning & Initial Transformation**
This initial step involved loading the raw retail sales data and performing essential cleaning and transformation to ensure data quality and usability for downstream analysis. This included:

Renaming columns for better readability and SQL compatibility.

Casting columns to appropriate data types (e.g., DATE, INT, DECIMAL).

Handling potential NULL values and invalid entries (e.g., quantities/prices less than or equal to zero).

Deriving new time-based features such as OrderYear, OrderMonth, and OrderDayOfWeek for time-series analysis.




**SQL Script: SQL_scripts/01_sales_cleaned.sql**

-- Replace this with the actual SQL code from your 01_sales_cleaned.sql file
-- Example structure:
-- CREATE OR REPLACE TABLE sales_cleaned AS
-- SELECT
--     `Transaction ID` AS TransactionID,
--     CAST(Date AS DATE) AS OrderDate,
--     `Customer ID` AS CustomerID,
--     Gender,
--     Age,
--     `Product Category` AS ProductCategory,
--     CAST(Quantity AS INT) AS Quantity,
--     CAST(`Price per Unit` AS DECIMAL(10,2)) AS PricePerUnit,
--     CAST(`Total Amount` AS DECIMAL(10,2)) AS TotalAmount,
--     YEAR(CAST(Date AS DATE)) AS OrderYear,
--     MONTH(CAST(Date AS DATE)) AS OrderMonth,
--     DAYOFWEEK(CAST(Date AS DATE)) AS OrderDayOfWeek
-- FROM
--     retail_sales_dataset
-- WHERE
--     CAST(Quantity AS INT) IS NOT NULL
--     AND CAST(`Price per Unit` AS DECIMAL(10,2)) IS NOT NULL
--     AND CAST(`Total Amount` AS DECIMAL(10,2)) IS NOT NULL
--     AND CAST(Quantity AS INT) > 0
--     AND CAST(`Price per Unit` AS DECIMAL(10,2)) > 0;

-- SELECT * FROM sales_cleaned LIMIT 10;

Resulting Table (Sales_Cleaned):
![Sales_Cleaned table snapshot](Screenshots/SQL Table Results/Sales_Cleaned_table.png)
Insight: This table represents the clean and transformed dataset, ready for analysis. It includes standardized column names, correct data types, and derived time components, ensuring consistency and accuracy for subsequent aggregations and insights.


2. Exploratory Data Analysis (EDA) & Aggregation
In this phase, various summary tables were created to aggregate the cleaned data and derive key performance indicators, providing insights into different aspects of the retail business. Each summary table is accompanied by a relevant visualization.

Monthly Sales Trends
This analysis provides an overview of sales performance on a monthly basis, allowing us to identify seasonal patterns and overall growth.

SQL Script: SQL_scripts/02_monthly_sales_summary.sql

-- Replace this with the actual SQL code from your 02_monthly_sales_summary.sql file
-- Example structure:
-- CREATE OR REPLACE TABLE monthly_sales_summary AS
-- SELECT
--     YEAR(OrderDate) AS OrderYear,
--     MONTH(OrderDate) AS OrderMonth,
--     SUM(TotalAmount) AS MonthlySales,
--     COUNT(DISTINCT TransactionID) AS TotalTransactions,
--     SUM(TotalAmount) - SUM(Quantity * PricePerUnit * 0.5) AS MonthlyProfit -- Example profit calculation if cost is 50% of price
-- FROM
--     sales_cleaned
-- GROUP BY
--     OrderYear, OrderMonth
-- ORDER BY
--     OrderYear, OrderMonth;

-- SELECT * FROM monthly_sales_summary;

Resulting Table (Monthly_Sales_Summary):
![Monthly_Sales_Summary Table](Screenshots/SQL Table Results/Monthly_Sales_Summary.png)
Insight: This table aggregates total sales and other metrics by month and year. It provides the foundational data to observe month-over-month sales fluctuations and identify potential seasonality or growth trends before visualization.

Visualization: Monthly Sales Trend
![Monthly Sales Trend](Screenshots/Charts and Visualizations/Monthly Sales Trend.png)
Insight: The line chart for monthly sales clearly illustrates fluctuating trends over time, with noticeable peaks and dips. This pattern suggests strong seasonality in retail purchases, which can inform inventory management and marketing campaign timing. For instance, if peaks occur consistently in November and December, these periods could be targeted for increased promotional activity.


Product Category Performance
This analysis highlights the sales contribution of different product categories, identifying top-performing and underperforming segments.

SQL Script: SQL_scripts/03_product_category_summary.sql

-- Replace this with the actual SQL code from your 03_product_category_summary.sql file
-- Example structure:
-- CREATE OR REPLACE TABLE product_category_summary AS
-- SELECT
--     ProductCategory,
--     SUM(TotalAmount) AS TotalCategorySales,
--     COUNT(DISTINCT TransactionID) AS TotalTransactions,
--     SUM(Quantity) AS TotalUnitsSold
-- FROM
--     sales_cleaned
-- GROUP BY
--     ProductCategory
-- ORDER BY
--     TotalCategorySales DESC;

-- SELECT * FROM product_category_summary;

Resulting Table (Product Category Summary):
![Product Category Summary table snapshot](Screenshots/SQL Table Results/Product Category Summary.png)
Insight: This table provides a ranked list of product categories by their total sales. It's crucial for quickly identifying which product lines are the primary revenue drivers and which might require more attention or different strategies.

Visualization: Product Category Sales
![Product Category Sales Chart](Screenshots/Charts and Visualizations/Product Category Sales.png)
Insight: The bar chart clearly shows that Electronics and Clothing emerge as the leading product categories by total sales, indicating strong customer preference and market demand in these areas. Beauty follows, suggesting it's a significant, but potentially underperforming, category where targeted promotions or product diversification could yield growth.


Customer Segment Summary (Top Spenders)
This table identifies customers with the highest total spending, useful for understanding high-value customer behavior.

SQL Script: SQL_scripts/04_customer_segment_summary_fix.sql

-- Replace this with the actual SQL code from your 04_customer_segment_summary.sql file
-- Example structure:
-- CREATE OR REPLACE TABLE customer_segment_summary AS
-- SELECT
--     CustomerID,
--     SUM(TotalAmount) AS TotalCustomerSpend,
--     COUNT(DISTINCT TransactionID) AS NumberOfTransactions,
--     AVG(TotalAmount / Quantity) AS AveragePricePerUnit
-- FROM
--     sales_cleaned
-- GROUP BY
--     CustomerID
-- ORDER BY
--     TotalCustomerSpend DESC
-- LIMIT 100;

-- SELECT CustomerID, TotalCustomerSpend FROM customer_segment_summary ORDER BY TotalCustomerSpend DESC LIMIT 20;

Resulting Table (Top 20 Customer Spend):
![Top 20 Customers table snapshot](Screenshots/SQL Table Results/Top 20 Customers.png)
Insight: This table lists individual customers by their total spending, ordered from highest to lowest. It allows for the direct identification of top-tier customers, providing a foundation for loyalty programs or personalized outreach to reward and retain them.


Sales Performance by Gender and Age Group
This analysis segments sales data by customer demographics, revealing how different age groups and genders contribute to overall revenue.

SQL Script: SQL_scripts/05_sales_by_demographics.sql

-- Replace this with the actual SQL code from your 05_sales_by_demographics.sql file
-- Example structure:
-- CREATE OR REPLACE TABLE sales_by_demographics AS
-- SELECT
--     Gender,
--     CASE
--         WHEN Age < 25 THEN 'Under 25'
--         WHEN Age BETWEEN 25 AND 34 THEN '25-34'
--         WHEN Age BETWEEN 35 AND 44 THEN '35-44'
--         WHEN Age BETWEEN 45 AND 54 THEN '45-54'
--         ELSE '55+'
--     END AS AgeGroup,
--     SUM(TotalAmount) AS TotalSales,
--     COUNT(DISTINCT CustomerID) AS UniqueCustomers,
--     COUNT(DISTINCT TransactionID) AS TotalTransactions
-- FROM
--     sales_cleaned
-- GROUP BY
--     Gender, AgeGroup
-- ORDER BY
--     Gender, AgeGroup;

-- SELECT * FROM sales_by_demographics;

Resulting Table (sales_by_demographics):
![Sales Performance by Gender and Age Group table snapshot](Screenshots/SQL Table Results/Sales Performance by Gender and Age Group.png)
Insight: This table provides a detailed breakdown of total sales, unique customers, and total transactions across various age groups and genders. It's essential for understanding which demographic segments are most lucrative and how sales are distributed among them.

Visualization: Sales Performance by Gender and Age Group
![Sales Performance by Gender and Age Group Chart](Screenshots/Charts and Visualizations/Sales Performance by Gender and Age Group.png)
Insight: The stacked bar chart effectively visualizes that the 25-34 and 35-44 age groups contribute most significantly to overall sales, with Female customers consistently showing higher spending across most age segments. This insight is crucial for tailoring marketing content and product recommendations to resonate with these high-value demographic groups.


Product Category Performance by Gender
This analysis delves into which product categories are more popular among specific genders, helping to tailor product offerings and marketing messages.

SQL Script: SQL_scripts/06_category_sales_by_gender.sql

-- Replace this with the actual SQL code from your 06_category_sales_by_gender.sql file
-- Example structure:
-- CREATE OR REPLACE TABLE category_sales_by_gender AS
-- SELECT
--     ProductCategory,
--     Gender,
--     SUM(TotalAmount) AS TotalSales,
--     SUM(Quantity) AS TotalUnitsSold
-- FROM
--     sales_cleaned
-- GROUP BY
--     ProductCategory, Gender
-- ORDER BY
--     ProductCategory, Gender;

-- SELECT * FROM category_sales_by_gender;

Resulting Table (category_sales_by_gender):
![Product Category Performance by Gender table snapshot](Screenshots/SQL Table Results/Product Category Performance by Gender.png)
Insight: This table breaks down sales and units sold by product category for each gender. It allows for a granular understanding of gender-specific preferences within product categories, which is vital for precise inventory planning and targeted advertising.

Visualization: Product Category Sales by Gender
![Product Category Performance by Gender Chart](Screenshots/Charts and Visualizations/Product Category Performance by Gender.png)
Insight: The bar chart confirms that Electronics and Clothing remain the top categories, but it further reveals that Female customers show a higher overall spend in most categories compared to Male customers. This granular insight suggests opportunities for gender-specific product promotions and inventory adjustments within each category.



Sales by Day of Week
This analysis identifies which days of the week are most popular for purchases, helping optimize staffing and marketing schedules.

SQL Script: SQL_scripts/08_sales_by_day_of_week.sql

-- Replace this with the actual SQL code from your 08_sales_by_day_of_week.sql file
-- Example structure:
-- CREATE OR REPLACE TABLE sales_by_day_of_week AS
-- SELECT
--     OrderDayOfWeek,
--     CASE
--         WHEN OrderDayOfWeek = 1 THEN 'Sunday'
--         WHEN OrderDayOfWeek = 2 THEN 'Monday'
--         WHEN OrderDayOfWeek = 3 THEN 'Tuesday'
--         WHEN OrderDayOfWeek = 4 THEN 'Wednesday'
--         WHEN OrderDayOfWeek = 5 THEN 'Thursday'
--         WHEN OrderDayOfWeek = 6 THEN 'Friday'
--         WHEN OrderDayOfWeek = 7 THEN 'Saturday'
--     END AS DayName,
--     SUM(TotalAmount) AS TotalSales,
--     COUNT(DISTINCT TransactionID) AS TotalTransactions
-- FROM
--     sales_cleaned
-- GROUP BY
--     OrderDayOfWeek, DayName
-- ORDER BY
--     OrderDayOfWeek;

-- SELECT * FROM sales_by_day_of_week;

Resulting Table (Sales by Day of Week):
![Sales by Day of Week Table](Screenshots/SQL Table Results/Sales by Day of Week.png)
Insight: This table aggregates total sales and transactions by each day of the week, ordered chronologically. It clearly highlights which days are the most active for sales, providing data-driven insights for operational planning.

Visualization: Sales by Day of Week
![Sales by Day of Week Chart](Screenshots/Charts and Visualizations/Sales by Day of Week.png)
Insight: The bar chart clearly indicates that Friday and Saturday consistently show the highest sales volume, confirming weekends as peak shopping periods. This information is crucial for optimizing staffing levels, scheduling promotions, and focusing online advertising efforts to capitalize on increased customer activity during these days.



3. Advanced Analysis: RFM Customer Segmentation
To gain a deeper understanding of customer behavior and identify high-value segments, an RFM (Recency, Frequency, Monetary) analysis was performed. This involved calculating RFM values, assigning scores, and then categorizing customers into distinct segments.

Step 1: Calculating RFM Values
This step calculates the Recency (days since last purchase), Frequency (number of unique transactions), and Monetary (total spend) for each customer.

SQL Script: SQL_scripts/09_rfm_step1_base.sql

-- Replace this with the actual SQL code from your 09_rfm_step1_base.sql file
-- Example structure:
-- CREATE OR REPLACE TABLE customer_rfm_base AS
-- WITH SnapshotDate AS (
--     SELECT MAX(OrderDate) AS latest_date FROM sales_cleaned
-- ),
-- CustomerRFM AS (
--     SELECT
--         CustomerID,
--         DATEDIFF((SELECT latest_date FROM SnapshotDate), MAX(OrderDate)) AS Recency,
--         COUNT(DISTINCT TransactionID) AS Frequency,
--         SUM(TotalAmount) AS Monetary
--     FROM
--         sales_cleaned
--     GROUP BY
--         CustomerID
-- )
-- SELECT * FROM CustomerRFM;

-- SELECT * FROM customer_rfm_base LIMIT 10;

Resulting Table (Customer_rfm_Base):
![Customer_rfm_Base Table](Screenshots/SQL Table Results/Customer_rfm_Base.png)
Insight: This table provides the raw Recency, Frequency, and Monetary values for each customer. It's the foundational data for RFM analysis, showing how recently, how often, and how much each customer has purchased. Observing these raw values helps in understanding the initial distribution of customer behavior.


Step 2: Assigning RFM Scores
Customers are assigned a score from 1 to 5 for each RFM metric using the NTILE window function, allowing for quintile-based segmentation.

SQL Script: SQL_scripts/10_rfm_step2_scores.sql

-- Replace this with the actual SQL code from your 10_rfm_step2_scores.sql file
-- Example structure:
-- CREATE OR REPLACE TABLE customer_rfm_scores AS
-- SELECT
--     CustomerID, Recency, Frequency, Monetary,
--     NTILE(5) OVER (ORDER BY Recency ASC) AS R_Score,
--     NTILE(5) OVER (ORDER BY Frequency DESC) AS F_Score,
--     NTILE(5) OVER (ORDER BY Monetary DESC) AS M_Score
-- FROM
--     customer_rfm_base;

-- SELECT * FROM customer_rfm_scores LIMIT 10;

Resulting Table (Customer_rfm_Scores):
![Customer_rfm_Scores Table](Screenshots/SQL Table Results/Customer_rfm_Scores.png)
Insight: This table translates the raw RFM values into standardized scores (1-5). These scores are crucial for the next step of segmentation, as they allow for a consistent way to compare and group customers based on their relative purchasing behavior across the three dimensions. For example, an R_Score of 5 indicates a very recent purchase, while an M_Score of 5 indicates high spending.


Step 3: Defining Customer Segments
Finally, customers are categorized into actionable segments (e.g., 'Champions', 'At Risk', 'Loyal Customers') based on their combined RFM scores using CASE statements.

SQL Script: SQL_scripts/11_rfm_step3_segments.sql

-- Replace this with the actual SQL code from your 11_rfm_step3_segments.sql file
-- Example structure:
-- CREATE OR REPLACE TABLE customer_segments_rfm AS
-- SELECT
--     CustomerID, R_Score, F_Score, M_Score,
--     CASE
--         WHEN R_Score >= 4 AND F_Score >= 4 AND M_Score >= 4 THEN 'Champions'
--         WHEN R_Score >= 4 AND F_Score >= 3 AND M_Score >= 3 THEN 'Loyal Customers'
--         WHEN R_Score >= 3 AND F_Score >= 3 AND M_Score >= 3 THEN 'Potential Loyalists'
--         WHEN R_Score >= 4 AND F_Score <= 2 AND M_Score <= 2 THEN 'New Customers'
--         WHEN R_Score <= 2 AND F_Score >= 4 AND M_Score >= 4 THEN 'At Risk'
--         WHEN R_Score <= 2 AND F_Score <= 2 AND M_Score <= 2 THEN 'Churned/Lost'
--         ELSE 'Other Segment'
--     END AS CustomerSegment
-- FROM
--     customer_rfm_scores;

-- SELECT CustomerSegment, COUNT(CustomerID) AS NumberOfCustomers, SUM(Monetary) AS TotalSpend
-- FROM customer_segments_rfm GROUP BY CustomerSegment ORDER BY NumberOfCustomers DESC;

Final Segment Summary Table:
![Customer_Segment_Summary Table](Screenshots/SQL Table Results/Customer_Segment_Summary.png)
Insight: This final summary table provides the count of customers and their total spend within each defined RFM segment. It's the actionable output of the RFM analysis, allowing the business to quickly see the size and value of different customer groups, such as 'Champions' (most valuable) or 'Churned/Lost' (requiring re-engagement). This table directly supports strategic marketing decisions.

Visualization: Customer Segments by Count
![Customer Segmentation Bar Chart Visualization](Screenshots/Charts and Visualizations/Customer Segmentation Bar Chart Visualization.png)
Insight: The bar chart clearly illustrates the distribution of customers across various segments by count. The 'Other Segment' often represents a diverse group not fitting neatly into predefined categories, which might warrant further investigation. However, key segments like 'Champions' (representing the most valuable customers) and 'At Risk' (customers who might churn) are clearly identified. This visual representation is vital for enabling targeted marketing and retention strategies based on customer behavior, allowing for a quick understanding of the customer base's health.



Key Findings & Business Recommendations
Based on the analysis, here are some key findings and actionable recommendations:

Seasonal Trends: Sales show a strong seasonality, typically peaking in November and December due to holiday shopping, and experiencing dips in January and September.

Recommendation: Plan inventory and marketing campaigns around these seasonal peaks and troughs to maximize sales and minimize stockouts or overstocking.

Top Product Categories: Electronics and Clothing are consistently the highest revenue generators. Beauty follows as a significant, but third-tier, category.

Recommendation: Continue to invest in these high-performing categories, ensuring consistent stock availability and considering cross-selling opportunities with related products to further boost revenue.

Demographic Insights: Customers in the 25-34 and 35-44 age groups contribute most significantly to overall sales, with Female customers consistently showing higher spending across most age segments.

Recommendation: Tailor marketing content, product recommendations, and promotional offers to resonate specifically with these key demographic segments, leveraging their demonstrated purchasing power.

Peak Shopping Days: Friday and Saturday consistently show the highest sales volume, confirming weekends as peak shopping periods.

Recommendation: Optimize staffing levels, schedule promotions, and focus online advertising efforts to capitalize on increased customer activity and sales potential during these peak weekend periods.

Customer Segmentation: The RFM analysis identified a significant 'Champions' segment (most valuable customers) and an 'At Risk' segment that requires attention.

Recommendation:

Champions: Implement exclusive loyalty programs, personalized rewards, and early access to new products to nurture and retain these most valuable customers.

At Risk: Develop targeted re-engagement campaigns (e.g., special discounts, personalized emails, win-back offers) to prevent churn and encourage repeat purchases.

New Customers: Focus on onboarding strategies, welcome discounts, and product recommendations to encourage their first repeat purchase and transition them into loyal customers.



Business Impact
This project directly translates data into tangible business value by providing actionable insights that can drive strategic decisions. The key business impacts include:

Optimized Resource Allocation: Understanding sales trends and peak periods allows for more efficient inventory management, staffing, and marketing budget allocation, reducing waste and maximizing ROI.

Enhanced Marketing Effectiveness: Detailed insights into product category performance, demographic preferences, and customer segments enable the creation of highly targeted and personalized marketing campaigns, leading to higher conversion rates and customer engagement.

Improved Customer Retention & Loyalty: RFM segmentation identifies valuable customers and those at risk of churn, allowing businesses to proactively implement retention strategies, foster loyalty, and increase customer lifetime value.

Data-Driven Decision Making: The project establishes a robust framework for continuous data analysis, empowering stakeholders to make informed, evidence-based decisions that contribute directly to revenue growth and operational efficiency.


Conclusion
This project demonstrates the power of SQL within Databricks for performing end-to-end data analysis, from raw data cleaning to advanced customer segmentation. The insights derived can directly inform business strategies, optimize marketing efforts, and ultimately drive sales growth and customer satisfaction in a retail environment.
