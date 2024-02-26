-- Agenda
-- Sakila Database 
-- CRUD Operations
	-- Create (Creating DB, Creating Tables, Inserting Rows) 
    -- Read 
		-- SELECT 
        -- DISTINCT 
        -- Operations on Columns 
        -- WHERE Clause
        -- AND, OR, NOT Operator 
        -- IN Operator 
	-- Update (Next Class)
    -- Delete (Next Class)
    
SELECT * 
FROM payment;

INSERT INTO
payment(customer_id,staff_id,rental_id,amount,payment_date)
VALUES 
(500,2,15720,3.75,'2005-08-23 11:25:00'),
(700,2,15720,5.75,'2005-08-25 11:25:00'),
(600,2,15720,6.75,'2005-08-24 11:25:00');

INSERT INTO
payment(payment_id,customer_id,staff_id,rental_id,amount,payment_date)
VALUES 
(17000,500,2,15720,3.75,'2005-08-23 11:25:00');

-- READ 
SELECT *
FROM film;

-- AS
SELECT title AS "film name",release_year,length AS duration
FROM film;

-- Mathematical Expression
SELECT title AS "film name",release_year,(length/60) AS durationInHrs
FROM film;

-- Mathematical Functions 
-- TODO: Google about mathematical functions in. MySQL
SELECT title AS "film name",
		release_year,
        ROUND((length/60),2) AS durationInHrs
FROM film;

-- SELECT as Print 
SELECT 1,"Hello";
SELECT ROUND(10.5678,2);

-- NOW() returns the current date-time
SELECT NOW();

-- DISTINCT 
SELECT DISTINCT rating
FROM film;

SELECT DISTINCT rating,release_year
FROM film;

-- WHERE Clause
SELECT * 
FROM film 
WHERE release_year=2021 OR release_year=2023 OR release_year=2024;

-- WHERE Clause
SELECT DISTINCT rating,release_year
FROM film 
WHERE release_year=2021 OR release_year=2023 OR release_year=2024;

-- AND, OR, NOT 
SELECT  title,rating,release_year
FROM film 
WHERE release_year=2006 AND rating='G';

-- NOT 
SELECT  title,rating,release_year
FROM film 
WHERE release_year=2006 AND rating!='G';

-- NOT 
SELECT  title,rating,release_year
FROM film 
WHERE release_year=2006 AND NOT rating='G';

-- NOT 
SELECT  title,rating,release_year
FROM film 
WHERE release_year!=2006 AND rating!='G';

-- query to get movies where release!=2006 and rating!=G
SELECT  title,rating,release_year
FROM film 
WHERE NOT (release_year=2006 OR rating='G');


-- Multiple ORs
SELECT  rating,release_year
FROM film 
WHERE release_year=2021 OR release_year=2023 OR release_year=2024 OR release_year=2008;

-- IN Operator 
SELECT  rating,release_year
FROM film 
WHERE release_year IN (2021,2023,2024,2008);

-- NOT IN 
-- IN Operator 
SELECT  rating,release_year
FROM film 
WHERE release_year NOT IN (2021,2023,2024,2008);


-- Question: 
-- Assume there is student table
-- Print students having psp>=80% and attendance less than 90%
SELECT *
FROM STUDENT 
WHERE psp>=80 AND attendance<90;
