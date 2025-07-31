CREATE OR REPLACE TABLE daily_sales_summary AS
SELECT
    OrderDate,
    SUM(TotalAmount) AS DailySales,
    COUNT(DISTINCT TransactionID) AS DailyTransactions
FROM
    sales_cleaned
GROUP BY
    OrderDate
ORDER BY
    OrderDate;

SELECT * FROM daily_sales_summary;