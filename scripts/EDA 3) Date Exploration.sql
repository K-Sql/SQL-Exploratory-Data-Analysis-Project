/*
Script Purpose:
1) The purpose of this script is to explore the boundaries and scope of dates in our database.
*/

--Find the date of the first and last order / How many years of sales
SELECT MIN(order_date) first_order_date, MAX(order_date) last_order_date,
DATEDIFF(year,MIN(order_date),MAX(order_date)) order_range_in_years,
DATEDIFF(month,MIN(order_date),MAX(order_date)) order_range_in_months
FROM gold.fact_sales

--Find the youngest and the oldest customer
SELECT
MIN(birthdate) oldest_birthdate,
MAX(birthdate) youngest_birthdate,
DATEDIFF(year,MIN(birthdate),GETDATE()) Oldest_age,
DATEDIFF(year,MAX(birthdate),GETDATE()) youngest_age
FROM gold.dim_customers