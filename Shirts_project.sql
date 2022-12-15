-----------------------------
--STEPS TO BE COMPLETED
--1. Add a purple polo shirt, size M, worn 50 days ago to the table
--2.select all the shirts but only show the article and color
--3.select all medium shirts show everything but shirt_id
--4. update all polo shirts to size 'L'
--5.select all medium shirts and show everything but shirt_id
--6.select all shirts but only show article and color
-----------------------------


--Creating and cleaning a table
--creating the shirts table
-- CREATE TABLE shirts (
--     shirt_id VARCHAR(50),
--     article VARCHAR(50),
--     color VARCHAR(50),
--     shirt_size VARCHAR(50),
--     last_worn INT,
-- )
--checking the shirts table
--the 'last worn' column is to signal the number of days since the shirt has been worn!
SELECT *
FROM shirts
;
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES
    ('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15)
;
--1. Add a purple polo shirt, size M, worn 50 days ago to the table
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50)
;
--2.select all the shirts but only show the article and color
SELECT article, color 
FROM shirts
;
--3.select all medium shirts show everything but shirt_id
SELECT article, color, shirt_size, last_worn
FROM shirts
WHERE shirt_size LIKE 'M'
;
--4. update all polo shirts to size 'L'
SELECT article, color, shirt_size, last_worn
FROM shirts
WHERE article = 'polo shirt'
;
UPDATE shirts SET shirt_size = 'L'
WHERE article = 'polo shirt'
--5.select all shirts but only show article and color
SELECT article, color
FROM shirts 
;
--resetting last worn shirts
UPDATE shirts 
SET 
    last_worn = 0
WHERE
    last_worn = 15
;
--resetting colors and shirt sizes
UPDATE shirts 
SET 
    color = 'off white',
    shirt_size = 'XS'
WHERE
    color = 'white'
;
--checking for accuracy
SELECT *
FROM shirts
