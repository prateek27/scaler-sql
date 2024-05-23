SET AUTOCOMMIT = 0;
SHOW variables LIKE "transaction_isolation";

UPDATE film 
SET title = "Goa Airplane"
WHERE film_id = 7;

SELECT * 
FROM film
WHERE film_id = 7;

commit;


-- Repeatable Read Demo (Left)
SELECT *
FROM film
WHERE film_id = 9;

UPDATE film 
SET title = "Airport India"
WHERE film_id = 9;

commit;

SET SESSION TRANSACTION ISOLATION LEVEL serializable;
START TRANSACTION;
SELECT * FROM film 
WHERE film_id IN (12,13) FOR UPDATE;
commit;

START TRANSACTION;
SELECT * FROM film 
WHERE film_id=12 FOR UPDATE;
SELECT * FROM film 
WHERE film_id=13 FOR UPDATE;
commit;

-- Deadlock  T1               T2               
-- Select 12  (locked)      -- Select 13 (release)
-- Select 13	(locked)	-- Select 12 

-- one of the transaction will fail

-- 08:42:02	SELECT * FROM film  WHERE film_id=13 FOR UPDATE	Error Code: 1213. Deadlock found when trying to get lock; try restarting transaction	0.0052 sec
