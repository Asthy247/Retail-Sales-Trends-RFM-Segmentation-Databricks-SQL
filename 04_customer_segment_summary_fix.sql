%sql
-- COMMAND ----------
-- SQL: Aggregate customer data for top customers
-- Run this in a new query tab in the Databricks SQL Editor

CREATE OR REPLACE TABLE customer_segment_summary AS
SELECT
    CustomerID,
    SUM(TotalAmount) AS TotalCustomerSpend,
    COUNT(DISTINCT TransactionID) AS NumberOfTransactions,
    AVG(TotalAmount / Quantity) AS AveragePricePaidPerUnit -- Example avg price paid
FROM
    sales_cleaned
GROUP BY
    CustomerID
ORDER BY
    TotalCustomerSpend DESC
LIMIT 100; -- Limiting to top 100 customers for easy Python analysis

-- Verify the new table
SELECT * FROM customer_segment_summary LIMIT 10;