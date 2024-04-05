
-- count of students 
SELECT COUNT(*) as TotalStudents
FROM students;

-- counts the number of non-null records in that column
SELECT COUNT(first_name) 
FROM students;

-- counts the number of non-null records, here output will be 3 
SELECT COUNT(batch_id) 
FROM students;

-- Count can be used after applying DISTINCT on that column
SELECT COUNT(DISTINCT batch_id)
FROM students;

-- other examples 
-- AVG, SUM, MAX, MIN 
SELECT AVG(rental_rate)
FROM film;

-- average rental rate of all movies which have rating as "PG-13"
SELECT AVG(rental_rate)
FROM film
WHERE rating='PG-13';

-- Find out how many distinct rental rates were there for movies which had rating "PG-13"
SELECT COUNT(DISTINCT rental_rate)
FROM film 
WHERE rating='PG-13';


-- Max across all movies
SELECT MAX(rental_rate)
FROM film;

-- Max across all movies for year 2023
SELECT MIN(rental_rate)
FROM film
WHERE release_year = 2007;

-- GROUP BY Clause 
-- Number of films in film-rating-category 
SELECT rating,COUNT(*),title
FROM film
GROUP BY rating;


-- Total Orders per customer, customer_id, customer_name, number of orders this customer has made
SELECT customer_id,COUNT(*) 
FROM rental
GROUP BY customer_id;

-- Customer Information?
-- GROUP BY --> select you can select aggregate value along with one or more cols given in group clause, or they are function of the given group by column
SELECT customer_id,first_name,email,COUNT(*) AS NoOfRentals
FROM rental
JOIN customer
USING (customer_id)
GROUP BY customer_id;

-- HAVING clause 
-- find out customers who have made atleast 30 rentals
SELECT customer_id,first_name,email,COUNT(*) AS NoOfRentals
FROM rental
JOIN customer
USING (customer_id)
GROUP BY customer_id
HAVING NoOfRentals>=30
ORDER BY NoOfRentals DESC;

-- Todo:  Find out the average rental rate of films 
-- for each type of rating only for movies released in 2007, 2006
-- and COUNT of movies in that set is greater than 200
SELECT rating,AVG(rental_rate) as avg_rental,COUNT(*)
FROM film
WHERE release_year IN (2006,2007)
GROUP BY rating
HAVING COUNT(*)>200 AND COUNT(*)<=300 AND rating LIKE "PG%";


-- LIVE Class Practice 
-- Query 1: Sakila DB 
-- Find out rating names (film rating) which have got atleast 200 movies
SELECT rating,COUNT(*)
FROM film
GROUP BY rating
HAVING COUNT(*)>200;
-- TODO: 10.30 PM 


-- Query 2: Sakila DB
-- Top-5 the customers who have made at least 30 rentals, 
-- for each customers, display their name and count of rentals
SELECT customer_id,first_name,last_name,COUNT(*) as NoOfRentals
FROM rental
JOIN customer 
USING (customer_id)
GROUP BY customer_id
HAVING NoOfRentals >= 30
ORDER BY NoOfRentals DESC 
LIMIT 5;

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


-- Query 4: Retrieve the total revenue earned by each film category 
-- but include categories where the total revenue is greater than 1000 USD
-- Show categories and revenue, order the results in desc order by revenue 

SELECT c.name,SUM(amount) as Revenue
FROM payment
JOIN rental USING (rental_id)
JOIN inventory USING (inventory_id)
JOIN film_category USING (film_id)
JOIN category c USING (category_id) 
GROUP BY category_id
HAVING Revenue > 1000
ORDER BY Revenue DESC;



