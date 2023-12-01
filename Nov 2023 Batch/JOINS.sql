USE scalerDB;
-- 6 rows 
SELECT * 
FROM batches;

-- 5 rows
SELECT * 
FROM students;

-- JOIN 
SELECT * 
FROM students
JOIN batches
WHERE first_name = "Naman";

-- JOIN without a condition (CROSS Join)
SELECT first_name,batch_name
FROM students
JOIN batches;

SELECT first_name,batch_name 
FROM batches
JOIN students;

-- JOIN with a condition (CROSS Join)
SELECT *
FROM students
JOIN batches 
ON students.batch_id = batches.batch_id;

-- Show Naman and his batch
SELECT first_name,batch_name
FROM students
JOIN batches 
ON students.batch_id = batches.batch_id 
WHERE first_name="Naman";

-- Sakila Database
-- Show film and its language for every film
USE sakila;

SELECT f.language_id, f.title, l.name AS LangName
FROM film f
JOIN language l
ON f.language_id = l.language_id;
-- If a coloumn is present in both tables, then you have to specify explicity tablename.column name
-- 21:09:45	SELECT language_id FROM film f JOIN language l ON f.language_id = l.language_id	Error Code: 1052. Column 'language_id' in field list is ambiguous	0.00042 sec

-- 
USE classicmodels;
-- Problem Statement:
SELECT emp.firstName,emp.lastName,emp.jobTitle,emp.email, mgr.firstName AS "ManagerName",mgr.lastName AS "ManagerLastName",mgr.jobTitle AS "ManagerJob"
FROM employees emp 
JOIN employees mgr
ON emp.reportsTo = mgr.employeeNumber 
WHERE emp.jobTitle LIKE "%sales%"
ORDER BY emp.firstName;


