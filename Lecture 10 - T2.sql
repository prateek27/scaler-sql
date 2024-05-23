SET AUTOCOMMIT = 0;
SET SESSION TRANSACTION ISOLATION LEVEL repeatable read;
SHOW variables LIKE "transaction_isolation";

SELECT * 
FROM film
WHERE film_id = 7;

UPDATE film 
SET title = "Kerala Airplane"
WHERE film_id = 7;

commit;

-- Repeatable Read Demo
SET SESSION TRANSACTION ISOLATION LEVEL repeatable read;

SELECT * 
FROM film
WHERE film_id = 9;

SELECT * 
FROM film
WHERE film_id = 9; -- old value even after the commit happened

commit;

SELECT * 
FROM film
WHERE film_id = 9; -- new values in a new transaction

-- Serializable in Demo 
SET SESSION TRANSACTION ISOLATION LEVEL serializable;
START TRANSACTION;
SELECT * FROM film 
WHERE film_id IN (13,14) FOR UPDATE;
commit;

START TRANSACTION;
SELECT * FROM film 
WHERE film_id=13 FOR UPDATE;
SELECT * FROM film 
WHERE film_id=12 FOR UPDATE;
commit;

