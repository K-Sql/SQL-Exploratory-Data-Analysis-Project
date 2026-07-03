/* 
Script Purpose:
1)  Identify the unique values in the dimensions of our table. This will help show how data can be grouped
	or segmented for later analysis.
*/

--Explore all countries from customers table
SELECT DISTINCT country FROM gold.dim_customers

--Explore all categories in "The major divisions"
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1,2,3