/*
Script Purpose:
The purpose of this script is to order the values of dimensions by measure. 
Compares the top N performs to the Bottom N performers
*/


--Which 5 products generate the highest revenue?
SELECT TOP 5
SUM(s.sales_amount) total_revenue, 
p.subcategory 
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON p.product_key = s.product_key
GROUP BY p.subcategory
ORDER BY total_revenue DESC

SELECT *
FROM(
SELECT
p.product_name,
SUM(s.sales_amount) total_revenue,
ROW_NUMBER () OVER(ORDER BY SUM(s.sales_amount) DESC) AS rank_products
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON p.product_key = s.product_key
GROUP BY p.product_name)t 
WHERE rank_products <= 5




--What are the bottom 5 products in sales
SELECT TOP 5
SUM(s.sales_amount) total_revenue, 
p.product_name 
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC

--Find the top 10 customers who have generated the highest revenue
SELECT  TOP 10 
c.customer_key, c.first_name, c.last_name, 
SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_revenue DESC

--Find the 3 customers with the fewest orders placed
SELECT  TOP 3 
c.customer_key, c.first_name, c.last_name, 
COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_orders