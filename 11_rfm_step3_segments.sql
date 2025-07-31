-- COMMAND ----------
-- Step 3: Define Customer Segments based on RFM Scores
CREATE OR REPLACE TABLE customer_segments_rfm AS
SELECT
    CustomerID,
    Recency,
    Frequency,
    Monetary,
    R_Score,
    F_Score,
    M_Score,
    CASE
        WHEN R_Score >= 4 AND F_Score >= 4 AND M_Score >= 4 THEN 'Champions' -- Bought recently, buy often, spend a lot
        WHEN R_Score >= 4 AND F_Score >= 3 AND M_Score >= 3 THEN 'Loyal Customers' -- Bought recently, buy often, good spend
        WHEN R_Score >= 3 AND F_Score >= 3 AND M_Score >= 3 THEN 'Potential Loyalists' -- Recent, average frequency/monetary
        WHEN R_Score >= 4 AND F_Score <= 2 AND M_Score <= 2 THEN 'New Customers' -- Bought recently, but low frequency/monetary (just started)
        WHEN R_Score <= 2 AND F_Score >= 4 AND M_Score >= 4 THEN 'At Risk' -- Haven't bought recently, but used to buy often and spend a lot
        WHEN R_Score <= 2 AND F_Score <= 2 AND M_Score <= 2 THEN 'Churned/Lost' -- Haven't bought recently, low frequency, low spend
        ELSE 'Other Segment' -- Catch-all for less common combinations
    END AS CustomerSegment
FROM
    customer_rfm_scores; -- Use the table created in Step 2

-- Finally, summarize the new segments for visualization
SELECT
    CustomerSegment,
    COUNT(CustomerID) AS NumberOfCustomers,
    SUM(Monetary) AS TotalSpend
FROM
    customer_segments_rfm
GROUP BY
    CustomerSegment
ORDER BY
    NumberOfCustomers DESC;