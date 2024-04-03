-- Agenda 
-- READ
	-- BETWEEN 
	-- LIKE 
	-- REGEXP
	-- IS NULL 
	-- ORDER BY 
	-- LIMIT
    
-- UPDATE 
-- DELETE 

-- Between Example
SELECT title,description,release_year 
FROM film
WHERE release_year BETWEEN 2020 AND 2025;

-- Lexicographic matching acc to dictionary order 
SELECT title,description,release_year 
FROM film
WHERE title BETWEEN "AfricanEgg" AND "India";

-- movies with word love inside title (case insensitive)
SELECT title,description,release_year 
FROM film
WHERE title LIKE "%love%";

-- movies starting with word love 
SELECT title,description,release_year 
FROM film
WHERE title LIKE "love%";

-- movies starting with word love 
SELECT title,description,release_year 
FROM film
WHERE title REGEXP "^love";

-- movies containing the word love 
SELECT title,description,release_year 
FROM film
WHERE title REGEXP "love";

-- IS NULL Operator  (later)
SELECT * 
FROM address
WHERE address2 IS NULL;

SELECT * 
FROM address
WHERE address2 IS NOT NULL;

-- Order BY 
SELECT * 
FROM payment
WHERE customer_id=591
ORDER BY amount DESC,payment_date ASC
LIMIT 3;

SELECT * 
FROM payment
ORDER BY amount DESC,payment_id DESC
LIMIT 3;

SELECT * 
FROM payment;

-- LIMIT 
-- Google Search 
-- 1-10 records, 11-20 records, 21-30 records ... 
-- Records from Row 151 to 250
SELECT * 
FROM film 
LIMIT 100 OFFSET 150; 

-- 5 Min Break (10.25)
-- UPDATE (multiple columns)
UPDATE  film
SET title = "Scaler", rating="PG" 
WHERE film_id=1;

-- Delete VS Truncate Vs DROP 
-- Truncate 
USE scalerDB;

-- delete the entire table and re-creates just the table structure 
TRUNCATE students;

-- DROP (delete the entire table including table structure)
DROP TABLE students;

-- batches 
SELECT * 
FROM batches;

-- delete certain rows
DELETE FROM batches
WHERE batch_id=1;

DELETE FROM batches
WHERE batch_name="DSA";

-- 22:40:10	DELETE FROM batches WHERE batch_name="DSA"	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.00042 sec
-- 22:37:37	DELETE FROM batches WHERE batch_name="ML"	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.00063 sec
-- 22:38:06	DELETE FROM batches WHERE batch_name="ML"	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.00045 sec

DROP DATABASE scalerDB;



