-- write code here 
-- SQL is case Insensitive
-- Homework: Study about different data-types in MySQL! 

-- Create a Database
CREATE DATABASE scalerDB;

-- Specify DB you will be using
USE scalerDB;

-- Create Tables
CREATE TABLE batches(
	batch_id INT,
    batch_name VARCHAR(50),
    -- specify keys here 
    PRIMARY KEY(batch_id)
);

CREATE TABLE students(
	student_id INT AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    batch_id INT,
    -- specify keys and fk constraints 
    PRIMARY KEY(student_id),
    FOREIGN KEY(batch_id) REFERENCES batches(batch_id) ON DELETE RESTRICT ON UPDATE CASCADE
);



-- Add data in those tables 
INSERT INTO batches(batch_id,batch_name) VALUES 
(1,"ML"),
(2,"SQL"),
(3,"DSA");

INSERT INTO students(first_name,last_name,batch_id) VALUES
("Aditi","Rawat",1),
("Satyam","Paliwal",2),
("Rajesh","Kr",3),
("","",2);


-- Read a Table 
SELECT * 
FROM batches;



SELECT * 
FROM students;

-- Update Operation on Batches  (CASCADE Demo)
UPDATE batches 
SET batch_id = 11
WHERE batch_id = 1;

-- Delete Operation Demo (RESTRICT Demo)
DELETE FROM batches
WHERE batch_id = 2;
-- 08:52:35	DELETE FROM batches WHERE batch_id = 2	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`scalerdb`.`students`, CONSTRAINT `students_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`) ON DELETE RESTRICT ON UPDATE CASCADE)	0.0016 sec




