
-- JOINS 
SELECT * 
FROM students  -- m rows 
JOIN batches;  -- n rows 
-- output = m*n rows 

-- select all columns from both the tables
SELECT * 
FROM students  
JOIN batches
ON students.batch_id = batches.batch_id;

-- select two columns 
SELECT CONCAT(first_name," ",last_name) AS studentName, batch_name 
FROM students  
JOIN batches
ON students.batch_id = batches.batch_id;

-- retrieve the batch name for "Mangesh Kr"
SELECT CONCAT(first_name," ",last_name) AS studentName, batch_name 
FROM students  
JOIN batches
ON students.batch_id = batches.batch_id AND batch_name="SQL";

-- Query using Join + Where 
SELECT CONCAT(first_name," ",last_name) AS studentName, batch_name 
FROM students  
JOIN batches
ON students.batch_id = batches.batch_id 
PRIMARYWHERE batch_name="SQL";


-- Order of Joining 
SELECT student_id,b.batch_id 
FROM students s
JOIN batches b
ON s.batch_id = b.batch_id;

-- Joins are optimised using Index Looks up (if the index is created for that column)
EXPLAIN ANALYZE 
SELECT student_id,b.batch_id
FROM batches b
JOIN students s
ON s.batch_id = b.batch_id;

-- create the binary tree ;) for fast looks ups or joins based upon batch_name [Separate Class]
CREATE INDEX idx_batch_name ON batches(batch_name);

-- Todo: Sakila Database (10.05 PM)
-- Show every film title, release_year and its language
-- show movies which were in italian 
USE sakila;
SELECT f.title, f.release_year,l.name 
FROM film f
JOIN language l
ON f.language_id = l.language_id AND l.name = "Italian";

-- Todo: classicmodels Database (Cars Database, Sales, ...)  
-- Download : https://www.mysqltutorial.org/getting-started-with-mysql/mysql-sample-database/
USE classicmodels;


-- Self Join Example 
-- TODO: print every employee name, emp job title, manager name, manager job title 
SELECT emp.firstName, emp.jobTitle, mgr.firstName, mgr.jobTitle 
FROM employees emp
JOIN employees mgr
ON emp.reportsTo = mgr.employeeNumber;

-- PRACTICE QUERIES 
-- Todo 1 : Sakila Database
-- For every film name all the films that were release in the range +- 2 years from the current film, 
-- and there rental rate was more than the rental rate of current film 
SELECT * 
FROM film f1
JOIN film f2 
ON f2.release_year BETWEEN f1.release_year - 2 AND f1.release_year + 2 
AND f2.rental_rate > f1.rental_rate;


-- Todo 2 (Time to try till 10.57)
-- TODO: classicmodels
-- Show all orders along with customer information with customers from "France"
-- sort the orders according to orderDate
SELECT o.*,  c.customerName, c.country
FROM orders o
JOIN customers c
ON o.customerNumber = c.customerNumber AND c.country="France";

-- Todo 3 : Homework (Sakila Database)
-- Show each actor name with film name he/she has done
























