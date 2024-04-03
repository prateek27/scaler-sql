
-- JOINS
USE sakila;

-- TODO: write an update query to update language id of some films 
-- Show every film title, release_year and its language
-- show movies which were in italian 
SELECT f.title,f.release_year,l.name,l.language_id
FROM film f
JOIN language l
ON f.language_id = l.language_id
WHERE l.name="Italian";

-- Look at the employees tables 
USE classicmodels;

-- print name,jobtitle of every employee 
-- along with manager name, manager's job title 
SELECT CONCAT(emp.firstName,emp.lastName) AS "Employee", emp.jobTitle, 
CONCAT(mgr.firstName,mgr.lastName) AS "Manager",mgr.jobTitle
FROM employees emp
JOIN employees mgr
ON emp.reportsTo = mgr.employeeNumber;

-- TODO: Write a query to find out the head of the company!
SELECT * 
FROM employees
WHERE reportsTo IS NULL;

-- TODO: Sakila Database 
-- For every film, name all the films that were release 
-- in the range of 2 years +- of that film
--  and there rental rate was more than the rate of the 
-- of given film
-- 10 min chai break 

SELECT f1.title, f1.release_year, f1.rental_rate, f2.title, f2.release_year, f2.rental_rate
FROM film f1 
JOIN film f2 
ON f2.release_year BETWEEN f1.release_year - 2 AND f2.release_year + 2 
AND f2.rental_rate > f1.rental_rate;

-- TODO Time 
-- Show each actor name with film name he/she has done
SELECT fa.actor_id,fa.film_id, CONCAT(first_name,last_name), f.title
FROM film_actor fa
JOIN actor a
ON fa.actor_id = a.actor_id 
JOIN film f 
ON fa.film_id = f.film_id;

-- TODO: classicmodels
-- Show all orders along with customer information with customers from "France"
-- sort the orders according to orderDate
SELECT *
FROM orders o
JOIN customers c
ON o.customerNumber = c.customerNumber 
WHERE c.country = "France"
ORDER BY orderDate;

-- scaler db example 
USE scalerDB;

SELECT *
FROM students;

SELECT * 
FROM batches;

SELECT *
FROM students
JOIN batches
ON students.batch_id = batches.batch_id;



