
-- 4 X 4 = 16 rows
-- every student in is every batch (CROSS JOIN)
SELECT * 
FROM students 
JOIN batches
ON students.batch_id = batches.batch_id;

-- give an alias
SELECT first_name,batch_name, s.batch_id
FROM students s
JOIN batches b
ON s.batch_id = b.batch_id;

-- order of joining tables doesn't matter
SELECT s.first_name, b.batch_name 
FROM batches b
JOIN students s
ON b.batch_id = s.batch_id;

-- show details (student and batch) "for student_id = 8" only 

-- Approach: 1 JOIN (all cols) --> Filtering --> Printing only the selected columns 
SELECT s.first_name, b.batch_name 
FROM batches b
JOIN students s
ON b.batch_id = s.batch_id
WHERE student_id = 8;

-- Approach 2: Joined the table only for selected student 
SELECT s.first_name, b.batch_name 
FROM batches b
JOIN students s
ON s.student_id = 8 AND b.batch_id = s.batch_id;

-- Todo: Print all students(all colms of student) who belong "ML" batch 
SELECT s.* , batch_name
FROM students s
JOIN batches b
ON b.batch_name BETWEEN "Hat" AND "Orange" AND s.batch_id = b.batch_id;


-- PRACTICE PROBLEMS on Sakila Database

-- doubt 
SELECT CONCAT(first_name," ",last_name) AS "Full Name"
FROM students;

-- Show Every Actor Name along with the film name they have done sorted by actor name
    SELECT CONCAT(first_name," ",last_name) AS  actorName , title 
    FROM film_actor fa
    JOIN actor a
    ON fa.actor_id = a.actor_id
    JOIN film f
    ON fa.film_id = f.film_id 
    ORDER BY actorName;

-- Todo (Optional) : Sakila Database (Film Table)
-- For every film name all the films that were release 
-- in the range +- 2 years from the current film, 
-- and there rental rate was more than the rental rate of current film 

SELECT f1.title,f1.release_year,f1.rental_rate,f2.title,f2.release_year,f2.rental_rate 
FROM film f1 
JOIN film f2
ON f2.release_year BETWEEN f1.release_year - 2 AND f1.release_year + 2 
AND f2.rental_rate > f1.rental_rate;

-- To show foreign keys 
SHOW CREATE TABLE film; 
-- shows how the table was created (look at the fks and constraints)


'film', 'CREATE TABLE `film` (\n  `film_id` smallint unsigned NOT NULL AUTO_INCREMENT,\n  `title` varchar(128) NOT NULL,\n  `description` text,\n  `release_year` year DEFAULT NULL,\n  `language_id` tinyint unsigned NOT NULL,\n  `original_language_id` tinyint unsigned DEFAULT NULL,\n  `rental_duration` tinyint unsigned NOT NULL DEFAULT \'3\',\n  `rental_rate` decimal(4,2) NOT NULL DEFAULT \'4.99\',\n  `length` smallint unsigned DEFAULT NULL,\n  `replacement_cost` decimal(5,2) NOT NULL DEFAULT \'19.99\',\n  `rating` enum(\'G\',\'PG\',\'PG-13\',\'R\',\'NC-17\') DEFAULT \'G\',\n  `special_features` set(\'Trailers\',\'Commentaries\',\'Deleted Scenes\',\'Behind the Scenes\') DEFAULT NULL,\n  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,\n  PRIMARY KEY (`film_id`),\n  KEY `idx_title` (`title`),\n  KEY `idx_fk_language_id` (`language_id`),\n  KEY `idx_fk_original_language_id` (`original_language_id`),\n  CONSTRAINT `fk_film_language` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE,\n  CONSTRAINT `fk_film_language_original` FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE\n) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'



-- 
USE classicmodels;

-- show every employee and its manager 
SELECT emp.employeeNumber, emp.lastName AS "Employee", mgr.lastName AS "Manager"
FROM employees emp 
JOIN employees mgr 
ON emp.employeeNumber = mgr.employeeNumber
ORDER BY employeeNumber;


