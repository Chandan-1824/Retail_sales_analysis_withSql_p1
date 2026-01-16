CREATE DATABASE Project;

--Table Creation----
CREATE TABLE Retail_Sales(
	transactions_id INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(15),
	age INT,
	category VARCHAR(30),
	quantity INT,
	price_per_unit NUMERIC(10,2),
	cogs NUMERIC(10,2),
	total_sale NUMERIC(10,2)	
);

--Checking the Data Import--
SELECT * FROM Retail_Sales LIMIT 30;

SELECT COUNT(*) FROM Retail_Sales;


------CLEANING THE DATA-----------
--Checking If NULL values are available in the table--
SELECT * FROM Retail_Sales
WHERE   transactions_id IS NULL
		OR
		sale_date IS NULL
		OR
		sale_time IS NULL
		OR
		customer_id IS NULL
		OR
		gender IS NULL
		OR
		age IS NULL
		OR
		category IS NULL
		OR
		quantity IS NULL
		OR
		price_per_unit IS NULL
		OR
		cogs IS NULL
		OR
		total_sale IS NULL;

-- Deleting the NULL Value data--

DELETE FROM Retail_Sales
WHERE   transactions_id IS NULL
		OR
		sale_date IS NULL
		OR
		sale_time IS NULL
		OR
		customer_id IS NULL
		OR
		gender IS NULL
		OR
		age IS NULL
		OR
		category IS NULL
		OR
		quantity IS NULL
		OR
		price_per_unit IS NULL
		OR
		cogs IS NULL
		OR
		total_sale IS NULL;

--- Queries Start -----

---How many Sales do we have---
SELECT COUNT(*) AS Total_Transactions
FROM Retail_Sales;

-- Total Unique Customer Count--
SELECT  COUNT(DISTINCT customer_id) AS Total_Customer_Count
FROM Retail_Sales;

-- Unique Categories ---
SELECT DISTINCT category
FROM Retail_Sales;

--Write a sql query to retrieve all columns for sales mad on '2022-11-05'

SELECT * FROM Retail_Sales
WHERE sale_date = '2022-11-05';

/*Write a sql query to retrieve all transactions where the category is "Clothing" 
and the quanity sold is more than 3 in the month of NOV 2022
*/

SELECT *
FROM Retail_Sales 
WHERE category = 'Clothing' 
AND
sale_date >= '2022-11-01' 
AND 
sale_date < '2022-12-01'
AND 
quantity > 3
ORDER BY transactions_id ASC;

--- Write a SQL query to calculate the total sales for each category--

SELECT category , SUM(total_sale) AS Total_Sale 
FROM Retail_Sales
GROUP BY category;

--- Write a SQL query to find the AVG age of customers who purchased items for beauty category---

SELECT ROUND(AVG(age)) AS AVG_AGE
FROM Retail_Sales
WHERE category = 'Beauty';

--- Write a SQL query to find all the transactions where total_sale is greater than 1000 ---

SELECT * 
FROM Retail_Sales
WHERE total_sale > 1000;

/*Write a SQL query to  find the total number of transaction (transaction_id) 
   made by each gender in each category
*/
SELECT category , gender , COUNT(transactions_id) AS Total_number
FROM Retail_Sales
GROUP BY category , gender
ORDER BY 1;

--- Write a SQL query to calculate the AVG sale for each month, 
--- Find out best selling month in each year---

SELECT Year, Month , Avg_Sale
FROM
(
SELECT 
EXTRACT(YEAR FROM sale_date) AS Year,
EXTRACT(MONTH FROM sale_date) AS Month ,
ROUND(AVG (total_sale)) AS Avg_Sale,
ROW_NUMBER() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS RN
FROM Retail_Sales
GROUP BY 1 , 2) 
AS T1
WHERE RN = 1;


--- Write a SQL query to find the top 5 customers based on highest total sales---

SELECT customer_id ,MAX(gender) AS gender,
       MAX(age) AS age, 
	   SUM(total_sale) AS Total_Sales
FROM Retail_Sales 
GROUP BY 1 
ORDER BY Total_Sales  DESC LIMIT 5;

--- Write a SQL query to find the numbers of unique customers who purchased items for each category---

SELECT category , COUNT(DISTINCT customer_id) AS Unique_Customers  
FROM Retail_Sales 
GROUP BY 1;

/*Write a SQL query to create each shift and number of orders 
(Example Morning <12 , Afternoon Between 12 & 17 , Evenning >17) */

SELECT Shift , COUNT(transactions_id) AS Num_Of_Orders
FROM 
(SELECT transactions_id ,
       CASE 
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'MORNING'
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND  17 THEN 'AFTERNOON'
		ELSE 'EVENING'
	   END AS Shift
FROM 
Retail_Sales) As Total_Number
GROUP BY Shift;

-- This is a shorter and improved version of the previous query Without ORDER BY  ----

SELECT
       CASE 
	   	  WHEN EXTRACT(Hour FROM sale_time) < 12 THEN 'Morning'
		  WHEN EXTRACT(Hour From sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		  ELSE 'Evening'
	   END as Time_shift,
	   COUNT(transactions_id) AS Total_Count
FROM Retail_Sales
GROUP BY 1
ORDER BY 2;

-- This is another improved version of the previous query With ORDER BY  ----

WITH shifts AS (
    SELECT
        CASE 
            WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
            WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS time_shift,
        transactions_id
    FROM Retail_Sales;
)
SELECT
    time_shift,
    COUNT(transactions_id) AS total_count
FROM shifts
GROUP BY time_shift
ORDER BY
    CASE time_shift
        WHEN 'Morning' THEN 1
        WHEN 'Afternoon' THEN 2
        WHEN 'Evening' THEN 3
    END;




                            ------ ** PROJECT END ** -------
    





