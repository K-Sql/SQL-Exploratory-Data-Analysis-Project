/* 
Script Purpose:
Analyze the progression of data over time by:
1) Calculating the total sales per month
2) Calculating the running total of sales over time
3) Calculating the moving average
*/

SELECT
order_date,
total_sales,
SUM(total_sales) OVER(ORDER BY order_date) AS running_total_sales,
AVG(avg_price) OVER(ORDER BY order_date) AS moving_avg
FROM(
SELECT 
--Truncates the order date to start at the beginning of the year
DATETRUNC(year,order_date) AS order_date,
SUM(sales_amount) AS total_sales,
AVG(price) AS avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year,order_date)
)t