USE sakila;

SET SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SHOW variables LIKE "transaction_isolation";

-- Session is now able to read uncommitted value from session 1
SELECT * 
FROM film 
WHERE film_id = 5;

