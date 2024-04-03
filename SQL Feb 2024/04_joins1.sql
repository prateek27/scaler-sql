
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

-- TODO Time till 10.50
-- Show each actor name with film name he/she has done
SELECT fa.actor_id,fa.film_id, CONCAT(first_name,last_name), f.title
FROM film_actor fa
JOIN actor a
ON fa.actor_id = a.actor_id 
JOIN film f 
ON fa.film_id = f.film_id;

SELECT fa.actor_id,fa.film_id, CONCAT(first_name,last_name), f.title
FROM film_actor fa
JOIN actor a
USING (actor_id)
JOIN film f 
USING (film_id);

-- TODO: classicmodels
-- Show all orders along with customer information with customers from "France"
-- sort the orders according to orderDate
SELECT *
FROM orders o
JOIN customers c
ON o.customerNumber = c.customerNumber 
WHERE c.country = "France"
ORDER BY orderDate;

SELECT *
FROM orders o
JOIN customers c
USING (customerNumber)
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

-- debugging shazi's code
SELECT o.orderNumber,o.orderDate,c.customerNumber,c.country,c.customerName , CONCAT(c.contactFirstName,c.contactLastName)
FROM classicmodels.orders o
JOIN classicmodels.customers c
ON c.customerNumber=o.customerNumber
WHERE c.country="France"
ORDER BY o.orderDate DESC;



-- JOINS-II
SELECT * 
FROM students;

SELECT * 
FROM batches;

-- Inner Join (Default)
SELECT * 
FROM students S
JOIN batches B
ON S.batch_id = B.batch_id;

-- Left Outer Join (Default)
SELECT * 
FROM students S
LEFT JOIN batches B
ON S.batch_id = B.batch_id;

-- Right Outer JOIN
SELECT * 
FROM students S
RIGHT JOIN batches B
ON S.batch_id = B.batch_id;


-- classic models DB
SELECT * 
FROM employees;

-- Include all employees even if they don't have a manager
SELECT CONCAT(emp.firstName,emp.lastName) AS "Employee", emp.jobTitle, 
CONCAT(mgr.firstName,mgr.lastName) AS "Manager",mgr.jobTitle
FROM employees emp
LEFT JOIN employees mgr
ON emp.reportsTo = mgr.employeeNumber;

-- Include all managers even if they don't have a reportee
EXPLAIN ANALYZE
SELECT CONCAT(emp.firstName,emp.lastName) AS "Employee", emp.jobTitle, 
CONCAT(mgr.firstName,mgr.lastName) AS "Manager",mgr.jobTitle
FROM employees emp
RIGHT JOIN employees mgr
ON emp.reportsTo = mgr.employeeNumber;

'-> Nested loop left join  (cost=23.3 rows=75.6) (actual time=0.681..1.12 rows=39 loops=1)\n    -> Table scan on mgr  (cost=2.55 rows=23) (actual time=0.347..0.357 rows=23 loops=1)\n    -> Index lookup on emp using reportsTo (reportsTo=mgr.employeeNumber)  (cost=0.589 rows=3.29) (actual time=0.0315..0.0323 rows=0.957 loops=23)\n'


-- CROSS JOIN (doesnt compare, matching everything with everything)
USE scalerDB;

SELECT * 
FROM students
CROSS JOIN batches;

-- USING KEYWORD (you specify one or more colums)
SELECT * 
FROM students
JOIN batches 
USING (batch_id);

-- NATURAL JOIN (automatically picks and compares all columns with same name)

SELECT * 
FROM students 
NATURAL JOIN batches;

-- Implicit JOIN (same as cross join)
SELECT *
FROM students, batches;




-- TODO: Do a UNION of Cusotmers Name,phoneNo, Employees Names, email
SELECT customerName AS Name,phone AS "Contact Detail"
FROM customers
UNION ALL
SELECT CONCAT(firstName, " ",lastName), email
FROM employees;











