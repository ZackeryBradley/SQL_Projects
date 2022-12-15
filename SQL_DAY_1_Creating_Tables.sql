--#creates a DATABASE
use practice;
--#creates a table

CREATE TABLE cats 
(
    name VARCHAR(100),
    age INT
)

--another database creation example
CREATE TABLE dogs (
    name VARCHAR(50),
    breed VARCHAR(50),
    age INT
);
--checking my table
select *
from cats

-- dropping tables
DROP TABLE cats

-- table basics activity
CREATE TABLE pastries (
    name VARCHAR(50),
    quantity INT
)

-- inspecting to see if I created the table correctly
SELECT *
FROM pastries

---dropping the table i just created
DROP TABLE pastries;

--inserting data
INSERT INTO dogs(name, age)
VALUES (
    ' Jetson', 7
);
--checking to see if the data was properly input
select *
from dogs

--further practice
INSERT INTO dogs (name, breed, age)
VALUES (
    'Sadie',
    'Weimereiner',
    6
);
---checking again
select *
from dogs

--multi inserts
