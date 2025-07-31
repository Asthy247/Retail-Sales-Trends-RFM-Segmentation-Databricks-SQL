-- COMMAND ----------
-- Step 1: Calculate R, F, M values per customer
CREATE OR REPLACE TABLE customer_rfm_base AS
WITH SnapshotDate AS (
    SELECT MAX(OrderDate) AS latest_date FROM sales_cleaned
),
CustomerRFM AS (
    SELECT
        CustomerID,
        -- Recency: Days since last purchase (lower is better, so DATEDIFF from latest_date)
        DATEDIFF((SELECT latest_date FROM SnapshotDate), MAX(OrderDate)) AS Recency,
        -- Frequency: Number of unique transactions
        COUNT(DISTINCT TransactionID) AS Frequency,
        -- Monetary: Total spend
        SUM(TotalAmount) AS Monetary
    FROM
        sales_cleaned
    GROUP BY
        CustomerID
)
SELECT * FROM CustomerRFM; -- Select from the CTE to populate the table

-- Verify the created table
SELECT * FROM customer_rfm_base LIMIT 10;