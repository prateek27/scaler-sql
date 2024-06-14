-- '-> Filter: (students.first_name = \'Akshit\')  (cost=0.65 rows=1) (actual time=0.0601..0.0649 rows=1 loops=1)\n    -> Table scan on students  (cost=0.65 rows=4) (actual time=0.05..0.0559 rows=4 loops=1)\n'

EXPLAIN ANALYZE
SELECT * 
FROm students
where first_name = "Akshit";

-- Create an index only once
CREATE INDEX idx_student_name 
ON students(first_name);

DROP INDEX idx_student_name
ON students;

-- '-> Index lookup on students using idx_student_name (first_name=\'Akshit\')  (cost=0.35 rows=1) (actual time=0.0422..0.0445 rows=1 loops=1)\n'
EXPLAIN ANALYZE
SELECT * 
FROm students
where first_name = "Akshit";

EXPLAIN ANALYZE
SELECT * 
FROm students
where first_name = "Vikas";

-- Composite Index 
CREATE INDEX idx_rating_title
ON film(rating,title);

SELECT *
FROM film
WHERE rating="G" AND title="Academy Dinasaur";


-- Indexing on Strings
SELECT * 
FROM sakila.film;

-- Trying out the ideal prefix length?
-- on avg how many records per node: 2 with prefix of length 1 
SELECT COUNT(DISTINCT SUBSTR(title,1,1))
FROM sakila.film;


-- on avg how many records per node: 2 with prefix of length 3 
SELECT COUNT(DISTINCT SUBSTR(title,1,3))
FROM sakila.film;

-- on avg how many records per node: 2 with prefix of length 6 
SELECT COUNT(DISTINCT SUBSTR(title,1,6))
FROM sakila.film;

-- on avg how many records per node: 2 with prefix of length 10 
SELECT COUNT(DISTINCT SUBSTR(title,1,10))
FROM sakila.film;

-- Create an Prefix Index 
CREATE INDEX idx_film_title ON sakila.film(title(3));

-- 
EXPLAIN ANALYZE
SELECT * 
FROM sakila.film
WHERE title="Academy Dinosaur";

-- Pattern Matching 
-- Search within the the title 

-- FullText Index!
-- removes the stopwords from the blog (hardcoded list) 
-- creates an index using keywords from the blog, title etc. 
-- searches using the keywords in your query 

-- youtube will create a full text index on the title + description
CREATE FULLTEXT INDEX idx_film_title_description ON film (title, description);

SELECT * 
FROM film
WHERE MATCH(title,description) AGAINST("Database Linux Robot");








