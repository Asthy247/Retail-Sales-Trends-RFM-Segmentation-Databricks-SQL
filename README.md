
# Retail Sales Trends & RFM Segmentation (Databricks SQL)




**Project Overview**

This project performs a comprehensive analysis of retail sales data using SQL within the Databricks environment. The primary goals are to:

Clean and transform raw sales data into a structured format.

Identify key sales trends and patterns over time (monthly, daily, day-of-week).

Evaluate the performance of different product categories and demographics.

Segment customers based on their purchasing behavior using RFM (Recency, Frequency, Monetary) analysis to enable targeted marketing strategies.





**Business Problem**

Retail businesses often face challenges in understanding their sales performance, identifying effective marketing strategies, and retaining valuable customers. Without clear, data-driven insights, decisions regarding inventory,

promotions, and customer engagement can be inefficient and lead to missed opportunities or declining revenue. Key questions addressed by this project include:

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





# 1. Data Cleaning & Initial Transformation

This initial step involved loading the raw retail sales data and performing essential cleaning and transformation to ensure data quality and usability for downstream analysis. This included:

Renaming columns for better readability and SQL compatibility.

Casting columns to appropriate data types (e.g., DATE, INT, DECIMAL).

Handling potential NULL values and invalid entries (e.g., quantities/prices less than or equal to zero).

Deriving new time-based features such as OrderYear, OrderMonth, and OrderDayOfWeek for time-series analysis.




<img width="649" height="635" alt="image" src="https://github.com/user-attachments/assets/5be809bc-9b65-45c9-9b9d-72d1dc130e59" />



**Resulting Table (Sales_Cleaned):**



<img width="1321" height="321" alt="image" src="https://github.com/user-attachments/assets/b2ecfcc6-718f-4047-831a-0c89e4e4f355" />


**Insight**: This table represents the clean and transformed dataset, ready for analysis. It includes standardized column names, correct data types, and derived time components, ensuring consistency and accuracy for subsequent aggregations and insights.






# 2. Exploratory Data Analysis (EDA) & Aggregation

In this phase, various summary tables were created to aggregate the cleaned data and derive key performance indicators, providing insights into different aspects of the retail business. Each summary table is accompanied by a relevant visualization.





**Monthly Sales Trends**


This analysis provides an overview of sales performance on a monthly basis, allowing us to identify seasonal patterns and overall growth.



**SQL Script: SQL_scripts/02_monthly_sales_summary.sql**




<img width="791" height="429" alt="image" src="https://github.com/user-attachments/assets/7d5a9bb4-c128-4ca9-a24c-1e68d888279b" />


**Resulting Table (Monthly_Sales_Summary):**



<img width="787" height="298" alt="image" src="https://github.com/user-attachments/assets/53052658-337d-4e8f-af07-44572c5e923d" />



**Insight**: This table aggregates total sales and other metrics by month and year. It provides the foundational data to observe month-over-month sales fluctuations and identify potential seasonality or growth trends before visualization.






**Visualization: Monthly Sales Trend**



<img width="669" height="324" alt="Monthly Sales Trend" src="https://github.com/user-attachments/assets/f68f7ef8-1350-4402-bd52-16d0196a1bc0" />



**Insight**: The line chart for monthly sales clearly illustrates fluctuating trends over time, with noticeable peaks and dips. This pattern suggests strong seasonality in retail purchases, which can inform inventory management and 

marketing campaign timing. For instance, if peaks occur consistently in November and December, these periods could be targeted for increased promotional activity.









**Product Category Performance**

This analysis highlights the sales contribution of different product categories, identifying top-performing and underperforming segments.



**SQL Script: SQL_scripts/03_product_category_summary.sql**


<img width="477" height="414" alt="image" src="https://github.com/user-attachments/assets/765cea2c-90e9-4296-b55b-997f3de782a6" />


**Resulting Table (Product Category Summary)**:


<img width="576" height="324" alt="Product Category Summary" src="https://github.com/user-attachments/assets/3241e9fe-2182-4eb5-8d5a-ecbd5851e7b1" />

**Insight**: This table provides a ranked list of product categories by their total sales. It's crucial for quickly identifying which product lines are the primary revenue drivers and which might require more attention or different strategies.








**Visualization: Product Category Sales**


<img width="651" height="324" alt="Product Category Sales" src="https://github.com/user-attachments/assets/fe01b184-055a-4877-b0ba-6ced7dd54dfe" />



**Insight:** The bar chart clearly shows that Electronics and Clothing emerge as the leading product categories by total sales, indicating strong customer preference and market demand in these areas. Beauty follows,

suggesting it's a significant, but potentially underperforming, category where targeted promotions or product diversification could yield growth.








**Customer Segment Summary (Top Spenders)**
This table identifies customers with the highest total spending, useful for understanding high-value customer behavior.



**SQL Script: SQL_scripts/04_customer_segment_summary_fix.sql**

<img width="632" height="437" alt="image" src="https://github.com/user-attachments/assets/5c248081-f870-4bbd-8127-c2c09619d714" />



**Resulting Table (Top 20 Customer Spend):**



<img width="576" height="324" alt="Top 20 Customers" src="https://github.com/user-attachments/assets/63c54129-32fe-43e0-ac57-14b6c2198782" />


**Insight**: This table lists individual customers by their total spending, ordered from highest to lowest. It allows for the direct identification of top-tier customers, providing a foundation for loyalty programs or personalized outreach to reward and retain them.







**Sales Performance by Gender and Age Group**
This analysis segments sales data by customer demographics, revealing how different age groups and genders contribute to overall revenue.

**SQL Script: SQL_scripts/05_sales_by_demographics.sql**


<img width="429" height="426" alt="image" src="https://github.com/user-attachments/assets/5c9f1b37-ccc4-4f7c-bcf1-265fcfbd27ab" />



**Resulting Table (sales_by_demographics):**


<img width="576" height="324" alt="Sales Performance by Gender and Age Group" src="https://github.com/user-attachments/assets/c2a4e0d9-9f82-42dd-b842-a043717435cc" />

**Insight:** This table provides a detailed breakdown of total sales, unique customers, and total transactions across various age groups and genders. It's essential for understanding which demographic segments are most lucrative and how sales are distributed among them.







V**isualization: Sales Performance by Gender and Age Group**


<img width="669" height="324" alt="Sales Perfromance by Gender and Age Group" src="https://github.com/user-attachments/assets/e3c9ecfc-79c4-42b6-af99-5ea06f72cffd" />

**Insight**: The stacked bar chart effectively visualizes that the 25-34 and 35-44 age groups contribute most significantly to overall sales, with Female customers consistently showing higher spending across most age segments. This insight is crucial for tailoring marketing content and product recommendations to resonate with these high-value demographic groups.





**Product Category Performance by Gender**

This analysis delves into which product categories are more popular among specific genders, helping to tailor product offerings and marketing messages.

**SQL Script: SQL_scripts/06_category_sales_by_gender.sql**

<img width="437" height="286" alt="image" src="https://github.com/user-attachments/assets/f774c768-53c7-4f85-9100-b9db44e3871a" />


**Resulting Table (category_sales_by_gender):**


<img width="576" height="324" alt="Product Category Performance by Gender" src="https://github.com/user-attachments/assets/4c47eeb2-e5ed-4a9a-b34d-a1fc9c3ac143" />



**Insight:** This table breaks down sales and units sold by product category for each gender. It allows for a granular understanding of gender-specific preferences within product categories, which is vital for precise inventory planning and targeted advertising.



**Visualization: Product Category Sales by Gender**

<img width="666" height="324" alt="Product Category Performance by Gender" src="https://github.com/user-attachments/assets/34f6de0f-6a99-4372-b013-a3b149f1235c" />

**Insight:** The bar chart confirms that Electronics and Clothing remain the top categories, but it further reveals that Female customers show a higher overall spend in most categories compared to Male customers. This granular insight suggests opportunities for gender-specific product promotions and inventory adjustments within each category.





**Sales by Day of Week**

This analysis identifies which days of the week are most popular for purchases, helping optimize staffing and marketing schedules.

**SQL Script: SQL_scripts/08_sales_by_day_of_week.sql**

<img width="677" height="460" alt="image" src="https://github.com/user-attachments/assets/8bbee8d9-3121-4244-bd50-8bf891731ba3" />


**Resulting Table (Sales by Day of Week):**



<img width="576" height="324" alt="Sales by Day of Week" src="https://github.com/user-attachments/assets/45c3a2a5-9fce-47f9-95b7-a2a2c2c15029" />


**Insight**: This table aggregates total sales and transactions by each day of the week, ordered chronologically. It clearly highlights which days are the most active for sales, providing data-driven insights for operational planning.



**Visualization: Sales by Day of Week**


<img width="1333" height="445" alt="image" src="https://github.com/user-attachments/assets/02edd08c-688d-4d3f-9d63-b0524c347eab" />



**Insight**: The bar chart clearly indicates that Friday and Saturday consistently show the highest sales volume, confirming weekends as peak shopping periods. This information is crucial for optimizing staffing levels, scheduling promotions, and focusing online advertising efforts to capitalize on increased customer activity during these days.



# 3. Advanced Analysis: RFM Customer Segmentation
To gain a deeper understanding of customer behavior and identify high-value segments, an RFM (Recency, Frequency, Monetary) analysis was performed. This involved calculating RFM values, assigning scores, and then categorizing customers into distinct segments.





**Step 1: Calculating RFM Values**

This step calculates the Recency (days since last purchase), Frequency (number of unique transactions), and Monetary (total spend) for each customer.


**SQL Script: SQL_scripts/09_rfm_step1_base.sql**

<img width="687" height="497" alt="image" src="https://github.com/user-attachments/assets/79915223-4cdb-47ee-8858-4914e9220f0c" />





**Resulting Table (Customer_rfm_Base):**





<img width="576" height="324" alt="Customer_rfm_Base" src="https://github.com/user-attachments/assets/3836f077-2e77-44e3-aad2-5277bb56a6e0" />





**Insight**: This table provides the raw Recency, Frequency, and Monetary values for each customer. It's the foundational data for RFM analysis, showing how recently, how often, and how much each customer has purchased. Observing these raw values helps in understanding the initial distribution of customer behavior.





**Step 2: Assigning RFM Scores**


Customers are assigned a score from 1 to 5 for each RFM metric using the NTILE window function, allowing for quintile-based segmentation.



**SQL Script: SQL_scripts/10_rfm_step2_scores.sql**


<img width="769" height="379" alt="image" src="https://github.com/user-attachments/assets/1e362a52-f46b-4171-ac2b-a87da88ae4df" />



**Resulting Table (Customer_rfm_Scores):**


<img width="576" height="324" alt="Customer_rfm_Scores" src="https://github.com/user-attachments/assets/10f2037b-5e17-4134-a529-324798a8d2fa" />



**Insight**: This table translates the raw RFM values into standardized scores (1-5). These scores are crucial for the next step of segmentation, as they allow for a consistent way to compare and group customers based on their 

relative purchasing behavior across the three dimensions. For example, an R_Score of 5 indicates a very recent purchase, while an M_Score of 5 indicates high spending.





**Step 3: Defining Customer Segments**



Finally, customers are categorized into actionable segments (e.g., 'Champions', 'At Risk', 'Loyal Customers') based on their combined RFM scores using CASE statements.

**SQL Script: SQL_scripts/11_rfm_step3_segments.sql**


<img width="1048" height="647" alt="image" src="https://github.com/user-attachments/assets/b4b4db90-e6ad-471f-a98c-e60a81cc1db1" />





**Final Segment Summary Table:**


<img width="576" height="324" alt="Customer_Segment_Summary" src="https://github.com/user-attachments/assets/550f76b7-c268-472b-8918-7a3d3bf6df32" />



**Insight:** This final summary table provides the count of customers and their total spend within each defined RFM segment. It's the actionable output of the RFM analysis, allowing the business to quickly see the size and 

value of different customer groups, such as 'Champions' (most valuable) or 'Churned/Lost' (requiring re-engagement). This table directly supports strategic marketing decisions.




**Visualization: Customer Segments by Count**


<img width="671" height="324" alt="Customer Segmentation Bar Chart Visualization" src="https://github.com/user-attachments/assets/f7947826-d9db-4527-bf32-b8eba713b85d" />



**Insight:** The bar chart clearly illustrates the distribution of customers across various segments by count. The 'Other Segment' often represents a diverse group not fitting neatly into predefined categories, which might warrant further

investigation. However, key segments like 'Champions' (representing the most valuable customers) and 'At Risk' (customers who might churn) are clearly identified.

This visual representation is vital for enabling targeted marketing and retention strategies based on customer behavior, allowing for a quick understanding of the customer base's health.



# Key Findings & Business Recommendations

Based on the analysis, here are some key findings and actionable recommendations:

**Seasonal Trends**: Sales show a strong seasonality, typically peaking in November and December due to holiday shopping, and experiencing dips in January and September.



**Recommendation**: Plan inventory and marketing campaigns around these seasonal peaks and troughs to maximize sales and minimize stockouts or overstocking.

**Top Product Categories**: Electronics and Clothing are consistently the highest revenue generators. Beauty follows as a significant, but third-tier, category.



**Recommendation:** Continue to invest in these high-performing categories, ensuring consistent stock availability and considering cross-selling opportunities with related products to further boost revenue.

**Demographic Insights**: Customers in the 25-34 and 35-44 age groups contribute most significantly to overall sales, with Female customers consistently showing higher spending across most age segments.



**Recommendation**: Tailor marketing content, product recommendations, and promotional offers to resonate specifically with these key demographic segments, leveraging their demonstrated purchasing power.

**Peak Shopping Days**: Friday and Saturday consistently show the highest sales volume, confirming weekends as peak shopping periods.



**Recommendation:** Optimize staffing levels, schedule promotions, and focus online advertising efforts to capitalize on increased customer activity and sales potential during these peak weekend periods.

**Customer Segmentation:** The RFM analysis identified a significant 'Champions' segment (most valuable customers) and an 'At Risk' segment that requires attention.



**Recommendation:**

**Champions**: Implement exclusive loyalty programs, personalized rewards, and early access to new products to nurture and retain these most valuable customers.

**At Risk**: Develop targeted re-engagement campaigns (e.g., special discounts, personalized emails, win-back offers) to prevent churn and encourage repeat purchases.

**New Customers:** Focus on onboarding strategies, welcome discounts, and product recommendations to encourage their first repeat purchase and transition them into loyal customers.







# Business Impact
This project directly translates data into tangible business value by providing actionable insights that can drive strategic decisions. The key business impacts include:

Optimized Resource Allocation: Understanding sales trends and peak periods allows for more efficient inventory management, staffing, and marketing budget allocation, reducing waste and maximizing ROI.

Enhanced Marketing Effectiveness: Detailed insights into product category performance, demographic preferences, and customer segments enable the creation of highly targeted and personalized marketing campaigns, leading to higher conversion rates and customer engagement.

Improved Customer Retention & Loyalty: RFM segmentation identifies valuable customers and those at risk of churn, allowing businesses to proactively implement retention strategies, foster loyalty, and increase customer lifetime value.

Data-Driven Decision Making: The project establishes a robust framework for continuous data analysis, empowering stakeholders to make informed, evidence-based decisions that contribute directly to revenue growth and operational efficiency.





# Conclusion
This project demonstrates the power of SQL within Databricks for performing end-to-end data analysis, from raw data cleaning to advanced customer segmentation. The insights derived 

can directly inform business strategies, optimize marketing efforts, and ultimately drive sales growth and customer satisfaction in a retail environment.
