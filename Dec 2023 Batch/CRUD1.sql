CREATE DATABASE scalerDB;
USE scalerDB;

-- Create a Batches Table
CREATE TABLE batches(
	batch_id INT PRIMARY KEY AUTO_INCREMENT,
    batch_name VARCHAR(50) NOT NULL
);

-- Good Practice: Always specify the columns names
INSERT INTO batches(batch_id,batch_name) VALUES
(1,"Batch A"),
(2,"Batch B"),
(3,"Batch C");

CREATE TABLE students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    batch_id INT,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO students(first_name,last_name,batch_id) VALUES
("Ayushee","Shaw",1),
("Dilli","K",1),
("Rohan","Shaw",1),
("Rahul","Kumar",2),
("Naman","Kumar",3);

-- Specifying column names is Optional if you give data for all columns in the same sequence
INSERT INTO batches VALUES
(4,"Batch A"),
(5,"Batch B"),
(6,"Batch C");

DELETE FROM batches
WHERE batch_id = 2;

-- PART-II Queries
-- Sakila DB
-- Official MySQL DB 
-- Lot of tables : Dummy DB of online DVD rental store
USE sakila;

-- SELECT statement 
SELECT title,release_year AS LaunchYr, ROUND(length/60,2) AS Duration
FROM film;





-- we are not doing any query, we are just printing
SELECT "Hello" AS Greeting,56/60 AS Number;
SELECT ROUND(56/60,2);

-- SELECT DISTINCT VALUES
SELECT DISTINCT rating 
FROM film;

SELECT DISTINCT release_year
FROM film;

SELECT DISTINCT release_year,rating
FROM film;

-- WHERE Clause
SELECT title,description,release_year
FROM film 
WHERE release_year = 2023;

SELECT title,description,release_year
FROM film 
WHERE length > 100;

-- AND 
SELECT title,description,release_year
FROM film 
WHERE length > 100 AND rating='G';

SELECT title,description,release_year
FROM film 
WHERE length > 100 OR rating='G';

SELECT title,description,release_year
FROM film 
WHERE length > 100 OR NOT rating='G';

SELECT title,description,release_year
FROM film 
WHERE length > 100 OR rating!='G';

SELECT title,description,release_year
FROM film 
WHERE length > 100 OR rating<>'G';

-- NOT, != , <> all of them are not 
-- use () whereever needed
SELECT title,description,release_year
FROM film 
WHERE NOT (length > 100 OR rating='G');

SELECT title,description,release_year
FROM film 
WHERE length <= 100 AND rating!='G';

SELECT title,description,release_year
FROM film 
WHERE NOT length > 100 AND rating!='G';

-- SELECT all countries (1,4,8,9) 
SELECT * 
FROM country
WHERE country_id=1 OR country_id=4 OR country_id=8 OR country_id=9;

SELECT * 
FROM country
WHERE country_id IN (1,4,8,9) 
or country IN ("India","Pakistan");

