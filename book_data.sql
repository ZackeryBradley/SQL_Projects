-- CREATE TABLE books
-- 	(
-- 		--book_id INT, 
-- 		--NOT NULL, 
-- 		--AUTO_INCREMENT
-- 		title VARCHAR(100),
-- 		author_fname VARCHAR(100),
-- 		author_lname VARCHAR(100),
-- 		released_year INT,
-- 		stock_quantity INT,
-- 		pages INT,
-- 		--PRIMARY KEY(book_id)
-- 		PRIMARY KEY(title)
-- 	)
;

-- INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
-- VALUES
-- ('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
-- ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
-- ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
-- ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
-- ('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
-- ('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
-- ('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
-- ('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
-- ('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
-- ('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
-- ('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
-- --("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
-- ('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
-- ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
-- ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
-- ('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
;
--
SELECT *
from books
;
--DROP TABLE books
--SOURCE file_name.sql
;
-- --using CONCATENATE for combining data
-- SELECT CONCAT('h', 'e', 'l')
-- --notice how this combines the three letters to form 'hel'
-- ;
-- SELECT CONCAT('author_fname', '!!!')
-- --another example of concatenate
-- ;
SELECT CONCAT(author_fname,' ', author_lname)
FROM books
;
--CONCAT_WS will add spaces in your code!
--must add a space in the beginning
SELECT CONCAT_WS(' ','hello', 'how', 'are', 'you?')
;

SELECT CONCAT_WS('-', 'author_fname', 'author_lname')
FROM books
;
SELECT CONCAT_WS('_', title, author_fname, author_lname)
FROM books
;
-- --USING SUBSTRING methodology
-- --this will disinclude some of the text in a query
-- --in this examples we are counting to '6' by '1' character at a time
-- SELECT SUBSTRING('Hello World', 1, 6)
-- ;
-- --showing the character starting at '2' characters passed the '7th' character
-- SELECT SUBSTRING('Hello World', 7, 2)
-- ;
-- --start at the 6th position, and count 6 after
-- SELECT SUBSTRING('Hello World', 6, 6)
;
--abbreviating the books 'title' table
--START AT THE FIRST CHARACTER, END AT 15.
SELECT SUBSTRING(title, 1, 15)
FROM books
;
--substringing the authors last name as an initial
SELECT *, SUBSTRING(author_lname, 1, 1)
FROM books
;
SELECT *,
SUBSTRING(author_fname,1 , 1)AS f_initial,
SUBSTRING(author_lname, 1, 1) AS l_initial
FROM books
;
--combining both concatenate and substring
-- the sperator is for the concat function at the end!
SELECT CONCAT(
			SUBSTRING(title, 1, 10), 
			'...'
			) AS short_title
FROM books
;
--making authors initials
SELECT CONCAT(
		SUBSTRING(author_fname, 1, 1), 
		'.',
		SUBSTRING(author_lname, 1,1),
		 '.'
		 )	AS initials
FROM books
;
--practicing with the replace command
--REPLACE allows us to replace part of a string 
--REPLACE(str, from_str,to_str), (the string that we are working on, the string(character) we want to replace, what we want to replace it with)
--EXAMPLE
-- SELECT REPLACE('Hello World', 'HEll', '@#$%')
-- ;
-- --this will replaces spaces with 'and'
-- SELECT
-- 	REPLACE('cheese bread coffee milk' , ' ', ' and ')
-- ;
-- SELECT REPLACE('I am Zackery', 'Zackery', 'Mr. Bradley')
;
--using the REPLACE command to replace the spaces in the books database for practice
SELECT REPLACE(title, ' ', '_')
FROM books
;
--The Reverse command
--reverses text
--EXAMPLE
--SELECT REVERSE('Hello World')
;
--SELECT REVERSE('Chicken Nuggets')
;
--using reverse to get the reverse of every authors name
SELECT REVERSE(author_fname)
FROM books
;
--Using commands to mirror names
SELECT CONCAT(author_fname, REVERSE(author_fname))
FROM books
