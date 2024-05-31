
-- Database for Scaler 
CREATE DATABASE scalerDB;

-- Currently used database 
USE scalerDB;

-- Create Tables
-- Homework: Look at different datatypes that are supported!
CREATE TABLE batches(
	batch_id INT,
    batch_name VARCHAR(50),
    PRIMARY KEY(batch_id)
);

CREATE TABLE students(
	student_id INT AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    batch_id INT,
    PRIMARY KEY(student_id),
    FOREIGN KEY(batch_id) REFERENCES batches(batch_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Insert some data into batches 
INSERT INTO batches(batch_id,batch_name) VALUES 
(1,"ML"),
(2,"SQL"),
(3,"DSA");


-- if you have given values for all columns, chances of mistakes 
-- syntax will not work if you have default values, or auto-increment cols
-- you can only use this syntax if you are specifying all the columns in the correct order 
INSERT INTO batches VALUES 
(4,"Database");


-- Insert some data into students 
-- you can some columms as AUTO INCREMENT, some columns can have default values (HW)
INSERT INTO students(first_name,last_name,batch_id) VALUES 
("Vishal","X",11),
("Sundar","Y",3),
("Akshit","Z",3),
("Naveen","W",11);

-- Error Column Count Doesn't match
INSERT INTO students VALUES 
("Vishal","X",11),
("Sundar","Y",3),
("Akshit","Z",3),
("Naveen","W",11);


SELECT * 
FROM students;

SELECT * 
FROM batches;

-- READING Data
-- Sakila Database: online dvd rental store database
-- information films, actors, film rentals, customers, ...
USE sakila;


SELECT * 
FROM film;

SELECT film_id, title AS FilmTitle, ROUND(length/60,2) AS Duration, rating 
FROM film;

-- Selects acts like a print statement 
SELECT "HELLO", ROUND(4/3,2);

-- SELECT unique ratings 
SELECT DISTINCT rating
FROM film;

SELECT DISTINCT rating, release_year
FROM film;

SELECT COUNT(DISTINCT rating, release_year)
FROM film;

-- 15 min Break 
-- Write a query two insert two dummy rows inside the "payment table"
-- Insert "Hindi" as language in the language table 
INSERT INTO language(name) VALUES
("Hindi");

SELECT * 
FROM language;

INSERT INTO payment
(customer_id,
staff_id,
amount,
payment_date)
VALUES
(123,
2,
500,
"2024-05-31");

SELECT * 
FROM payment;

-- Copy the data from some table and create another table 
CREATE TABLE film_copy(
	title VARCHAR(50),
    description VARCHAR(255)
);

INSERT INTO film_copy(title,description)
SELECT title,description 
FROM sakila.film;

-- copying from another database 
INSERT INTO film_copy(title,description)
SELECT batch_id,batch_name
FROM scalerDB.batches;


SELECT * 
FROM film_copy;

-- WHERE Clause
-- filter out rows based upon a certain condition 
-- Select films release in 2008 
SELECT * 
FROM film
WHERE release_year=2008;

-- Select films release in 2008 OR rating is G
SELECT * 
FROM film
WHERE release_year=2008 OR rating='G';

-- AND (all conditions must be fulfilled)
SELECT * 
FROM film
WHERE release_year=2008 AND rating='G';

-- NOT 
SELECT * 
FROM film
WHERE release_year=2008 AND rating!='G';

SELECT * 
FROM film
WHERE release_year=2008 AND NOT rating='G';

SELECT * 
FROM film
WHERE release_year=2008 AND  rating<>'G';


SELECT * 
FROM film
WHERE release_year!=2008 AND rating!='G';

SELECT * 
FROM film
WHERE NOT (release_year=2008 OR rating='G');

SELECT * 
FROM film
WHERE NOT release_year=2008 OR rating='G';

-- IN Operator 
-- Movies with G, PG, NC-17
SELECT title,rating
FROM film 
WHERE rating='G' OR rating ='PG' OR rating='NC-17';

SELECT title,rating
FROM film 
WHERE rating IN ('G','PG','NC-17');

-- DOUBTS 
-- Anand: on DELETE SET DEFAULT is not working in mysql .
CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL 
);

CREATE TABLE orders(
	orderId INT PRIMARY KEY,
    order_number VARCHAR(100),
    customer_id INT DEFAULT 0, -- default value of customer id 
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL
);

-- Got this from a doc:
-- As of MySQL 8.0, the ON DELETE SET DEFAULT option is not supported for foreign keys. Alternative Approach
-- To achieve similar behavior as ON DELETE SET DEFAULT, you can use triggers to set the default value manually when a row in the parent table is deleted.

UPDATE orders
SET customer_id = 0 
WHERE customer_id = NULL;













