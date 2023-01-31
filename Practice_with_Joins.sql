--Practice using JOINS

--Relationship basics:

--1 to 1 relationship (least common relationship)
--1 to many relationship (most common relationship)
--many to many relationship

-- CREATE TABLE customers (
--     id INT IDENTITY(1,1) PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email VARCHAR(50)
-- );
 
-- CREATE TABLE orders (
--     id INT IDENTITY(1,1) PRIMARY KEY,
--     order_date DATE,
--     amount DECIMAL(8,2),
--     customer_id INT,
--     FOREIGN KEY (customer_id) REFERENCES customers(id)
-- );
 
-- INSERT INTO customers (first_name, last_name, email) 
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--        ('George', 'Michael', 'gm@gmail.com'),
--        ('David', 'Bowie', 'david@gmail.com'),
--        ('Blue', 'Steele', 'blue@gmail.com'),
--        ('Bette', 'Davis', 'bette@aol.com');
       
       
-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016-02-10', 99.99, 1),
--        ('2017-11-11', 35.50, 1),
--        ('2014-12-12', 800.67, 2),
--        ('2015-01-03', 12.50, 2),
--        ('1999-04-11', 450.25, 5);

SELECT * 
FROM customers;
SELECT *
FROM orders

-- DROP TABLE customers;
-- DROP TABLE orders;

-----------------------------------------------------
SELECT id 
FROM customers
WHERE last_name = 'George'
;
SELECT *
FROM orders 
WHERE customer_id = 1
;
--here is a unique way of getting information for two tables without using a JOIN
SELECT *
FROM orders
WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George') 
;

--Utilizing a CROSS JOIN
--this will combine every single data from every source of both tables. this is typically unused.
--this particular code is not useful.
SELECT *
FROM customers,orders
;
--Utilizing the most useful JOINS

--INNER JOINS select all records from A and B where the join condition is met
SELECT *
FROM customers
JOIN orders 
On customers.id = orders.customer_id
;
SELECT first_name, last_name, order_date, amount
FROM customers
JOIN orders 
ON customers.id = orders.customer_id
;

SELECT *
FROM orders 
JOIN customers 
ON orders.customer_id = customers.id
;

--Using INNER JOIN combined with GROUP BY

--Grouping orders by person for the sum of amount ordered
SELECT first_name, last_name, SUM(amount) AS total
FROM customers
JOIN orders
ON customers.id = orders.customer_id
GROUP BY first_name, last_name
ORDER BY total

--Utilizing a LEFT JOIN
--LEFT JOINS select everything from A along with any matching records in B
;
SELECT first_name, last_name, order_date, amount
FROM customers --in a LEFT JOIN the left table is always the FROM table
LEFT JOIN orders
ON customers.id = orders.customer_id
;
--this LEFT JOIN is essentially acting the same as an INNER JOIN because the data overlaps.
SELECT order_date, amount, first_name, last_name
FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.id
;

--Using LEFT JOIN with GROUP BY
SELECT first_name, last_name, SUM(amount) as Money_Spent
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
GROUP BY first_name, last_name
;
--Using ISNULL to further filter the data from above
--this will allow us to essentially replace the NULL value with a value of zero
--this is a function that may be different across SQL platforms.
SELECT first_name, last_name, ISNULL(SUM(amount),0) as Money_Spent
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
GROUP BY first_name, last_name
;

--Utilizing RIGHT JOINS
--RIGHT JOINS select everything from B, along with any matching records in A
--since every value has an ID, this is essentially the same as a INNER JOIN in this situation.
SELECT first_name, last_name, order_date, amount 
FROM customers
RIGHT JOIN orders
ON customers.id = orders.customer_id


