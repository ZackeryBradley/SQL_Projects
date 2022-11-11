--1. Find any products that have not appeared on an order, ever. (LEFT JOIN, WHERE IS NULL)


SELECT				products.ProductName,
					orders.OrderID,
					orders.orderdate
FROM				products
LEFT JOIN			orders ON products.productID = orders.OrderID
WHERE 				Orders.OrderDate is NULL
ORDER BY			products.productID


--2. Find any products that have not appeared on an order in 1996. (subquery with NOT IN)


SELECT 				Products.ProductID,
					ORDERS.OrderDate
FROM				Orders
LEFT JOIN			PRODUCTS ON ORDERS.OrderID = Products.ProductID
WHERE 		NOT		YEAR(ORDERS.OrderDate) = 1996
ORDER BY 			Products.PRODUCTID


--3. Find any customers who have not placed an order, ever (similar to #1).


SELECT 	
					CUSTOMERS.CustomerID,
					ORDERS.OrderID,
					Orders.OrderDate
FROM				Customers
LEFT JOIN			Orders ON Orders.CustomerID = Customers.CustomerID
WHERE 				ORDERS.OrderID IS NULL
ORDER BY 			Orders.OrderID


--4. Find any customers that did not place an order in 1996 (similar to #2)


SELECT 				customers.ContactName
FROM			    customers
WHERE 				customers.CustomerID not IN
		(select Orders.CustomerID
		from Orders
		where year(orders.OrderDate) = 1996)
ORDER BY			customers.ContactName


--5. List all products that have been sold (any date). We need this to run fast, and we don't 
--really want to see anything from the [order details] table, so use EXISTS.


SELECT 				Products.ProductID,
					Products.UnitsOnOrder
FROM				Products
WHERE		EXISTS (SELECT *
					FROM [Order Details] 
					WHERE [Order Details].ProductID = Products.ProductID)
ORDER BY			Products.ProductID


--6. Give all details of all the above-average priced products. (simple subquery)


SELECT    				Products.*
FROM      				Products
WHERE     unitprice > (SELECT AVG(unitprice)
                       FROM   Products)
ORDER BY 			   Products.ProductName


--7. Find all orders where the ShipName has non-ASCII characters in it (trick: WHERE shipname 
--<> CAST(ShipName AS VARCHAR).


SELECT					ORDERS.ShipName
FROM					Orders
WHERE 				    ORDERS.ShipName  <> CAST(Orders.ShipName as varchar(1000))
ORDER BY 				Orders.shipname


--8.Show all Customers' CompanyName and region. Replace any NULL region with the word 'unknown'. 
--Use the ISNULL() function. (Do a search on SQL ISNULL)


SELECT				Customers.CompanyName,		
					ISNULL(CUSTOMERS.Region,'unknown')
FROM				Customers
ORDER BY			Customers.CustomerID


--9. We need to know a list of customers (companyname) who paid more than $100 for freight on 
--an order in 1996 (based on orderdate). Use the ANY operator to get this list. 
--(We are expecting this to have to run often on billions of records. This could 
--be done much less efficiently with a JOIN and DISTINCT.)


SELECT			Customers.CompanyName
FROM			Customers
WHERE	100 > ANY    (SELECT Orders.Freight
			  FROM 	 Orders
			  WHERE  Orders.CustomerID = Customers.CustomerID
			  AND YEAR(Orders.OrderDate) = 1996)
ORDER BY	    Customers.CompanyName


--10. We want to know a list of customers (companyname) who paid more than $100 for freight on 
--all of their orders in 1996 (based on orderdate). Use the ALL operator. 
--(We are expecting this to have to run often on billions of records. 
--This could be done much less efficiently using COUNTs.)


SELECT			Customers.CompanyName
FROM			Customers
WHERE	100 > ALL (SELECT Orders.Freight
			  FROM 	 Orders
			  WHERE  Orders.CustomerID = Customers.CustomerID
			  AND YEAR(Orders.OrderDate) = 1996)
ORDER BY	    Customers.CompanyName


--11. Darn! These unicode characters are messing up a downstream system. How bad is the problem? 
--List all orders where the shipName has characters in it that are not upper case letters A-Z or
--lower case letters a-z. Use LIKE to do this. (see the LIKE video, and use '%[^a-zA-Z]%'


SELECT					Orders.ShipName
FROM 					Orders
WHERE					Orders.ShipName LIKE '%[^a-zA-Z]%'
ORDER BY				orders.ShipName
 





