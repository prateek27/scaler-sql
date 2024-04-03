-- Scaler Database
-- Students Tables
-- Batches Tables 

CREATE DATABASE scalerDB;
USE scalerDB;

-- Create Batches Table
CREATE TABLE batches(
	batch_id INT PRIMARY KEY,
    batch_name VARCHAR(50) 
);

-- Insert data into batch tables 
INSERT INTO batches(batch_id,batch_name) VALUES 
(1,"ML"),
(2,"SQL"),
(3,"DSA");

-- See all the rows of a given table
SELECT *
FROM batches;

-- Students Table 
CREATE TABLE students(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    batch_id INT,
    -- specify foreign key constraints 
    FOREIGN KEY(batch_id) REFERENCES batches(batch_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO students(first_name,last_name,batch_id) VALUES
("Khushboo","Singh",2),
("Mangesh","Kr",2),
("Ashwani","Kr",3),
("Harsh","Raj",1);

-- DELETION 
DELETE FROM batches 
WHERE batch_id=2;

-- Update 
UPDATE batches 
SET batch_id = 100 
WHERE batch_name="ML";

-- See students
SELECT * 
FROM students;

SELECT *
FROM batches;

-- INSERT INTO students(first_name,last_name,batch_id) VALUES
-- ("Khushboo","Singh",21);
-- 23:04:10	UPDATE batches  SET batch_id = 100  WHERE batch_name="ML"	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.0013 sec

