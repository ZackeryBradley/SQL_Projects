--JOINS_Assessment

-----------Exercises to Perform----------------------
--1. print the first_name of every student, along with the title and grade they got on each assignment
--2. perform the same thing as #1, but include NULL values
--3. perform the same thing as #2 but for the title replace NULL with MISSING on the title and 0 on the grade
--4. print the average of each students grades
--5. print each students grades and add a column indicating if the student passed or failed (failing == < 70)

-----------------------------------------------------


-- CREATE TABLE students (
--     id INT IDENTITY(1,1) PRIMARY KEY,
--     first_name VARCHAR(50)
-- )
-- ;
-- CREATE TABLE papers (
--     student_id INT,
--     title VARCHAR(50),
--     grade INT
-- )
-- ;
-- INSERT INTO students (first_name) VALUES 
-- ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa')
;
-- INSERT INTO papers (student_id, title, grade ) VALUES
-- (1, 'My First Book Report', 60),
-- (1, 'My Second Book Report', 75),
-- (2, 'Russian Lit Through The Ages', 94),
-- (2, 'De Montaigne and The Art of The Essay', 98),
-- (4, 'Borges and Magical Realism', 89)
;
SELECT * 
FROM students
;
SELECT *
FROM papers
;
--1. print the first_name of every student, along with the title and grade they got on each assignment
SELECT students.first_name, papers.title, papers.grade
FROM students
JOIN papers
ON students.id = papers.student_id
ORDER BY grade DESC
;
--2. perform the same thing as #1, but include NULL values
SELECT students.first_name, papers.title, papers.grade
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
;
--3. perform the same thing as #2 but for the title replace NULL with MISSING on the title and 0 on the grade

SELECT  students.first_name,
        ISNULL(papers.title, 'MISSING'),
        ISNULL(papers.grade, 0)
FROM students
LEFT JOIN papers
ON students.id = papers.student_id

;
--4. print the average of each students grades
SELECT  first_name, 
        ISNULL(AVG(grade), 0) AS average_grade
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average_grade DESC


--5. print each students grades and add a column indicating if the student passed or failed (failing == < 75)

SELECT first_name,
        ISNULL(AVG(grade), 0) AS average_grade,
        CASE WHEN ISNULL(AVG(grade), 0) >= 75 THEN 'passing'
        ELSE 'failing'
        END
FROM students
LEFT JOIN papers
ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average_grade DESC
