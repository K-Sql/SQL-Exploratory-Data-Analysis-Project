/*
Script Purpose: The purpose of this code is to: 
1) Explore the internal schema of our tables in the database used.
2) Explore the metadata of the tables in our database. As a filter the table 'dim_customers is the subject of our query.
*/

--Explore All Objects in the Database
SELECT * FROM INFORMATION_SCHEMA.TABLES

--Explore all columns in the database
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'dim_customers'