USE sakila;

SELECT title
FROM film
WHERE release_year BETWEEN 2008 AND 2020;

SELECT title
FROM film
WHERE title BETWEEN "Academy" AND "Scaler";

-- LIKE Operator
-- "word dino in between" 
SELECT title
FROM film 
WHERE title LIKE "%DINO%";

-- "title starts with DINO" 
SELECT title
FROM film 
WHERE title LIKE "DINO%";

-- "title starts with DINO"  or contains "FLIGHT"
SELECT title
FROM film 
WHERE title LIKE "DINO%" OR title LIKE "%FLIGHT%";

-- Show film table 
SELECT *
FROM film; 

-- filter out movies where description = NULL
-- you can't compare any column = NULL directly (equal to operator) 
-- IS NULL Operator 
SELECT * 
FROM film 
WHERE description IS NULL;

SELECT * 
FROM film 
WHERE description IS NOT NULL;

-- sometimes you may skip rows because of NULL values 
-- explicitly matching it with null
SELECT * 
FROM film 
WHERE release_year!=2005 OR release_year IS NULL;

-- Order By
SELECT * 
FROM film 
ORDER BY title DESC;


-- Order of Execution : Filtering -> Sorting -> Printing 
SELECT *
FROM film 
WHERE release_year = 2006 OR release_year IS NULL
ORDER BY release_year DESC, title DESC;

-- Limit the number of records 
SELECT *
FROM film 
ORDER BY title 
LIMIT 10;

SELECT *
FROM film 
ORDER BY title 
LIMIT 10 OFFSET 10;

-- Records from 31 to 50 
SELECT *
FROM film 
ORDER BY title 
LIMIT 20 OFFSET 30;
-- offset means ignore first 30 rows, limit means read next 20 rows

-- UPDATE multiple columns of one or more rows 
UPDATE film 
SET release_year = 2008,
description = "An awesome movie"
WHERE film_id=31;



-- Alter (Modify the table structure) 
-- Todo: Try out various forms of alteration you can do on a table (ChatGPT)
ALTER TABLE batches 
ADD instructor VARCHAR(100);

UPDATE batches 
SET instructor = "Prateek" 
WHERE batch_id IN (3,4);

UPDATE batches 
SET instructor = "Deepak" 
WHERE batch_id IN (11);

SELECT * 
FROM scalerDB.batches;

ALTER TABLE batches
DROP COLUMN instructor;


-- Modifying the datatype of the column
-- ALTER TABLE table_name
-- MODIFY COLUMN column_name datatype;

-- DELETE 
-- Delete FROM table_name WHERE condition;
SELECT * 
FROM batches;

SELECT * 
FROM students;

DELETE FROM students
WHERE student_id = 2;

DELETE FROM batches 
WHERE batch_name = "MLAI";


-- 08:35:30	DELETE FROM batches  WHERE batch_name = "MLAI"	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`scalerdb`.`students`, CONSTRAINT `students_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`) ON DELETE RESTRICT ON UPDATE CASCADE)	0.0025 sec


DELETE FROM film 
WHERE film_id > 0;
-- 08:36:33	DELETE FROM film  WHERE film_id = 2	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`sakila`.`film_actor`, CONSTRAINT `fk_film_actor_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE)	0.0023 sec

-- TRUNCATE (delete all the rows = Delete the entire table including structure + recreate the recreate table structure)
-- clear out all the rows of the table 
TRUNCATE students;

-- DROP (data + table structure is destroyed) 
DROP TABLE students;
DROP TABLE batches;


SET AUTOCOMMIT = 0;

SELECT * 
FROM language;

DELETE FROM language
WHERE name = "Hindi";

SELECT * 
FROM language;

rollback;














