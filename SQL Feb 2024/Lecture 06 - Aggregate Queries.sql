
USE sakila;

-- TODO
-- 1. Find out the average rental rate of films
-- 2. Find out the average rental rate of films which have rating  'PG-13'
-- 3. Find out the average rental rate of films for each type of rating 

SELECT AVG(rental_rate)
FROM film;

-- First filter out films, then aggregate 
-- Order of Execution : WHERE -> AVG -> SELECT 
SELECT AVG(rental_rate)
FROM film 
WHERE rating='PG-13';

SELECT COUNT(DISTINCT rental_rate, release_year)
FROM film 
WHERE rating='PG-13';

SELECT COUNT(rental_rate), COUNT(release_year)
FROM film 
WHERE rating='PG-13';

-- COUNT(*) will always counts the number of rows
create table boys (name varchar(10),age int); 
insert into boys values(null,null),(null,null);
select * from boys;

-- actually count all the rows in the table
select count(*) from boys;

-- COUNT Distinct Values?
USE scalerDB;

SELECT COUNT(*) 
FROM batches;

-- count only counts non-null values in the given column
SELECT COUNT(batch_name)
FROM batches;

-- count by default doesn't remove duplicate values
SELECT COUNT(batch_name) 
FROM batches;

-- put all values in batch_name inside a set, and then count
SELECT COUNT(DISTINCT batch_name) AS "Unique Batch Names"
FROM batches;

SELECT MAX(rental_rate), MIN(rental_rate), AVG(rental_rate), SUM(rental_rate)
FROM film;

-- 3. Find out the average rental rate of films for each type of rating 
SELECT DISTINCT rating 
FROM film;

SELECT COUNT(*), AVG(rental_rate), rating
FROM film 
GROUP BY rating;

-- 3. Find out the average rental rate of films 
-- for each type of rating only for movies released in 2006
-- Order : WHERE (filter out rows) --> Grouping (Creating Sets) --> Aggregation (for each set)
SELECT COUNT(*), AVG(rental_rate), rating
FROM film 
WHERE release_year=2006
GROUP BY rating;

-- 3. Find out the average rental rate of films 
-- for each type of rating only for movies released in 2006
-- and COUNT of movies in that set is greater than 200
SELECT COUNT(*), AVG(rental_rate), rating
FROM film 
WHERE release_year=2006
GROUP BY rating
HAVING COUNT(*) > 200;


-- TODO: Practice Queries 
-- Query 1: Sakila DB 
-- Find out rating names  which have got atleast 200 movies
SELECT rating,COUNT(*) AS cnt
FROM film 
GROUP BY(rating)
HAVING cnt>=200;


-- Query 2: Sakila DB
-- top 5 customers with atleast 30 rentals
-- list the customers who have made at least 30 rentals, 
-- for each customers, display their name and count of rentals
SELECT COUNT(*) AS rentals,customer_id, first_name
FROM rental 
JOIN customer 
USING (customer_id)
GROUP BY customer_id 
HAVING rentals>=30 
ORDER BY rentals DESC
LIMIT 5;

-- Query 3: Sakila DB 
-- find the actors who have appeared in atleast 
-- two films together 
-- (they share at least two film id)
-- display the actor IDs and no of films they done together.
SELECT COUNT(*) AS filmCnt,A1.actor_id,A2.actor_id
FROM film_actor A1
JOIN film_actor A2
ON A1.film_id = A2.film_id AND A1.actor_id < A2.actor_id
GROUP BY A1.actor_id,A2.actor_id
HAVING filmCnt>=2 
ORDER BY filmCnt
LIMIT 5;

-- HW Query: Retrieve the total revenue earned by each film category 
-- but include categories where the total revenue is greater than 1000 USD
-- Show categories and revenue, order the results in desc order by revenue 

SELECT *
FROM category;





-- 20 mins (10.40 PM) PRACTICE (5 mins break + 15 mins for query)







