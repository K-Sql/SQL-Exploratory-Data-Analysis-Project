/*Script Purpose: 
  Segment products into cost ranges and
  count how many products fall into each segment
  */

  --CTE that extracts product key, product name, cost, and cost range
  WITH product_segment AS (
  SELECT 
  product_key,
  product_name,
  cost,
  --Segments the cost of each product into categories based on cost
  CASE WHEN cost < 100 THEN 'Below 100'
	   WHEN cost BETWEEN 100 AND 500 THEN '100-500'
	   WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
	   ELSE 'Above 1000'
	   END AS cost_range
  FROM gold.dim_products
  )

  --Calculates the number of products that belong to each cost range
  SELECT
  cost_range,
  COUNT(product_key) AS total_product
  FROM product_segment
  GROUP BY cost_range
  ORDER BY total_product DESC