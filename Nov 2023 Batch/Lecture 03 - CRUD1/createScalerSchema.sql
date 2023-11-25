CREATE DATABASE scalerDB;
USE scalerDB;

-- Create a Batches Table
CREATE TABLE batches(
	batch_id INT PRIMARY KEY AUTO_INCREMENT,
    batch_name VARCHAR(50) NOT NULL
);

-- Good Practice: Always specify the columns names
INSERT INTO batches(batch_id,batch_name) VALUES
(1,"Batch A"),
(2,"Batch B"),
(3,"Batch C");

CREATE TABLE students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    batch_id INT,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO students(first_name,last_name,batch_id) VALUES
("Ayushee","Shaw",1),
("Dilli","K",1),
("Rohan","Shaw",1),
("Rahul","Kumar",2),
("Naman","Kumar",3);

-- Specifying column names is Optional if you give data for all columns in the same sequence
INSERT INTO batches VALUES
(4,"Batch A"),
(5,"Batch B"),
(6,"Batch C");


-- Next Class?
-- 4 values in batch table (1,2,3,4)
-- for student table 3 values (5,6,7,8)





