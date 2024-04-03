USE sakila;

SELECT * 
FROM film 
WHERE release_year>=2020 AND release_year<=2030;

SELECT * 
FROM film 
WHERE release_year BETWEEN 2020 AND 2030;

-- use between with numeric values, dates, strings 
SELECT * FROM payment 
WHERE payment_date BETWEEN "2005-06-18" AND "2010-06-18";

-- string also
SELECT CONCAT(first_name," ",last_name) AS full_name FROM actor
WHERE CONCAT(first_name," ",last_name) BETWEEN "A" and "D";

-- CONCAT 
SELECT CONCAT("Hello"," ","World");

-- Like Operator 
-- Find out all films which contain the word "AIR" inside film name 
SELECT * 
FROM film 
WHERE title LIKE "%AIR%";

-- Like Operator 
-- Find out all films which contain the any word starting with "AIR" inside film name 
SELECT * 
FROM film 
WHERE title LIKE "AIR%" OR title LIKE "% AIR%";

-- Homework: more complex matching, SQL also support REGEXP (Regular Expressions)
-- more powerful patterns using the concept of regular expressions 

-- Find out all the movies ending with "Lane"
SELECT * 
FROM film 
WHERE title REGEXP "port$";

-- case sensitive search "use BINARY"
SELECT * 
FROM film 
WHERE title LIKE BINARY "%PORT";

-- _ example
SELECT * 
FROM film 
WHERE title LIKE  "%P_T";

-- = NULL doesn't work instead use IS NULL
SELECT * 
FROM address
WHERE address2 IS NULL OR address2="";

-- !=NULL doesnt work instead IS NOT NULL
SELECT * 
FROM address
WHERE address2 IS NOT NULL;

-- Find out films with NULL title
SELECT * 
FROM film 
WHERE description IS NULL;

-- Order By Clause = Sorting 
-- Default Ordering: Primary Key Ascending 
SELECT *
FROM film 
WHERE release_year>=2020
ORDER BY title;

SELECT *
FROM film 
WHERE release_year>=2020
ORDER BY title DESC;

-- multiple columns in Ordering (levels of comparisons)
-- Order of Execution: Filtering --> Sorting --> Limit --> Printing 
SELECT *
FROM film 
WHERE release_year>=2020
ORDER BY release_year ASC, title DESC
LIMIT 3;

-- LIMIT Clause 
-- Restrict the number of results
SELECT * 
FROM film
LIMIT 10;

SELECT * 
FROM film
LIMIT 10 OFFSET 10;

-- load movies from 21 to 30
SELECT *
FROM film 
LIMIT 10 OFFSET 20;


-- load movies from 101-150
SELECT *
FROM film 
LIMIT 50 OFFSET 100;

-- Update some cols 
-- you want to one or more cols of one or more rows 

UPDATE film 
SET description = "A great movie"
WHERE description IS NULL;

SELECT * FROM film
WHERE description="A great movie";

-- Update Multiple Cols 
UPDATE film 
SET release_year=2011, 
rating='PG' 
WHERE film_id=1;

SELECT * FROM film
WHERE film_id=1;

SET SQL_SAFE_UPDATES=0;

UPDATE film 
SET release_year=2007;

-- Delete : Delete vs Truncate vs Drop 

-- Delete one or more rows from the table
SELECT * 
FROM film;

DELETE FROM film 
WHERE film_id=1005;

-- Truncate And DROP to clear the entire table 
USE scalerDB;

TRUNCATE students; -- all rows are delete but students as a empty table still exists
-- Truncate delete the entire table and then re-creates the structure, so for deleting all rows truncate will be faster 
-- Once you truncate, no rollback is possible 

DROP TABLE students; -- remove the complete table including the structure, child table 
DROP TABLE batches;  -- parent table 






























