-- COMMAND ----------
-- Step 2: Assign RFM Scores (1 to 5) using NTILE
CREATE OR REPLACE TABLE customer_rfm_scores AS
SELECT
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    -- R_Score: Lower Recency (fewer days since last purchase) means higher score (ORDER BY Recency ASC)
    NTILE(5) OVER (ORDER BY Recency ASC) AS R_Score,
    -- F_Score: Higher Frequency (more transactions) means higher score (ORDER BY Frequency DESC)
    NTILE(5) OVER (ORDER BY Frequency DESC) AS F_Score,
    -- M_Score: Higher Monetary value (more spend) means higher score (ORDER BY Monetary DESC)
    NTILE(5) OVER (ORDER BY Monetary DESC) AS M_Score
FROM
    customer_rfm_base; -- Use the table created in Step 1

SELECT * FROM customer_rfm_scores LIMIT 10;