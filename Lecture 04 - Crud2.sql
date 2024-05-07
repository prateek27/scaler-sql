USE sakila;


SELECT * 
FROM film 
WHERE release_year BETWEEN 2010 AND 2020;

-- the comparison is case insensitive for strings
SELECT * 
FROM film 
WHERE title BETWEEN "bat" AND "cat";

-- timestamp 
SELECT * 
FROM film 
WHERE last_update BETWEEN '2020-02-15' AND '2025-02-15';

-- LIKE Operator 
-- words ending with man or just man
SELECT * 
FROM film 
WHERE description LIKE "%man %" OR description LIKE "% man %";

-- REGEXP 
SELECT * 
FROM film 
WHERE description REGEXP "man$";

-- Finding out rows with NULL Values for address2
SELECT * 
FROM address
WHERE address2 IS NULL;

-- ORDER BY (Sort the records) 
-- Filtering (WHERE) --> Sorting (ORDER) --> Printing
SELECT title,release_year
FROM film 
WHERE rating = 'G'
ORDER BY release_year ASC, title DESC;

SELECT title,release_year, last_update
FROM film 
WHERE rating = 'G'
ORDER BY last_update DESC;

-- Limit and Offset 
SELECT film_id,title,length,release_year 
FROM film 
ORDER BY length DESC
LIMIT 10;

SELECT film_id,title,length,release_year 
FROM film 
ORDER BY length DESC
LIMIT 10 OFFSET 10;

-- skip the first 20 records, give the next 100 records
SELECT film_id,title,length,release_year 
FROM film 
ORDER BY length DESC
LIMIT 100 OFFSET 20;


-- Updates (updates to data, changing the value)
UPDATE film 
SET description = "An awesome movie"
WHERE film_id = 1;

-- Update multiple columns in one go 
UPDATE film
SET rating = 'PG-13',
release_year = 2024
WHERE film_id = 1;

SELECT * 
FROM film;

-- TODO: Play with ALTER Command (HomeWork) 
-- ALTER (Changing the table structure -> Add a colm, delete a column, rename the table, add a primary key ...) 

SELECT batch_id,instructor,batch_name 
FROM batches;

-- Add a instructor col with every batch 
ALTER TABLE batches ADD instructor VARCHAR(100);

-- updating a values in a one or more columns column 
UPDATE batches 
SET instructor = "Deepak"
WHERE batch_id IN (3);

-- dropping a column 
ALTER TABLE batches DROP COLUMN instructor;


-- Deletion (use delete along with WHERE clause)
DELETE FROM batches
WHERE batch_id = 1;



-- 08:35:06	DELETE FROM batches	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`scalerdb`.`students`, CONSTRAINT `students_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`) ON DELETE RESTRICT ON UPDATE CASCADE)	0.0035 sec
SELECT * 
FROM batches;

-- Delete all the rows of the table  (Delete the data + but empty table still exists)
TRUNCATE students;

SELECT
* FROM students;

-- DROP (Delete data + table structure)

DROP TABLE students;

SELECT * 
FROM batches;

-- Delete : specify set of rows, delete all rows , rollback is possible 

-- Truncate : delete all the rows, truncate is faster (it simply DROPs the table and re-creates the structure), No rollback
-- Drop : destroy the table (including the structure), No Rollback is possible















USE scalerDB;
ALTER TABLE batches RENAME TO scalerBatches;
ALTER TABLE scalerBatches ADD instructor VARCHAR(200);
SELECT * FROM 
scalerBatches;






