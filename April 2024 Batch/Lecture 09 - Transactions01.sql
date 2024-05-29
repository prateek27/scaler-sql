-- auto-commit is ON by default 
UPDATE film 
SET title = "F1"
WHERE film_id = 1;


SELECT * 
FROM film;

-- turn off  
SET AUTOCOMMIT = 0;

UPDATE film 
SET title = "M1"
WHERE film_id = 1;

UPDATE film 
SET title = "M2"
WHERE film_id = 2;

SELECT * 
FROM film;

commit;


SELECT * 
FROM film;

rollback;

-- LEFT SESSION (T1) 
SHOW variables LIKE "transaction_isolation";

UPDATE film 
SET title = "Americal Egg"
WHERE film_id = 5;

commit;

UPDATE film 
SET title = "Indian Egg"
WHERE film_id = 5;

SELECT * 
FROM film;
commit;

-- new transaction 
SET AUTOCOMMIT = 0;

UPDATE film 
SET title = "F6"
WHERE film_id = 6;


SELECT * 
FROM film 
WHERE film_id = 6;

commit;







