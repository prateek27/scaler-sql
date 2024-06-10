-- Inner vs Outer Join

-- Left Outer Join 
USE scalerDB;

-- include all students 
SELECT * 
FROM students s
LEFT JOIN batches b 
ON s.batch_id = b.batch_id; 

-- Right outer Join 
-- includes all the batches irrespective of the match or not
SELECT * 
FROM students s 
RIGHT JOIN batches b 
ON s.batch_id = b.batch_id;

-- Full Outer Join -  Combination of Left and Right Matching rows + leftout rows 

-- CROSS JOin
SELECT * 
FROM students s
JOIN batches b; 


-- USING 
SELECT * 
FROM students s
JOIN batches b 
ON s.batch_id = b.batch_id;


SELECT student_id, batch_id 
FROM students 
JOIN batches  
USING (batch_id);

SELECT student_id, batch_id 
FROM students 
LEFT JOIN batches  
USING (batch_id);

SELECT student_id, batch_id 
FROM students 
RIGHT JOIN batches  
USING (batch_id);

-- Natural JOIN
SELECT * 
FROM students s
JOIN batches b
ON s.batch_id = b.batch_id;

-- less powerful (only for equality based upon cols with same name)
SELECT * 
FROM students 
NATURAL JOIN batches;

-- Implicit Join (same as cross join, just another syntax)
SELECT * 
FROM students, batches;

SELECT * 
FROM students, batches;


-- UNION
SELECT firstName,email AS "Contact Info"
FROM employees
UNION
SELECT customerName,phone
FROM customers
UNION
SELECT first_name,last_name
FROM scalerDB.students;









