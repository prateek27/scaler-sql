USE sakila;

-- total no of rows table
SELECT COUNT(*)
FROM film;

SELECT COUNT(title)
FROM film;

-- total no of non-null values in that column
SELECT COUNT(description)
FROM film;

-- Highest Rental Duration 
SELECT MAX(rental_duration)
FROM film;

-- Lowest Rental Duration 
SELECT MIN(rental_duration)
FROM film;

-- MAX, MIN can work on Strings, Int, Dates, any datatypes that can compared!
SELECT MAX(title),MIN(title)
FROM film;

-- SUM
SELECT SUM(rental_rate) AS "Total Rental Rate"
FROM film;

-- AVG
SELECT AVG(rental_rate) AS "Avg Rental Rate"
FROM film;

-- Sum is working with dates, strings but the results are not meaningful!

-- GROUP BY 
USE scalerDB;

SELECT *
FROM students;

-- we can select only the columns which are present in group by clause
-- because those cols will have same value across all the rows in the group
SELECT COUNT(*) AS "No of Students",batch_id
FROM students
GROUP BY batch_id;

-- Count Distinct Batches? Output: 5
SELECT COUNT(batch_id)
FROM students;

-- Count Distinct Batches? Output: 2
SELECT COUNT(DISTINCT batch_id) AS "Unique Batches"
FROM students;

-- Query: Show No of Films for every type of rating 
USE sakila;
SELECT COUNT(film_id),rating 
FROM film
GROUP BY rating;

-- HAVING Clause (filter out batches with more than 2 students)
SELECT COUNT(*) as StudentCount,batch_id,batch_name
FROM students
JOIN batches 
USING (batch_id)
GROUP BY batch_id 
HAVING StudentCount >2;
-- You can select columns which are there in Group By clause, 
-- or any other columns which are functionally dependent 
-- on the columns in the group by clause

-- Query: Filter out students whose some contains A and then form batches.
SELECT COUNT(*),batch_id,batch_name
FROM students
JOIN batches 
USING (batch_id)
WHERE first_name LIKE "%a%"
GROUP BY batch_id;

-- Query 1: Sakila DB 
-- Find out rating names (film rating) which have got atleast 200 movies
USE sakila;

SELECT rating,COUNT(*) AS cnt
FROM film 
GROUP BY rating
HAVING cnt>=200;

-- Query 2: Sakila DB
-- list the customers who have made at least 30 rentals, 
-- for each customers, display their name and count of rentals
SELECT count(*) as RentalCount, customer_id, c.first_name,c.last_name
FROM customer c  
JOIN rental r 
USING (customer_id)
GROUP BY customer_id 
HAVING RentalCount >=30;

-- Less Preferred as you are doing a cross join first, and then filtering 
SELECT count(*) as RentalCount, c.customer_id, c.first_name,c.last_name
FROM customer c, rental r
WHERE c.customer_id = r.customer_id
GROUP BY customer_id 
HAVING RentalCount >=30;

-- Query 3: Sakila DB 
-- find the actors who have appeared in atleast two films together 
-- (they share at least two film id)
-- display the actor IDs and no of films they done together.
SELECT COUNT(*) AS moviesDoneTogether, a1.actor_id, a2.actor_id 
FROM film_actor a1 
JOIN film_actor a2 
ON a1.film_id = a2.film_id AND a1.actor_id < a2.actor_id 
GROUP BY a1.actor_id,a2.actor_id 
HAVING moviesDoneTogether>=2;

-- Query 4: Retrieve the total revenue earned by each film category 
-- but include categories where the total revenue is greater than 1000 USD
-- Show categories and revenue, order the results in desc order by revenue 

SELECT category.name,SUM(amount) as CatRevenue,category_id
FROM film_category 
JOIN category 
using (category_id) 
JOIN inventory 
USING (film_id) 
JOIN rental 
USING (inventory_id) 
JOIN payment 
USING (rental_id) 
GROUP BY category_id 
HAVING CatRevenue >1000
ORDER BY CatRevenue DESC;
















