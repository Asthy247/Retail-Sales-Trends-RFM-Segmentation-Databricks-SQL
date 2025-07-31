%sql
-- COMMAND ----------
-- SQL: Aggregate sales data by month
-- Run this in the Databricks SQL Editor

CREATE OR REPLACE TABLE monthly_sales_summary AS
SELECT
    OrderYear,
    OrderMonth,
    SUM(TotalAmount) AS MonthlySales, -- Using TotalAmount as sales metric
    SUM(TotalAmount - (Quantity * PricePerUnit)) AS MonthlyProfit, -- Basic profit calculation if needed
    COUNT(DISTINCT TransactionID) AS TotalTransactions
FROM
    sales_cleaned
GROUP BY
    OrderYear, OrderMonth
ORDER BY
    OrderYear, OrderMonth;

-- Verify the new table
SELECT * FROM monthly_sales_summary LIMIT 10;