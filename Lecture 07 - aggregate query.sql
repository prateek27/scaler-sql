

-- Count Example 
SELECT COUNT(DISTINCT batch_id) AS UniqueBatches
FROM students;

-- null values are not counted 
SELECT COUNT(batch_id)
FROM students;

-- Count all rows
SELECT COUNT(*) AS StudentCount
FROM students;

-- Other Aggregagte Functions 
-- SUM 
USE sakila;
-- total duration of all movies 
-- you can't select a non-aggregate column here 
SELECT SUM(length)
FROM film;

SELECT SUM(length),MAX(length) AS "Longest Movie", MIN(length) AS "Smallest Movie"
FROM film;

-- DOUBTS
-- Third Highest Record
SELECT title,length 
FROM film 
ORDER BY length DESC
LIMIT 1 OFFSET 2;

-- String Related Functions , Date Time Functions, Maths Functions 
SELECT LENGTH("Hello");

-- Finding sum of title lengths across all films
SELECT SUM(LENGTH(title)) AS "total title length"
 FROM film ;
 
 -- can we select title with max length

 
 -- Subquery (next class)
 SELECT title 
 FROM film
 WHERE LENGTH(title) =  
			(SELECT MAX(LENGTH(title)) 
			FROM film);
            
-- MAX, MIN with String (dictionary order)
SELECT MAX(title), MIN(title)
FROM film;

SELECT MIN(last_update), MAX(last_update)
FROM film;

-- AVG rental rate across movie 
SELECT ROUND(AVG(rental_rate),2)
FROM film;

SELECT AVG(LENGTH(title))
FROM film;

-- Find distinct ratings from film
SELECT DISTINCT rating 
FROM film;

-- Todo: Find total films in each rating category 
SELECT rating,COUNT(film_id) AS "Film Count"
FROM film 
GROUP BY rating;

-- ERROR : 07:53:45	SELECT rating,COUNT(*) AS "Film Count",title FROM film  GROUP BY rating	Error Code: 1055. Expression #3 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'sakila.film.title' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.00084 sec
SELECT rating,COUNT(*) AS "Film Count",title
FROM film 
GROUP BY rating;

-- What colms can be selected?
-- Find out total no of rentals per customer 
SELECT customer_id,first_name,COUNT(rental_id)
FROM rental
JOIN customer 
USING (customer_id)
GROUP BY customer_id;

SELECT COUNT(*),customer_id, CONCAT(first_name," ",last_name)
FROM rental
JOIN customer 
USING (customer_id)
GROUP BY customer_id;

-- HAVING Clause : Customer who have made more than 30 rentals
SELECT COUNT(*) AS cnt,customer_id, CONCAT(first_name," ",last_name)
FROM rental
JOIN customer 
USING (customer_id)
GROUP BY customer_id
HAVING cnt >=30
ORDER BY cnt DESC;

-- Find out all customers with address_id = 8, 
-- and no of rentals per customer and 
-- print customers with >=10 orders
SELECT COUNT(rental_id),c.customer_id, c.first_name
FROM rental r
JOIN customer c
ON c.address_id = 8 AND r.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING COUNT(rental_id) >= 10;

-- ORDERS of Execution : FROM/JOIN => WHERE => GROUP BY => HAVING => ORDER BY => LIMIT 

-- LIVE Class Practice 
-- Query 1: Sakila DB 
-- Find out rating names (film rating) which have got atleast 200 movies
SELECT COUNT(*) AS cnt,rating
FROM film
GROUP BY rating
HAVING cnt >=200;

-- Query 2: Sakila DB
-- Top-5 the customers who have made at least 30 rentals, 
-- for each customers, display their name and count of rentals
SELECT COUNT(rental_id) AS rentals, c.customer_id, first_name
FROM rental 
JOIN customer c
USING (customer_id)
GROUP BY customer_id
HAVING rentals>=30
ORDER BY rentals DESC
LIMIT 5;

-- JOIN --> WHERE --> GROUP BY --> HAVING --> ORDER BY --> LIMIT

-- Query 3: Sakila DB 
-- find the actors who have appeared in atleast two films together 
-- (they share at least two film id)
-- display the actor IDs and no of films they done together.
SELECT  a1.actor_id,a2.actor_id,COUNT(*) AS filmsTogether 
FROM film_actor a1
JOIN film_actor a2 
ON a1.film_id = a2.film_id AND a1.actor_id < a2.actor_id
GROUP BY a1.actor_id,a2.actor_id
HAVING filmsTogether>=2;

-- Challenging Query (HOMEWORK)
-- Query 4: Retrieve the total revenue earned by each film category 
-- but include categories where the total revenue is greater than 1000 USD
-- Show categories and revenue, order the results in desc order by revenue 

-- HINT: Map each payment ==(joins)=> film_category 






































