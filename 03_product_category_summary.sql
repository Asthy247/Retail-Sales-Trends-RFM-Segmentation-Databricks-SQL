%sql
-- COMMAND ----------
-- SQL: Aggregate sales data by Product Category
-- Run this in a new query tab in the Databricks SQL Editor

CREATE OR REPLACE TABLE product_category_summary AS
SELECT
    ProductCategory,
    SUM(TotalAmount) AS TotalCategorySales,
    COUNT(DISTINCT TransactionID) AS TotalTransactions,
    SUM(Quantity) AS TotalUnitsSold
FROM
    sales_cleaned
GROUP BY
    ProductCategory
ORDER BY
    TotalCategorySales DESC;

-- Verify the new table
SELECT * FROM product_category_summary LIMIT 10;