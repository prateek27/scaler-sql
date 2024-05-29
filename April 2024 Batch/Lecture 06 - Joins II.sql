-- Homework: Sakila Database
-- Show each actor with film(s) they have done 
-- Deepika,f1
-- Deepika, f7 
-- Sharukhan, f8

SELECT a.* , f.*
FROM film_actor fa 
JOIN actor a 
ON fa.actor_id = a.actor_id
JOIN film f
ON fa.film_id = f.film_id;

-- LEFT Outer Join
SELECT * 
FROM students s
LEFT JOIN batches b 
ON s.batch_id = b.batch_id;

-- RIGHT Outer Join
SELECT * 
FROM students s
RIGHT JOIN batches b 
ON s.batch_id = b.batch_id;

-- CROSS JOIN (Cross keyword is optional)
SELECT * 
FROM students
JOIN batches;

-- USING Keyword
SELECT * 
FROM students s
JOIN batches b 
USING (batch_id);

-- NATURAL JOIN (inner join based upon batch_id since 'batch_id' is the only column that is same in both)
SELECT * 
FROM students s 
NATURAL JOIN batches; 

-- Implicit JOIN (same as cross join)
SELECT * 
FROM students s, batches b;

-- Implicit JOIN (then filter using where) [SLOW --> Bigger Table because of cross join and then you are filtering]

-- smaller table 
SELECT * 
FROM students s
JOIN batches b
USING (batch_id);


-- bigger table and then filtering
SELECT * 
FROM students s, batches b
WHERE s.batch_id = b.batch_id;

SELECT * 
FROM students s
JOIN batches b
WHERE s.batch_id = b.batch_id;

-- UNION  data 
USE classicmodels;

SELECT customerName AS "Name", phone  AS "Contact Info"
FROM customers
UNION
SELECT CONCAT(firstName," ",lastName), email 
FROM employees
UNION
SELECT CONCAT(lastName," ",firstName), email 
FROM employees;

















