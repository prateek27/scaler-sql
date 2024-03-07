
EXPLAIN ANALYZE
SELECT * 
FROM film 
WHERE title="Scaler";

EXPLAIN ANALYZE
SELECT * 
FROM film 
WHERE title="Scaler" AND rating='G';
-- '-> Filter: (film.rating = \'G\')  (cost=0.27 rows=0.2) (actual time=0.0839..0.0839 rows=0 loops=1)\n    -> Index lookup on film using idx_film_title_release_year (title=\'Scaler\')  (cost=0.27 rows=1) (actual time=0.0709..0.079 rows=1 loops=1)\n'


CREATE INDEX idx_title 
ON film(title);

CREATE INDEX idx_film_title_release_year 
ON film(title,release_year);

DROP INDEX idx_title ON film;





