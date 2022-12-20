--String functions exercise

---------------------------
--TODO:
--#1. REVERSE AND UPPERCASE the following sentence
--"Why does my cat look at me with such hatred?"

--#2. in the books database, replace the spaces in the titles and replace them with '->'

--#3. print out the authors first name forwards and reversed in capitals forwards, and lowercase backwards

--#4. print out the authors names in capital letters from the books database

--#5. print the book title and the length of each book title

--#6. 
--1. print the first ten characters of the book title followed by '...'
--2. make ever authors name appear as last_name, first_name
--3. list the stock quantity and add the sentence 'in stock' to the end


---------------------------
--#1
SELECT UPPER(REVERSE('Why does my cat look at me with such hatred?'))
;
--#2
SELECT REPLACE(title, ' ', '->') AS title
FROM books
;
--#3
SELECT UPPER(author_fname) AS forwards, 
        LOWER(REVERSE(author_fname)) AS backwards
FROM books
;
--#4
SELECT UPPER(CONCAT_WS(' ',author_fname, author_lname))
FROM books
;
--#5
SELECT *, LEN(title) AS character_count
from books
;
--#6
SELECT CONCAT(SUBSTRING(title,1,10), '...') AS short_title,
        CONCAT(author_lname, ',', author_fname),
        CONCAT(' in stock ', stock_quantity) AS quantity
from books
     