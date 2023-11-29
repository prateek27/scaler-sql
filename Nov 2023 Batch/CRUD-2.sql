USE sakila;

-- Select movies release in the year 2005 to 2008 (both inclusive)

SELECT * 
FROM film
WHERE release_year >= 2005 AND release_year <=2008;

-- IN is not a good choice if there is range 
SELECT *
FROM film
WHERE release_year IN (2005,2006,2007,2008);

-- Instead use BETWEEN Operator
SELECT * 
FROM film
WHERE release_year BETWEEN 2011 AND 2020;

SELECT *
FROM film;

-- LIKE Operator
-- Find movies which contain BA in between title 

SELECT * from film
WHERE title LIKE "%BA%";

-- use Binary if you need case-sensitive results
SELECT * from film
WHERE description LIKE BINARY "%batman%";

SELECT * from film
WHERE description LIKE BINARY "%Batman%";

SELECT * from film
WHERE description LIKE "%ba%" OR  "%ca";

-- IS NULL, IS NOT NULL
SELECT *
FROM film 
WHERE description IS NULL;

SELECT *
FROM film 
WHERE description IS NOT NULL;

-- ORDER BY 
SELECT * 
FROM FILM
ORDER BY title ASC;

SELECT * 
FROM FILM
ORDER BY title DESC;

-- TIE-Breaker Logic, you can specify second column
-- if title is same, then release release year will compared
SELECT * 
FROM film
ORDER BY title ASC, release_year DESC;


-- can you order by on a column which is not present in select caluse?
-- YES
SELECT title 
FROM film
WHERE title LIKE "%ba%"
ORDER BY release_year;

-- ORDERBY + DISTINCT 
SELECT DISTINCT title 
FROM film 
ORDER BY release_year;
-- Error ^
-- 22:20:45	SELECT DISTINCT title  FROM film  ORDER BY release_year	Error Code: 3065. Expression #1 of ORDER BY clause is not in SELECT list, references column 'sakila.film.release_year' which is not in SELECT list; this is incompatible with DISTINCT	0.00048 sec

-- valid
SELECT DISTINCT title
FROM film 
ORDER BY title;

-- valid
-- works fine
SELECT DISTINCT title,release_year 
FROM film 
ORDER BY release_year;

-- LIMIT Clause (41 to 60)
SELECT * 
FROM film
ORDER BY title
LIMIT 20 OFFSET 40;

-- Update a Record
UPDATE film
SET release_year = 2023
WHERE film_id BETWEEN 1 AND 5;

SELECT *
FROM film;
-- 22:35:52	UPDATE film SET release_year = 2023	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.0010 sec

-- Delete a particular row/record
DELETE FROM film 
WHERE title="RRR";
-- rollback can happen if it is not committed.

-- can't find 
SELECT * FROM film
WHERE title="RRR";

-- Delete, Truncate, Drop 
DROP table  scalerDB.students;
-- drop deletes all rows + table structure alter
-- can't rollback

TRUNCATE table scalerDB.batches;
-- delete everything, it will re-create table schema 
-- Truncate is faster than delete 
-- can't rollback




