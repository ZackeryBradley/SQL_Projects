
--1. Show the Supplier companyname and the count of how many products we get from 
--that supplier. Make sure to count the primary key of the products table. 
--Order by companyname

SELECT Suppliers.CompanyName,
COUNT(PRODUCTS.ProductID) AS [NUMBER OF PRODUCTS]     
FROM Products
INNER JOIN SUPPLIERS ON PRODUCTS.SupplierID = SUPPLIERS.SupplierID
GROUP BY SUPPLIERS.COMPANYNAME
ORDER BY SUPPLIERS.CompanyName

--2. Do number 1 again, but only include products that are not discontinued.

SELECT Suppliers.CompanyName,
COUNT(Products.ProductID) AS [NUMBER OF PRODUCTS]     
FROM Products
INNER JOIN SUPPLIERS ON PRODUCTS.SupplierID = SUPPLIERS.SupplierID
WHERE PRODUCTS.Discontinued = 0
GROUP BY SUPPLIERS.CompanyName
ORDER BY SUPPLIERS.CompanyName

--3. Show the Supplier companyname and the average unitprice of products from 
--that supplier. Only include products that are not discontinued.

SELECT SUPPLIERS.CompanyName,
AVG(UnitPrice) AS [AVG UNITPRICE]
FROM Products
inner JOIN Suppliers ON PRODUCTS.SupplierID = Suppliers.SupplierID
WHERE Discontinued = 0
GROUP BY SUPPLIERS.CompanyName
ORDER BY SUPPLIERS.CompanyName

--4.Show the Supplier companyname and the total inventory value of all products
-- from that supplier. This will involve the SUM() function with some calculations 
--inside the functions.

select suppliers.CompanyName,
SUM(products.unitsinstock*products.unitprice) as [total inventory]
from Products
inner join Suppliers on products.SupplierID = Suppliers.SupplierID
group by suppliers.CompanyName
order by suppliers.CompanyName

--5.Show the Category name and a count of how many products are in each category.

select COUNT(products.ProductID) as [products in each category],
       categories.categoryname
from products
inner join categories on products.categoryid = categories.categoryid
GROUP BY
         CATEGORIES.CategoryName
ORDER BY CATEGORIES.CategoryName



--6. Show the Category name and a count of how many products in 
--each category that are packaged in jars (have the word 'jars' in the QuantityPerUnit.)

select COUNT(products.ProductID) as [product count],
categories.CategoryName
from Products
inner join categories on products.productid = Categories.CategoryID
where QuantityPerUnit like '%jars%'
group by categories.CategoryName
order by categories.categoryname
--7. Show the Category name, and the minimum, average, 
--and maximum price of products in each category.
select Categories.CategoryName,
MIN(Products.UnitPrice),
AVG(Products.unitprice),
MAX(Products.UnitPrice)
from Products
inner join categories on products.CategoryID = categories.CategoryID
group by categories.CategoryName
order by categories.CategoryName
--8.Show each order ID, its orderdate, the customer ID, 
--and a count of how many items are on each order

select count    ([Order Details].quantity) as [product count],
                orders.OrderID,
                orders.OrderDate,
                orders.customerid
from            [Order Details]
inner join      orders on [Order Details].OrderID = orders.orderID
group by        orders.OrderID,
                orders.OrderDate,
                orders.CustomerID
order by        orders.OrderID

--9. Show each productID, its productname, and a count of how many orders it has appeared on.

select          COUNT([Order Details].OrderID) as [count],
                [Order Details].ProductID,
                products.ProductID,
                products.productname
from            products
inner join      [Order Details] on  products.productID = [Order Details].ProductID
group by        [Order Details].productID,
                products.productID,
                products.productname
order by        products.ProductID

--10. Do #9 again, but limit to only orders that were place in January of 1997. 


select          (COUNT([order details].productID)) as [count],
                [Order Details].ProductID,
                products.ProductID,
                products.productname
from            products
inner join      [Order Details] on  products.productID = [Order Details].ProductID
INNER JOIN      ORDERS ON  [Order Details].ORDERID = ORDERS.OrderID
where                   orders.OrderDate between ('1997-01-01') and ('1997-01-31')
group by        [Order Details].productID,
                products.productID,
                products.productname
order by        products.ProductID

--11. Show each OrderID, its orderdate, the customerID, and the total amount due, 
--not including freight. Sum the amounts due from each product on the order. The 
--amount due is the quantity times the unitprice, times one minus the discount. 
--order by amount due, descending, so the biggest dollar amount due is at the top.

SELECT          orders.OrderID,
                orders.OrderDate,
                orders.CustomerID,
SUM([Order Details].UnitPrice*[Order Details].Quantity)*1-[Order Details].UnitPrice as [amount due]
from            Orders
inner join      [Order Details] on [Order Details].OrderID = ORDERS.OrderID
GROUP BY        orders.OrderID,
                orders.OrderDate,
                orders.customerID,
                [Order Details].UnitPrice
order by        [amount due] desc

12. --We want to know, for the year 1997, the total revenues by category. Show the CategoryID, 
--categoryname, and the total revenue from products in that category. This is very much like #11. 
--Don't include freight.

select      DISTINCT    categories.CategoryID, 
                        categories.CategoryName,
SUM([Order Details].Quantity*[Order Details].UnitPrice*1-[Order Details].Discount) AS [ TOTAL REVENUE]
from                    CATEGORIES 
INNER JOIN              Products ON Categories.CategoryID= Products.CategoryID
inner join              [Order Details] ON [ORDER DETAILS].ProductID = PRODUCTS.PRODUCTID
INNER JOIN              ORDERS ON [Order Details].ORDERID = ORDERS.OrderID
WHERE                   YEAR(ORDERS.OrderDate) = 1997
group by                Categories.CategoryID,
                        Categories.CategoryName
order by                CATEGORIES.CategoryName 
                         
--13. We want to know, for the year 1997, total revenues by month. Show the month number, 
--and the total revenue for that month. Don't include freight.

select                  MONTH(ORDERS.OrderDate) AS 'MONTH',
                        categories.CategoryID, 
                        categories.CategoryName,
SUM([Order Details].Quantity*[Order Details].UnitPrice*1-[Order Details].Discount) AS [REVENUE]
from                    CATEGORIES 
INNER JOIN              Products ON Categories.CategoryID= Products.CategoryID
inner join              [Order Details] ON [ORDER DETAILS].ProductID = PRODUCTS.PRODUCTID
INNER JOIN              ORDERS ON [Order Details].ORDERID = ORDERS.OrderID
WHERE                   YEAR(ORDERS.OrderDate) = 1997
group by                MONTH(ORDERS.OrderDate),
                        CATEGORIES.CategoryID,
                        CATEGORIES.CategoryName
order by                MONTH(Orders.OrderDate) 



--14. We want to know, for the year 1997, total revenues by employee. Show the 
--EmployeeID, lastname, title, then their total revenues. Don't include freight.

select                  Employees.EmployeeID,
                        EMPLOYEES.LastName,
                        Employees.TITLE,
SUM([Order Details].Quantity*[Order Details].UnitPrice*1-[Order Details].Discount) AS [REVENUE]
from                    Employees
INNER JOIN              ORDERS ON Employees.EmployeeID= Orders.EmployeeID
INNER JOIN              [Order Details] ON [Order Details].ORDERID = ORDERS.OrderID
WHERE                   YEAR(ORDERS.OrderDate) = 1997
group by                MONTH(ORDERS.OrderDate),
                        EMPLOYEES.EMPLOYEEID,
                        Employees.LastName,
                        EMPLOYEES.Title
order by                MONTH(Orders.OrderDate) 
--15. We want to know, for the year 1997, a breakdown of revenues by month and category. 
--Show the month number, the categoryname, and the total revenue for that month in that 
--category. Order the records by month then category

select                  MONTH(ORDERS.OrderDate) AS 'MONTH',
                        categories.CategoryName,
SUM([Order Details].Quantity*[Order Details].UnitPrice*1-[Order Details].Discount) AS [REVENUE]
from                    CATEGORIES 
INNER JOIN              Products ON Categories.CategoryID= Products.CategoryID
inner join              [Order Details] ON [ORDER DETAILS].ProductID = PRODUCTS.PRODUCTID
INNER JOIN              ORDERS ON [Order Details].ORDERID = ORDERS.OrderID
WHERE                   YEAR(ORDERS.OrderDate) = 1997
group by                MONTH(ORDERS.OrderDate),
                        CATEGORIES.CategoryID,
                        CATEGORIES.CategoryName
order by                MONTH(Orders.OrderDate),
                        Categories.CategoryName


SELECT              Categories.CategoryName,
                    Products.productID,
                    Products.productName
FROM                Categories 
LEFT JOIN Products  ON Products.CategoryID = Categories.CategoryID
WHERE               Products.productID IS NULL
ORDER BY            Categories.CategoryName

SELECT              Orders.OrderID,
                    Orders.Freight
FROM                Orders
WHERE    Orders.Freight > ( SELECT AVG(Orders.Freight) 
                            FROM     Orders ) 
ORDER BY            Orders.OrderID

SELECT      Orders.OrderID
FROM        Orders

SELECT      *
FROM        Products

SELECT      Products.ProductName,  
            Products.UnitsonOrder,
            Products.ReorderLevel,
            Products.Discontinued,
            AVG(Products.UnitPrice) AS [average unit price]  
FROM        Products
GROUP BY    Products.ProductName,
            Products.UnitsonOrder,
            Products.ReorderLevel,
            Products.Discontinued
ORDER BY    Products.ProductName

SELECT      Categories.CategoryName,
            AVG(Products.unitprice) AS [average unit price]
FROM        Products    
INNER JOIN        Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY    Categories.CategoryID
ORDER BY    CATEGORIES.CategoryID


SELECT      Products.ProductName,
            Products.ReorderLevel,
            AVG(Products.UnitPrice) AS [average unit price]  
FROM        Products
GROUP BY    Products.ProductName,
            Products.ReorderLevel

SELECT      *
FROM        Categories

SELECT      *
FROM        Suppliers

SELECT      Products.ProductName,
            Products.UnitPrice,
            AVG(PRODUCTS.UnitPrice) AS [Average Unit Price]
FROM        Products
GROUP BY    Products.ProductName,
            Products.UnitPrice


SELECT      Products.CategoryID,
            Products.ProductID,
            Products.ProductName,
            Products.UnitPrice
FROM        Products
ORDER BY    CategoryID,
            ProductID

SELECT      PRODUCTS.CategoryID,
            Products.ProductName,
            AVG(Products.UnitPrice) AS [AVG Unit Price]
FROM        Products
ORDER BY    Products.CategoryID   


SELECT      PRODUCTS.CategoryID,
            Products.UnitPrice
FROM        Products
ORDER BY    Products.CategoryID

SELECT      Categories.CategoryName,
            AVG(Products.UnitPrice) AS [Average Unit Price]
FROM        Products
JOIN        Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY    Categories.CategoryName,
            Categories.CategoryID
ORDER BY    Categories.CategoryName

SELECT      PRODUCTS.CategoryID,
            Products.UnitPrice
FROM        Products
JOIN        Suppliers ON suppliers.SupplierID = Products.ProductID
JOIN        Categories ON Categories.CategoryID = Products.CategoryID

SELECT      Employees.FirstName,
            Employees.LastName,
            Employees.Title,
            Employees.BirthDate
FROM        Employees
WHERE     Employees.Title = 'Sales Representative'
AND       Employees.FirstName LIKE '__n%'




SELECT      Products.ProductName,
            PRODUCTS.CategoryID,
            Products.UnitPrice,
            Products.UnitsInStock,
            Products.UnitsOnOrder,
            MIN(Products.UnitPrice) AS [Number of price]
FROM        Products
WHERE       Products.UnitsInStock < Products.UnitsOnOrder 
GROUP BY    Products.ProductName,
            Products.CategoryID,
            Products.UnitPrice,
             Products.UnitsInStock,
            Products.UnitsOnOrder
ORDER BY     Products.ProductName,
            PRODUCTS.CategoryID,
            Products.UnitPrice,
            Products.UnitsInStock,
            Products.UnitsOnOrder

SELECT      *
FROM        Products