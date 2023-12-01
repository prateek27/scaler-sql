USE sakila;


SELECT  CONCAT(a.first_name, " ",a.last_name) AS "Actor Name",f.title AS MovieName
FROM film_actor fa 
JOIN actor a
ON fa.actor_id = a.actor_id
JOIN film f
ON f.film_id = fa.film_id;

-- For every film, name all the films that were release in the range of 2 years
-- Before or after than film and there rental rate was more than the rate of th
SELECT f1.title,f1.rental_rate,f1.release_year,f2.title,f2.rental_rate,f2.release_year
FROM film f1 
JOIN film f2 
ON f2.release_year BETWEEN f1.release_year-2 AND f1.release_year +2 
AND f2.rental_rate > f1.rental_rate 
ORDER BY f1.title;

-- Self Join 
-- Problem Statement 

-- Problem Statement
-- Left Joins assumes all employees have a manager even if is NULL
SELECT emp.firstName,emp.lastName,emp.jobTitle,emp.email, mgr.firstName AS "ManagerName",mgr.lastName AS "ManagerLastName",mgr.jobTitle AS "ManagerJob"
FROM employees emp 
LEFT JOIN employees mgr
ON emp.reportsTo = mgr.employeeNumber 
ORDER BY emp.firstName;

-- Right Joins assumes all employees are manager, even if they have 0 reportees 
USE classicmodels;
SELECT emp.firstName,emp.lastName,emp.jobTitle,emp.email, mgr.firstName AS "ManagerName",mgr.lastName AS "ManagerLastName",mgr.jobTitle AS "ManagerJob"
FROM employees emp 
RIGHT JOIN employees mgr
ON emp.reportsTo = mgr.employeeNumber 
ORDER BY emp.firstName;

-- INNER JOIN with Compound Conditon (wont work as President is getting with every other employee)
SELECT emp.firstName,emp.lastName,emp.jobTitle,emp.email, mgr.firstName AS "ManagerName",mgr.lastName AS "ManagerLastName",mgr.jobTitle AS "ManagerJob"
FROM employees emp 
JOIN employees mgr
ON emp.reportsTo=mgr.employeeNumber OR emp.reportsTo IS NULL;

-- If we want to allow null values on both sides
-- Combine the results of LEFT JOIN and Right JOIN using UNION

SELECT COUNT(*)
FROM employees;

-- CROSS JOIN  (a join without a condition)
USE ScalerDB;
SELECT * 
FROM students 
CROSS JOIN batches;
-- same as above 
SELECT * 
FROM students 
JOIN batches;

-- JOIN using "USING" Keyword 
SELECT * 
FROM students s
JOIN batches b 
ON s.batch_id = b.batch_id;

-- simplify the syntax use USING if colm names are same
SELECT * 
FROM students s
JOIN batches b 
USING (batch_id); 

-- NATURAL JOIN (will not include NULL batch_id)
SELECT * 
FROM students s
NATURAL JOIN batches b;
-- match on all colms with same name

-- Implicit Join (CROSS Join)
SELECT * 
FROM students s, batches b;

SELECT * 
FROM students s1,students s2;


-- Find student and its batch for Naman 
SELECT * 
FROM students s
JOIN batches b 
USING (batch_id)
WHERE s.first_name = "Naman";

SELECT * 
FROM students s
JOIN batches b 
ON s.batch_id = b.batch_id
WHERE s.first_name = "Naman";

SELECT * 
FROM students s
JOIN batches b 
ON s.batch_id = b.batch_id
WHERE s.first_name = "Naman";

SELECT * 
FROM students s
JOIN batches b 
WHERE s.batch_id = b.batch_id AND s.first_name = "Naman";

-- UNION Example
SELECT customerName AS "UserName",phone
FROM customers
UNION
SELECT concat(firstname," ",lastName) AS name, extension
FROM employees;


