
	USE [SQL 24-2];
	GO

SELECT 
	MFR_ID,
	PRODUCT_ID,
	DESCRIPTION,
	LEN(DESCRIPTION) AS DESCRIPTION_LENGTH
FROM
	dbo.PRODUCTS
WHERE
	LEN(DESCRIPTION) = (SELECT MAX(LEN(DESCRIPTION)) FROM dbo.PRODUCTS);


SELECT CONCAT_WS(' ', UPPER(MFR_ID), UPPER(PRODUCT_ID), UPPER(RTRIM(DESCRIPTION))) AS CONCATENATED_STRING, 
	   LEN(CONCAT_WS(' ', UPPER(MFR_ID), UPPER(PRODUCT_ID), UPPER(RTRIM(DESCRIPTION)))) AS STRING_LENGTH
FROM 
	dbo.PRODUCTS 
WHERE 
	PRODUCT_ID NOT LIKE '%[^0-9]%' 
GROUP BY 
	CONCAT_WS(' ', UPPER(MFR_ID), UPPER(PRODUCT_ID), UPPER(RTRIM(DESCRIPTION)))
ORDER BY 
	STRING_LENGTH DESC;


SELECT CUST_NUM, CONCAT(LEFT(COMPANY, 2), REPLICATE('*', LEN(COMPANY) - 4), RIGHT(COMPANY, 2)) 
	AS CLIENT_NAME, CREDIT_LIMIT 
FROM 
	dbo.CUSTOMERS 
WHERE 
	CREDIT_LIMIT = (SELECT MIN(CREDIT_LIMIT) FROM dbo.CUSTOMERS) 
ORDER BY CUST_NUM;