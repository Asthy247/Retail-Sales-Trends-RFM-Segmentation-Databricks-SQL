CREATE OR REPLACE TABLE category_sales_by_gender AS
SELECT
    ProductCategory,
    Gender,
    SUM(TotalAmount) AS TotalSales,
    SUM(Quantity) AS TotalUnitsSold
FROM
    sales_cleaned
GROUP BY
    ProductCategory, Gender
ORDER BY
    ProductCategory, Gender;

SELECT * FROM category_sales_by_gender;