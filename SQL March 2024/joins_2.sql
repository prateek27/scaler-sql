
-- Todo 3 : Homework (Sakila Database)
-- Show each actor name with film name he/she has done
SELECT CONCAT(a.first_name," ",a.last_name) AS "actorName", title 
FROM film_actor fa
JOIN actor a
ON fa.actor_id = a.actor_id
JOIN film f
ON fa.film_id = f.film_id;

-- CODE DEMO 
-- Inner JOIN 
-- Writing "Inner" is optional
USE scalerDB;
SELECT * 
FROM students s
INNER JOIN batches b
ON s.batch_id = b.batch_id;

-- Left outer Join
-- include all rows of the student table
USE scalerDB;
SELECT * 
FROM students s
LEFT JOIN batches b
ON s.batch_id = b.batch_id;

-- include all rows of the batch table
USE scalerDB;
SELECT * 
FROM students s
RIGHT JOIN batches b
ON s.batch_id = b.batch_id;

-- CROSS JOIN 
SELECT * 
FROM students
JOIN batches;

-- USING (Syntactic Sugar : Same as inner join, but different syntax)
-- join 2 tables on a column that has same name in both the tables 
SELECT * 
FROM students s
LEFT JOIN batches b
USING (batch_id);

-- Show each actor name with film name he/she has done
SELECT CONCAT(a.first_name," ",a.last_name) AS "actorName", title 
FROM film_actor fa
JOIN actor a
USING (actor_id)
JOIN film f
USING (film_id);

-- 10 MIN BREAK till 10.20 PM
-- Natural Left Outer Join
SELECT * 
FROM students s
NATURAL LEFT JOIN batches b;
-- Natural Innter Join
-- here it will automatically picky "batch_id" for matching as it is present in 2 tables
SELECT * 
FROM students s
NATURAL JOIN batches b;

-- Join with out JOIN 
SELECT * 
FROM students s
JOIN batches b 
ON s.batch_id = b.batch_id;

SELECT * 
FROM students s
JOIN batches b 
USING (batch_id);

-- Implicit Join (another syntax of CROSS JOIN)
-- Join in which we don't use the join keyword
SELECT * 
FROM students s,batches b;

-- efficient way of joining students with batches (cross join first)
-- smaller table , lesser memory and less time
SELECT * 
FROM students s
JOIN batches b
ON s.batch_id = b.batch_id;

-- inefficient way of joining students with batches (cross join first)
-- creates a bigger intermediate table and then you filter , more memory & more time
SELECT * 
FROM students s,batches b
WHERE s.batch_id = b.batch_id;

-- UNION (vertically stack the results of multiple queries), the number of columns retrieved must be same from all the queries
SELECT customerName "NAME",city AS "Info" FROM customers
UNION
SELECT CONCAT(firstName," ",lastName) AS name, email FROM employees
UNION
SELECT CONCAT(firstName," ",lastName) AS name, email FROM employees;