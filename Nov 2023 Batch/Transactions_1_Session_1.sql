-- commit: save changes permanently to the DB (Disk)
-- ensuring durability 
-- money transfer
SET AUTOCOMMIT = 0;

USE sakila;

SELECT * 
FROM film 
WHERE film_id = 5;

UPDATE film 
SET title = "American Burger"
WHERE film_id = 5;

commit;

UPDATE film 
SET title = "Italian Pizza"
WHERE film_id = 5;

-- UNDO (undo the changes since last commit)
rollback;
