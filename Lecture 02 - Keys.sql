
-- Database for Scaler 
CREATE DATABASE scalerDB;

-- Currently used database 
USE scalerDB;

-- Create Tables
-- Homework: Look at different datatypes that are supported!
CREATE TABLE batches(
	batch_id INT,
    batch_name VARCHAR(50),
    PRIMARY KEY(batch_id)
);

CREATE TABLE students(
	student_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    batch_id INT,
    PRIMARY KEY(student_id),
    FOREIGN KEY(batch_id) REFERENCES batches(batch_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Insert some data into batches 
INSERT INTO batches(batch_id,batch_name) VALUES 
(1,"ML"),
(2,"SQL"),
(3,"DSA");

-- Insert some data into students
INSERT INTO students(student_id,first_name,last_name,batch_id) VALUES 
(1,"Vishal","X",1),
(2,"Sundar","Y",3),
(3,"Akshit","Z",2),
(4,"Naveen","W",1);

-- Read the table also 
SELECT * 
FROM batches;

SELECT * 
FROM students;

-- Update the batches table 
UPDATE batches
SET batch_name = "MLAI" 
WHERE batch_name = "ML";

UPDATE batches
SET batch_id = 11 
WHERE batch_id = 1;

-- Delete some batch 
DELETE FROM batches
WHERE batch_id = 2;
-- 08:38:59	DELETE FROM batches WHERE batch_id = 2	Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`scalerdb`.`students`, CONSTRAINT `students_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`) ON DELETE RESTRICT ON UPDATE CASCADE)	0.0034 sec

-- Homework: SET NULL, SET DEFAULT
-- Extra bits of info!
ALTER TABLE students
DROP FOREIGN KEY students_ibfk_1;

ALTER TABLE students
ADD CONSTRAINT fk_students_batchid
FOREIGN KEY(batch_id) REFERENCES batches(batch_id)
ON UPDATE CASCADE
ON DELETE SET NULL;







