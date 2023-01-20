--books db assessment

--TODOS:
--1. select all titles that contain 'stories'
--2. print out the title and the page count of the longest book in the database
--3. print a summary containing the title and year for the three most recent books
--4. find all books with an author_lname that contains a space
--5. find the three books that have the lowest stock in the database
--6. print the title and author_lname, sorted first by author_lname, and then by title
--7. write 'MY FAVORITE AUTHOR IS' in all caps sorted by author_lname alphabetically

--checking out the data
SELECT *
FROM books
;
--1. select all titles that contain 'stories'
SELECT *
FROM books
WHERE TITLE LIKE '%stories%'
;
--2. print out the title and the page count of the longest book in the database
SELECT title, pages
FROM books
;
--3. print a summary containing the title and year for the three most recent books
SELECT *
FROM books
WHERE released_year 
;
--4. find all books with an author_lname that contains a space
SELECT *
FROM books
WHERE author_lname LIKE '% %'
;
--5. find the three books that have the lowest stock in the database
SELECT *
FROM books
ORDER BY stock_quantity DESC
--cant do LIMIT function?
;
--6. print the title and author_lname, sorted first by author_lname, and then by title
SELECT title, author_fname
FROM books
ORDER BY author_lname, title ASC
;
--7. write 'MY FAVORITE AUTHOR IS' in all caps sorted by author_lname alphabetically


-- SELECT title FROM books WHERE title LIKE '%stories%';
 
-- SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
 
-- SELECT 
--     CONCAT(title, ' - ', released_year) AS summary 
-- FROM books ORDER BY released_year DESC LIMIT 3;
 
-- SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
 
-- SELECT title, released_year, stock_quantity 
-- FROM books ORDER BY stock_quantity LIMIT 3;
 
-- SELECT title, author_lname 
-- FROM books ORDER BY author_lname, title;
 
-- SELECT title, author_lname 
-- FROM books ORDER BY 2,1;
 
-- SELECT
--     CONCAT(
--         'MY FAVORITE AUTHOR IS ',
--         UPPER(author_fname),
--         ' ',
--         UPPER(author_lname),
--         '!'
--     ) AS yell
-- FROM books ORDER BY author_lname;