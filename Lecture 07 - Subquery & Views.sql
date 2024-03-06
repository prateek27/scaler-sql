
-- SUBQUERIES
-- Todo: Sakila Database
-- For the film table, find out all the years where 
-- average rental_rate of films of that year was greater
-- than average rental_rate of all films 

USE sakila;
-- Put subquery inside ()
SELECT release_year
FROM film 
GROUP BY release_year 
HAVING AVG(rental_rate) >= (SELECT AVG(rental_rate) FROM film);


-- Create a view where actor name,
CREATE OR REPLACE VIEW actor_movie_view AS
SELECT CONCAT(first_name," ",last_name),title
FROM actor
JOIN film_actor
USING (actor_id)
JOIN film 
USING (film_id);

-- Query from the view 
SELECT * FROM actor_movie_view
WHERE title="Scaler";

-- View appears like a table but it is not a table 
-- It runs the query on the go, hence you are not storing redundant data

DROP VIEW actor_movie_view;



