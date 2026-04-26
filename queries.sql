-- Display All Students
SELECT * FROM Student;

-- Students with Marks > 60
SELECT * FROM Student
WHERE Marks > 60;

-- Update Marks of a Student
UPDATE Student
SET Marks = 65
WHERE ID = 2;

-- Display Updated Table
SELECT * FROM Student;

-- Delete a Record (optional)
DELETE FROM Student
WHERE ID = 4;

-- Final Table
SELECT * FROM Student;
