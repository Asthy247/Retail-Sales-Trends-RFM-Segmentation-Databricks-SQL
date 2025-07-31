CREATE OR REPLACE TABLE sales_by_demographics AS
SELECT
    Gender,
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS AgeGroup,
    SUM(TotalAmount) AS TotalSales,
    COUNT(DISTINCT CustomerID) AS UniqueCustomers,
    COUNT(DISTINCT TransactionID) AS TotalTransactions
FROM
    sales_cleaned
GROUP BY
    Gender, AgeGroup
ORDER BY
    Gender, AgeGroup;

SELECT * FROM sales_by_demographics;