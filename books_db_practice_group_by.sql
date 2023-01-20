--Aggregate Functions


--select the number of books in the database
SELECT COUNT(*)
FROM books
;
--get the number of author fnames from the books database by using distinct
SELECT COUNT(DISTINCT author_fname)
FROM books
;
--getting a distinct count of the number of years we have released books for
SELECT COUNT(DISTINCT released_year)
FROM books
;
--finding the unique last name sin the books database
SELECT COUNT (DISTINCT author_lname)
FROM books
;
--how many books in the database contain the word "the"
SELECT COUNT (DISTINCT title)
FROM books
WHERE title LIKE '%the%'
;
--working with the GROUP BY function
--GROUP BY summarizes or aggregates identical data into single rows
SELECT author_lname, COUNT(*) as books_written
FROM books
GROUP BY author_lname
ORDER BY books_written ASC
;
--finding out how many books were released in a given year
SELECT DISTINCT released_year
FROM books
GROUP BY released_year
;
--Using min and max values
--finding the minimum released year that a book was published in outr database
SELECT MIN(released_year)
FROM books
;
--find the book with the maximum number of pages in the database
SELECT MAX(pages)
FROM books
;
--finding the lowest and highest (earliest and latest names alphabetically) names
SELECT MIN(author_lname),
       MAX(author_lname)
FROM books
;

--using subqueries
--getting the title of the books by longest page order desc
SELECT pages,
       title
FROM   books
ORDER BY pages DESC
;
--using a subquery to get the title of the book with the least pages
SELECT *
FROM books
WHERE pages = (SELECT MIN(pages)
FROM books)
;
--subquery for finding the largest book in the database
SELECT title,
       pages
FROM books
WHERE pages = (SELECT MAX(pages)
FROM books)
;
--what if there is a second book with the same number of pages?
INSERT INTO books(title, pages) VALUES ('my life in words', 634)
;
SELECT title, 
       pages
FROM    books
WHERE pages = '634'
;
--using a subquery to find the minimum year a book was released in the database
SELECT title, 
       released_year
FROM    books
WHERE   released_year = (SELECT MIN(released_year)
FROM books)
;
--group by multiple columns
SELECT author_fname,
       author_lname
FROM   books
ORDER  BY author_lname
;
--grouping authors by the number of books they have written
SELECT author_lname,
    COUNT(*) AS books_written
FROM books
GROUP BY author_lname, author_fname
;
-- SELECT CONCAT(author_fname, ' ', author_lname) AS author,  COUNT(*)
-- FROM books
-- GROUP BY author
;
--MIN and MAX group by
--find the year each author published their first book
SELECT author_fname,
      author_lname,
      MIN(released_year)
FROM  books
GROUP BY author_lname,
         author_fname
;
--find when each author released their first and last book with their longest book and how many books theyve written
SELECT  author_fname,
        author_lname,
        COUNT(*) as books_written,
        MAX(released_year) as latest_release,
        MIN(released_year) as earliest_release,
        MAX(pages) as longest_book
FROM   books
GROUP BY author_fname,
        author_lname
;
--working with the SUM command
SELECT SUM(pages)
FROM books
;
--SUM with group by
--showing the number of pages each author has written
SELECT author_fname,
      author_lname,
      SUM(pages)
FROM books
GROUP BY  author_fname, author_lname
;
--using the AVG command
--calulating the average released_year across all books
SELECT AVG(released_year)
FROM books
;
SELECT released_year,
       AVG(stock_quantity) AS stock_quantity,
       COUNT(*) AS count
FROM   books
GROUP BY released_year
