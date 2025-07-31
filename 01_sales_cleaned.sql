%sql
-- COMMAND ----------
-- SQL for Data Cleaning and Initial Transformation
-- Run this in the Databricks SQL Editor

CREATE OR REPLACE TABLE sales_cleaned AS
SELECT
    `Transaction ID` AS TransactionID, -- Rename for easier SQL use
    CAST(Date AS DATE) AS OrderDate,
    `Customer ID` AS CustomerID,
    Gender,
    Age,
    `Product Category` AS ProductCategory, -- Use the correct column name
    CAST(Quantity AS INT) AS Quantity,
    CAST(`Price per Unit` AS DECIMAL(10,2)) AS PricePerUnit,
    CAST(`Total Amount` AS DECIMAL(10,2)) AS TotalAmount, -- Corrected to Total Amount
    -- Add calculated columns
    YEAR(CAST(Date AS DATE)) AS OrderYear,
    MONTH(CAST(Date AS DATE)) AS OrderMonth,
    DAYOFWEEK(CAST(Date AS DATE)) AS OrderDayOfWeek
FROM
    retail_sales_dataset -- Your uploaded table name
WHERE
    CAST(Quantity AS INT) IS NOT NULL
    AND CAST(`Price per Unit` AS DECIMAL(10,2)) IS NOT NULL
    AND CAST(`Total Amount` AS DECIMAL(10,2)) IS NOT NULL
    AND CAST(Quantity AS INT) > 0
    AND CAST(`Price per Unit` AS DECIMAL(10,2)) > 0;

-- Verify the new cleaned table
SELECT * FROM sales_cleaned LIMIT 10;