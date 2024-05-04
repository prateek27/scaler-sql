-- Topics 
-- Sakila Database
-- CRUD Operations 
		-- Create DB, Create Table (done)
		-- Insert Rows 
    -- READ 
		-- Select 
		-- Distinct 
		-- Where 
		-- AS 
		-- AND, OR, NOT 
        -- IN Operator 
        -- More Concept (next classes)
	-- Update and Delete (next class) 
    
USE sakila;
-- Sakila DB: Online DVD Rental Store
INSERT INTO payment(customer_id, staff_id,amount,payment_date) 
VALUES 
(500,2,300, '2023-05-04 00:54:12'),
(400,2,300, '2023-05-04 00:54:12'),
(312,2,300, '2023-05-04 00:54:12');

-- Payments View
SELECT * 
FROM payment;

-- 07:23:32	INSERT INTO payment(customer_id, staff_id,amount,payment_date)  VALUES  (500,2,300, '2024-05-04 00:54:12'), (800,2,300, '2024-05-04 00:54:12'), (700,2,300, '2024-05-04 00:54:12')	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`sakila`.`payment`, CONSTRAINT `fk_payment_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE CASCADE)	0.018 sec
SELECT customer_id 
FROM customer;

-- Insert Something Into "film" Table 
INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, special_features) 
VALUES ('Tiger3', 'Batman fights the Joker', 2008, 1, 3, 4.99, 152, 19.99,  'Trailers'),
       ('RRR', 'Batman fights Bane', 2012, 1, 3, 4.99, 165, 19.99, 'Trailers'),
       ('DDLJ', 'Batman fights Superman', 2016, 1, 3, 4.99, 152, 19.99,'Trailers');
       

SELECT * 
FROM film
ORDER BY film_id DESC
LIMIT 3;

-- READ 
-- Select few columns
SELECT title AS movie, description, ROUND(length/60,2) AS duration, rating 
FROM film;

-- Select = Printing
-- Homework: Look around inbuilt mathematical functions 
SELECT "Hello World", ROUND(5/3, 2);

-- DISTINCT Values 
SELECT DISTINCT rating 
FROM film;

SELECT DISTINCT release_year
FROM film;

-- More columns with distinct
SELECT DISTINCT rating, release_year
FROM film;

-- More columns with distinct
SELECT DISTINCT rating, release_year,film_id  AS Id
FROM film;

-- Show films which have got rating 'G'
-- WHERE Clause 

SELECT * 
FROM film 
WHERE rating = 'G';

-- filtering out rows, eliminating duplicates, and then you print 
SELECT DISTINCT rating 
FROM film 
WHERE release_year = 2012;

SELECT * 
FROM film;


SELECT DISTINCT rating
FROM film 
WHERE release_year = 2012;

-- AND, OR, NOT 
SELECT title, length, release_year
FROM film 
WHERE release_year = 2006 AND length > 100;

SELECT title, length, release_year
FROM film 
WHERE release_year = 2006 OR length > 100;


-- NOT 
SELECT title, length, release_year
FROM film 
WHERE release_year != 2006;

-- NOT 
SELECT title, length, release_year
FROM film 
WHERE release_year <> 2006;

-- NOT 
SELECT title, length, release_year
FROM film 
WHERE NOT release_year = 2006;


-- movies where release_year !=2006 and length <= 100
SELECT title, length, release_year
FROM film 
WHERE NOT (release_year = 2006 OR length > 100);

SELECT title, length, release_year
FROM film 
WHERE NOT release_year = 2006 AND NOT length > 100;

-- IN Operator 
-- SELECT movies which have got G, PG, PG-13 rating
SELECT * 
FROM FILM 
WHERE rating='G' OR rating='PG' OR rating='PG-13';

SELECT * 
FROM FILM 
WHERE rating IN ('G','PG','PG-13');

-- More Doubt : Copy data from one table to another ?
CREATE TABLE film_copy(
	title VARCHAR(50),
    description VARCHAR(200)
);

-- film_copy (assume tables exists) 
INSERT INTO film_copy(title,description)
SELECT title,description 
FROM film;

-- Keep Practicing!







    
    
        
			
