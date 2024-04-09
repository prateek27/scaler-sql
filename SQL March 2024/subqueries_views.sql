-- SUBQUERY 
-- Todo: Sakila Database
-- For the film table, find out all the years where 
-- average rental_rate of films of that year was greater
-- than global average rental_rate of all films 


SELECT * 
FROM film;

-- Print average rental of films year-wise 
SELECT release_year,AVG(rental_rate) AS avg_rental_rate
FROM film 
GROUP BY release_year
HAVING avg_rental_rate > (SELECT AVG(rental_rate) 
							FROM film);
                            
                            
-- VIEW : View runs a query on the go, and it is not table. 
-- The output of the query creates a table on the go.
-- Databases allow creations of views, when you open a view it is replaced by query you used to create that view 
CREATE OR REPLACE view actor_film_name AS 
SELECT
   concat(a.first_name, a.last_name) AS actor_name,
   f.title AS file_name
FROM actor a
  JOIN film_actor fa 
    ON fa.actor_id = a.actor_id 
  JOIN film f
    ON f.film_id = fa.film_id;
    
-- you can think of view as table but it is not a table 
SELECT * FROM 
actor_film_name
WHERE file_name LIKE "%saur";




                            
                            




