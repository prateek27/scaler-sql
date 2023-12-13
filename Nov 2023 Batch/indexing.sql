USE sakila;


DROP INDEX idx_release_year ON film;
DROP INDEX idx_ftitle ON film;
DROP INDEX idx_title ON film;
DROP INDEX idx_film_title ON film;
-- Run QUery (0.0025s) without indexing 
EXPLAIN ANALYZE SELECT * FROM film 
WHERE release_year=2023;
-- '-> Filter: (film.release_year = 2023)  (cost=103 rows=100) (actual time=0.11..2.28 rows=5 loops=1)\n    -> Table scan on film  (cost=103 rows=1000) (actual time=0.103..2.05 rows=1002 loops=1)\n'


-- Create an Index based upon release year 
CREATE INDEX idx_release_year 
ON film(release_year);

CREATE INDEX idx_release_year_title 
ON film(release_year,title);

-- Run QUery (0.00074s) after indexing 
EXPLAIN ANALYZE SELECT * FROM film 
WHERE release_year=2023;
-- '-> Index lookup on film using idx_release_year (release_year=2023)  (cost=1.75 rows=5) (actual time=0.0885..0.129 rows=5 loops=1)\n'


-- Title 
CREATE INDEX idx_film_title 
ON film(title(2));

EXPLAIN ANALYZE SELECT * FROM film 
WHERE title="'AFRICAN EGG'";






