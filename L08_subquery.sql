-- Query 4: Retrieve the total revenue earned by each film category 
-- but include categories where the total revenue is greater than 1000 USD
-- Show categories and revenue, order the results in desc order by revenue 

SELECT SUM(amount) AS revenue,category_id,category.name
FROM payment 
JOIN rental USING (rental_id)
JOIN inventory USING (inventory_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
GROUP BY category_id
ORDER BY revenue DESC
LIMIT 3;

-- Subquery 
-- Consider the film table, find out all years where avg rental_rate of the films of that year 
-- was greater than global average rental_rate (of all films)
SELECT release_year, AVG(rental_rate) AS avgRent
FROM film 
GROUP BY release_year
HAVING avgRent > 
		(SELECT AVG(rental_rate)
		FROM film);

-- Create a View (Looks like a table, but it is not a table, result of query)
CREATE VIEW actor_film_name AS 
SELECT first_name,title
FROM film_actor 
JOIN actor USING (actor_id)
JOIN film USING (film_id);



-- Query on the top of view 
-- Query view like a table (view is not a table) 
-- Simplied query 
SELECT * 
FROM actor_film_name WHERE first_name = "Nick";

-- VIEWS is not the copy of the data, it is just a table created on the fly when you use a view 

-- Drop View 
DROP VIEW actor_film_name;








