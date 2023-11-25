INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, special_features) 
VALUES ('Tiger3', 'Batman fights the Joker', 2008, 1, 3, 4.99, 152, 19.99,  'Trailers'),
       ('RRR', 'Batman fights Bane', 2012, 1, 3, 4.99, 165, 19.99, 'Trailers'),
       ('DDLJ', 'Batman fights Superman', 2016, 1, 3, 4.99, 152, 19.99,'Trailers');

-- show all films
SELECT * 
FROM film;

-- show few colms
SELECT title AS filmName, rental_rate AS price, length
FROM film;

-- show few colms
SELECT title AS filmName, rental_rate AS price, ROUND(length/60,2) AS Duration
FROM film;

-- Todo: Google for Mathematical Fns in MySQL!!!

-- Another usecase
SELECT "Hello",5;
SELECT ROUND(20.346,2);

-- Distinct Values
SELECT DISTINCT rating
FROM film;

-- Distinct pairs will be selected
SELECT DISTINCT rating,release_year
FROM film;

-- Filter out rows based upon certain criteria
-- Select all movies which have got 'G' rating
SELECT * 
FROM film
WHERE rating='G';

-- Select movies with length > 100 mins 
SELECT DISTINCT title,length
FROM film
WHERE length > 100;

-- AND,OR, NOT
SELECT DISTINCT title,length
FROM film
WHERE length > 100 AND rating='G';

-- OR 
SELECT DISTINCT title,length
FROM film
WHERE length > 100 OR rating='G';

-- NOT
SELECT DISTINCT title,length
FROM film
WHERE NOT(length > 100 AND rating='G');

SELECT DISTINCT title,rating
FROM film
WHERE NOT RATING='G';

-- this != also works
SELECT DISTINCT title,rating
FROM film
WHERE RATING!='G' AND RATING!='PG';

SELECT DISTINCT title,rating
FROM film
WHERE NOT (RATING='G' OR RATING='PG');

SELECT DISTINCT title,rating
FROM film
WHERE NOT RATING='G' AND NOT RATING='PG';

SELECT DISTINCT title,rating
FROM film
WHERE rating NOT IN('G','PG');

-- IN (Select Movies release in 2006,2008,2010
SELECT *
FROM film 
WHERE release_year IN (2006,2008,2010);

-- NOT IN
SELECT DISTINCT title,rating
FROM film
WHERE rating NOT IN('G','PG');


