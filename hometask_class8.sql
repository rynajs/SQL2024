USE [SQL 24-2];

SELECT DISTINCT MFR AS Manufacturer_ID 
FROM dbo.ORDERS
WHERE ORDER_DATE BETWEEN '2008-01-01' AND '2008-12-31' 
ORDER BY MFR;

SELECT
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS Years_of_Experience,
    COUNT(*) AS Number_of_Employees
FROM dbo.SALESREPS
GROUP BY DATEDIFF(YEAR, HIRE_DATE, GETDATE())
ORDER BY Number_of_Employees DESC;


WITH HireCounts AS (
    SELECT
        YEAR(HIRE_DATE) AS Hire_Year,
        MONTH(HIRE_DATE) AS Hire_Month,
        COUNT(*) AS Number_of_Employees
    FROM dbo.SALESREPS
    GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)
)
SELECT
    Hire_Year,
    Hire_Month,
    Number_of_Employees
FROM HireCounts
WHERE Number_of_Employees = (
    SELECT MAX(Number_of_Employees)
    FROM HireCounts
)
ORDER BY Hire_Year, Hire_Month;
