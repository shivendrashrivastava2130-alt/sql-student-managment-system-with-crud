-- =========================
-- CREATE COURSE TABLE
-- =========================
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- =========================
-- CREATE ENROLLMENT TABLE
-- =========================
CREATE TABLE Enrollment (
    EnrollID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(ID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- =========================
-- INSERT COURSES
-- =========================
INSERT INTO Course (CourseID, CourseName) VALUES
(1, 'Math'),
(2, 'Science'),
(3, 'English'),
(4, 'Computer'),
(5, 'Physics');

-- =========================
-- INSERT ENROLLMENTS (LINK STUDENTS TO COURSES)
-- =========================
INSERT INTO Enrollment (StudentID, CourseID) VALUES
(1,1),(1,2),(2,1),(3,3),(4,2),
(5,4),(6,5),(7,1),(8,3),(9,2),
(10,4),(11,5),(12,1),(13,2),(14,3),
(15,4),(16,5),(17,1),(18,2),(19,3),
(20,4);

-- =========================
-- INNER JOIN (Most Important)
-- =========================
-- Show student name with course name
SELECT s.Name, c.CourseName
FROM Student s
INNER JOIN Enrollment e ON s.ID = e.StudentID
INNER JOIN Course c ON e.CourseID = c.CourseID;

-- =========================
-- LEFT JOIN
-- =========================
-- Show all students even if not enrolled
SELECT s.Name, c.CourseName
FROM Student s
LEFT JOIN Enrollment e ON s.ID = e.StudentID
LEFT JOIN Course c ON e.CourseID = c.CourseID;

-- =========================
-- RIGHT JOIN
-- =========================
-- Show all courses even if no students
SELECT s.Name, c.CourseName
FROM Student s
RIGHT JOIN Enrollment e ON s.ID = e.StudentID
RIGHT JOIN Course c ON e.CourseID = c.CourseID;

-- =========================
-- COUNT STUDENTS PER COURSE
-- =========================
SELECT c.CourseName, COUNT(e.StudentID) AS Total_Students
FROM Course c
LEFT JOIN Enrollment e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;

-- =========================
-- TOP STUDENTS (>80 MARKS) WITH COURSE
-- =========================
SELECT s.Name, s.Marks, c.CourseName
FROM Student s
JOIN Enrollment e ON s.ID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
WHERE s.Marks > 80;
