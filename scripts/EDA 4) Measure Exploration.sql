/*
Script Purpose:
The purpose of this script is to explore the measures of our database to
find the highest level of aggregations of the key metrics in the business data.
*/

--Find the Total Sales
SELECT SUM(sales_amount) total_sales FROM gold.fact_sales

--Find how many items are sold
SELECT SUM(quantity) total_quantity FROM gold.fact_sales

--Find the average selling price
SELECT AVG(price) avg_price FROM gold.fact_sales

--Find the total number of orders
SELECT COUNT(DISTINCT order_number) total_orders FROM gold.fact_sales

--Find the total number of products
SELECT COUNT(product_name) total_products FROM gold.dim_products


--Find the total number of customers
SELECT COUNT(customer_key) total_customers FROM gold.dim_customers

--Find the total number of customers that placed an order
SELECT COUNT(DISTINCT customer_key) total_customers FROM gold.fact_sales

--Generate a reports that shows all key metrics
SELECT 'Total Sales' as measure_value, SUM(sales_amount) as measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity)  FROM gold.fact_sales
UNION ALL 
SELECT 'Average Price', AVG(price)  FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number)  FROM gold.fact_sales
UNION ALL
SELECT 'Total Customers', COUNT(DISTINCT customer_key)  FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(product_name)  FROM gold.dim_products





