USE [SQL 24-2];

SELECT DISTINCT MFR AS Manufacturer_ID 
FROM dbo.ORDERS
WHERE ORDER_DATE BETWEEN '2008-01-01' AND '2008-12-31' 
ORDER BY MFR;


SELECT
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS Years_of_Experience,
    COUNT(*) AS Employees_Num
FROM dbo.SALESREPS
GROUP BY DATEDIFF(YEAR, HIRE_DATE, GETDATE())
ORDER BY Employees_Num DESC;




WITH Employees_Count AS (
    SELECT
        YEAR(HIRE_DATE) AS Hire_Year,
        MONTH(HIRE_DATE) AS Hire_Month,
        COUNT(*) AS Employees_Num
    FROM dbo.SALESREPS
    GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)
)
SELECT
    Hire_Year,
    Hire_Month,
    Employees_Num
FROM Employees_Count
WHERE Employees_Num = (
    SELECT MAX(Employees_Num)
    FROM Employees_Count
);
