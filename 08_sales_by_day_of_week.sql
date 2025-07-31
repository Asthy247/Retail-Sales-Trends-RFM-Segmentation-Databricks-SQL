CREATE OR REPLACE TABLE sales_by_day_of_week AS
SELECT
    OrderDayOfWeek, -- Assuming this is available in sales_cleaned (1=Sunday, 7=Saturday)
    CASE
        WHEN OrderDayOfWeek = 1 THEN 'Sunday'
        WHEN OrderDayOfWeek = 2 THEN 'Monday'
        WHEN OrderDayOfWeek = 3 THEN 'Tuesday'
        WHEN OrderDayOfWeek = 4 THEN 'Wednesday'
        WHEN OrderDayOfWeek = 5 THEN 'Thursday'
        WHEN OrderDayOfWeek = 6 THEN 'Friday'
        WHEN OrderDayOfWeek = 7 THEN 'Saturday'
    END AS DayName,
    SUM(TotalAmount) AS TotalSales,
    COUNT(DISTINCT TransactionID) AS TotalTransactions
FROM
    sales_cleaned
GROUP BY
    OrderDayOfWeek, DayName
ORDER BY
    OrderDayOfWeek; -- Ensure correct order of days

SELECT * FROM sales_by_day_of_week;