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