USE scalerDB;
-- count of batch_id excluding null values
SELECT COUNT(batch_id) 
FROM students;

SELECT COUNT(DISTINCT batch_id) 
FROM students;

-- each row is treated as one object for counting 
-- you will all the rows of the table
SELECT COUNT(*) 
FROM students;

-- count with where 
-- no of students who belong to batch 1 
SELECT COUNT(*) 
FROM students
WHERE batch_id = 1;

-- SUM() 
USE sakila;
-- total duration of all movies 
SELECT SUM(length) AS "total duration"
FROM film;

-- AVG()
SELECT AVG(length) AS "avg movie duration"
FROM film;

-- MAX()
SELECT MAX(length), MIN(length)
FROM film;

-- Film with Third highest length!
-- 3rd record from the sorted list 
SELECT title,length
FROM film 
ORDER BY length DESC
LIMIT 1 OFFSET 2;

-- Find out the movies with third highest length
-- Part 1 : find out third highest length 
-- Part 2 : find out movies which have this length
-- find out the distinct lengths 
SELECT title,description,length 
FROM film 
WHERE length = (SELECT DISTINCT length 
FROM film
ORDER BY length DESC
LIMIT 1 OFFSET 2);

-- MIN, MAX with other datatypes as well (strings, datetime) 
-- you will largest and smallest strings from title list (as per dictionary order)
SELECT MAX(title)
FROM film;

SELECT MIN(title)
FROM film;

-- you can't select a non-aggreated columns
-- this query doesnt make sense!
SELECT title, SUM(length)
FROM film;
-- 07:42:53	SELECT title, SUM(length) FROM film	Error Code: 1140. In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'sakila.film.title'; this is incompatible with sql_mode=only_full_group_by	0.00049 sec


-- GROUP BY Clause 
-- find out no of films in each rating category 
SELECT COUNT(*),rating
FROM film
GROUP BY rating;

-- ERROR: title is not a function of rating, non-aggregated colmn
SELECT COUNT(*),rating,title
FROM film
GROUP BY rating;

-- Total No of Rentals per customer 
SELECT COUNT(*),customer_id
FROM rental
GROUP BY customer_id;

-- Total No of Rentals per customer 
SELECT COUNT(*) as totalRentals,customer_id,CONCAT(first_name," ",last_name)
FROM rental
JOIN customer
USING (customer_id)
GROUP BY customer_id
ORDER BY totalRentals; 

-- WHERE clause - filter out rows before aggregation!
-- HAVING Clause - filter out groups after aggregation!

-- Find out customers who have made atleast 30 rentals
-- After group by you can use having to filter the groups. based upon condition
SELECT COUNT(*) as totalRentals,customer_id,CONCAT(first_name," ",last_name)
FROM rental
JOIN customer
USING (customer_id)
GROUP BY customer_id
HAVING totalRentals>=30
ORDER BY totalRentals DESC
LIMIT 3;

-- Live Class Practice:
-- Sakila Database: Find out film ratings (film) which have got atleast 200 movies
-- 2 mins 
SELECT COUNT(*) AS cnt, rating
FROM film
GROUP BY rating
HAVING cnt>=200;

SELECT * 
FROM film;

-- Live class practice 2: Sakila DB 
-- find the actors who have appeared in atleast two films together 
-- (they share at least two film id)
-- display the actor IDs and no of films they done together.

-- Hint: Self-Join in Film Actor Table
SELECT * 
FROM film_actor;

-- time to try till 8.53
-- step 1 join the pairs of actors who share the same film
SELECT a1.actor_id,a2.actor_id,COUNT(a1.film_id) AS filmsTogether
FROM film_actor a1 
JOIN film_actor a2
ON a1.film_id = a2.film_id AND a1.actor_id < a2.actor_id
GROUP BY a1.actor_id,a2.actor_id
HAVING filmsTogether>=2;

-- HOMEWORK
-- Query: Retrieve the total revenue earned by each film category 
-- but include categories where the total revenue is greater than 1000 USD
-- Show categories and revenue, order the results in desc order by revenue 

-- HINT: Map each payment ==(joins)=> film_category 

Display the details of those employees who have a manager working in the department that is US (i.e., country_id) based. Note: Return the columns employee_id, first_name, and last_name.
Return the result ordered by employee_id in ascending order.


-- rani's first query 
select e1.employee_id, e1.first_name, e1.last_name
from employees as e1
join employees as e2
ON e1.manager_id = e2.employee_id
join departments as d
ON e2.department_id = d.department_id
join locations as l
ON d.location_id = l.location_id AND l.country_id = 'US'
order by employee_id

-- rani's second query (location -> dept -->
select e.employee_id, e.first_name, e.last_name
from employees as e
join departments as d
ON e.______ = d.manager_id
join locations as l
ON d.location_id = l.location_id AND l.country_id = 'US'
order by employee_id





Department : DeptId, Deptname, ManagerId, LocationId







































