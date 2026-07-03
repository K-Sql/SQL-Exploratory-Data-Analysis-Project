/* Script Purpose:
	Creates a part to whole analysis to analyze what product categories contributes to
	the most overall sales
*/

--CTE that calculates the total sale for each sales category
WITH category_sales AS(
SELECT
category,
SUM(sales_amount) total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY category
)

SELECT 
category,
total_sales,
SUM(total_sales) OVER() overall_sales,
--Calculates the percentage of total sales rounded to 2 decimal points
CONCAT(ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER())*100,2),'%') AS percentage_of_total_sales
FROM category_sales
ORDER BY total_sales DESC