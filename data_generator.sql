-- Generate 1000 Students using Recursive CTE (MySQL 8+)

WITH RECURSIVE seq AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM seq WHERE n < 1000
)
INSERT INTO Student (ID, Name, Marks)
SELECT 
    n,
    CONCAT('Student_', n),
    FLOOR(50 + RAND() * 51)  -- Marks between 50 and 100
FROM seq;
