--books db assessment

--content---------------------------------------------------------
-- 1. print the number of books in the DATABASE
-- 2. print how many books were released in each YEAR
-- 3.print out the total number of books in stock
-- 4. find the average released_year for each AUTHOR
-- 5. find the full name of the author who wrote the longest book
--6. count the number of books by year, and select the average number of pages per year
-------------------------------------------------------------------


-- 1. print the number of books in the DATABASE
SELECT COUNT(*) AS number_of_books
FROM books
;

-- 2. print how many books were released in each YEAR
SELECT DISTINCT released_year, COUNT(released_year) AS books_written
FROM books
GROUP BY released_year
ORDER BY released_year ASC
;

-- 3.print out the total number of books in stock
SELECT SUM(stock_quantity) AS books_in_stock
FROM books
;

-- 4. find the average realeased_year for each AUTHOR
SELECT 
CONCAT(author_fname, ' ', author_lname) AS author_name,
--author_fname,
--author_lname,
AVG(released_year) AS average_released_year
FROM books
GROUP BY author_fname, author_lname
ORDER BY author_name ASC
;

-- 5. find the full name of the author who wrote the longest book
SELECT 
CONCAT(author_fname, ' ', author_lname) AS author_name,
pages
FROM books
--this portion of code will allow us to filter the results to only one author
WHERE pages = (SELECT MAX(pages) AS length_of_book --this column is not shown due to our selection criteria
FROM books)
AND author_fname IS NOT NULL
GROUP BY author_fname, author_lname, pages
ORDER BY pages 
;

--6. count the number of books by year, and select the average number of pages per year
SELECT 
released_year AS [year],
COUNT(*) AS number_of_books,
AVG(pages)
FROM books
WHERE released_year IS NOT NULL
GROUP BY released_year
ORDER BY released_year ASC





