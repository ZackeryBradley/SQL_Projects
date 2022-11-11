--1.Show the CategoryName, Description, and number of products in each category. 
--You will have trouble grouping by Category.Description, because of its data type.

SELECT 			categories.categoryName,
				CAST(CATEGORIES.DESCRIPTION AS varchar(MAX)) AS [DESCRIPTION],
				COUNT(products.ProductID) as [number of products]
FROM			Products
INNER JOIN 		Categories on Products.CategoryID = Categories.CategoryID 
GROUP BY		categories.CategoryName,
				CAST(CATEGORIES.DESCRIPTION AS varchar(MAX))				
ORDER BY 		Categories.CategoryName

--2.We want to know the percentage of buffer stock we hold on every product. We want to see this as a percentage 
--above/below the reorderLevel. Show the ProductID, productname, unitsInstock, reOrderLevel, and the percent 
--above/below the reorderlevel. So if unitsInstock is 13 and the reorderLevel level is 10, the percent 
--above/below would be 0.30. Make sure you convert at the appropriate times to ensure no rounding occurs. 
--Check your work carefully

SELECT 					PRODUCTS.ProductID,
						PRODUCTS.ProductName,
						PRODUCTS.UnitsInStock,
						PRODUCTS.ReorderLevel,
 						CAST (PRODUCTS.UNITSINSTOCK- products.reorderlevel AS FLOAT) / CAST (PRODUCTS.reorderlevel AS FLOAT) AS [REORDERLEVEL PERCENT]
FROM					Products
WHERE 					PRODUCTS.UnitsOnOrder <> 0
order by			    products.ProductID


--3. Show the orderID, orderdate, and total amount due for each order, including freight. Make sure that the amount 
--due is a money data type and that there is no loss in accuracy as conversions happen. Do not do any unnecessary 
--conversions. The trickiest part of this is the making sure that freight is NOT in the SUM.

SELECT 	
					orders.OrderID,
					orders.OrderDate,
					CONVERT(money, 
						SUM([Order Details].UnitPrice
						*[Order Details].Quantity)
						*(1.0-[Order Details].discount) 
						+ orders.Freight) as [amount due]
FROM				orders
JOIN				[order details] on [order details].orderid = orders.orderID
GROUP BY        	orders.OrderID,
               		orders.OrderDate,
					orders.Freight,
                	[Order Details].Discount
ORDER BY 			orders.orderid



--4.Our company is located in Wilmington NC, the eastern time zone (UTC-5). We've been mostly local, but are 
--now doing business in other time zones. Right now all of our dates in the orders table are actually our
-- server time, and the server is located in an Amazon data center outside San Francisco, in the pacific 
--time zone (UTC-8). For only the orders we ship to France, show the orderID, customerID, orderdate in UTC-5, 
--and the shipped date in UTC+1 (France's time zone.) You might find the TODATETIMEOFFSET() function helpful 
--in this regard, and also the SWITCHOFFSET() function.. Remember the implied time zone (EST) when you do this.

SELECT 					orders.OrderID,
	   	 				ORDERS.CustomerID,
	   					ORDERS.ORDERDATE,
						switchoffset (TODATETIMEOFFSET(GETDATE(),120), -5) as [UTC -5],
						orders.shippeddate,
						switchoffset (TODATETIMEOFFSET(GETDATE(),120), +1) as [UTC +1]
FROM 					ORDERS
WHERE 					ORDERS.ShipCountry = 'france'
ORDER BY 				orders.OrderID





--5.We are realizing that our data is taking up more space than necessary, which is making some of our regular data 
--become "big data", in other words, difficult to deal with. In preparation for a data migration, we'd like to 
--convert many of the fields in the Customers table to smaller data types. We anticipate having 1 million customers, 
--and this conversion could save us up to 58MB on just this table. Do a SELECT statement that shows all fields in
--the table, in their original order, and rows ordered by customerID, with these fields converted:
--CustomerID converted to CHAR(5) - saves at least 5 bytes per record
--PostalCode converted to VARCHAR(10) - saves up to 5 bytes per record
--Phone converted to VARCHAR(24) - saves up to 24 bytes per record
--Fax converted to VARCHAR(24) - saves up to 24 bytes per record

SELECT 		CUSTOMERS.*,
			CONVERT(char(5), customers.customerid) as [customerID],
			CONVERT(varchar(10), customers.postalcode) as [postal code],
			convert (VARCHAR(24), customers.phone) AS [phone number],
			convert (varchar(24), customers.fax) as [fax number]
FROM 		customers
ORDER BY 	customers.customerid




--6.Show a list of products, their unit price, and their ROW_NUMBER() based on price, ASC. 
--Order the records by productname.

SELECT 			products.ProductName,
				products.UnitPrice,
				row_number() 	over (order by products.unitprice ASC)
FROM 			Products
ORDER BY		products.ProductName

--7. Do #6, but show the DENSE_RANK() based on price, ASC, rather than ROW_NUMBER().

SELECT 				products.ProductName,
					products.UnitPrice,
					DENSE_RANK() 		over (order by products.unitprice ASC)
FROM				Products
ORDER BY 			Products.unitprice DESC

--8. Show a list of products ranked by price into three categories based on price: 1, 2, 3. The highest 1/3 of
-- the products will be marked with a 1, the second 1/3 as 2, the last 1/3 as 3. HINT: this is NTILE(3), 
--order by unitprice DESC.

SELECT				products.ProductName,
					products.UnitPrice,
					RANK() 				OVER (ORDER BY products.unitprice DESC) as [rank],
					NTILE(3) 			over (order by products.unitprice desc)as [tritile rank]
FROM 				Products
ORDER BY  			Products.unitprice DESC

--9. Show a list of products from categories 1, 2, 7, 4 and 5. Show their RANK() based on value in inventory.

SELECT 				categories.CategoryID,
					RANK() 				OVER (ORDER BY products.unitprice* products.unitsinstock DESC) as [inventory value rank],
					products.productname
FROM 				Categories
INNER JOIN 			products on Products.CategoryID = Categories.CategoryID
WHERE				categories.CategoryID in (1, 2, 7, 4, 5) 
ORDER BY 			Categories.CategoryID 

--10. Show a list of orders, ranked based on freight cost, highest to lowest. Order the orders by the orderdate.

SELECT 					Orders.*,
						RANK() 				OVER (ORDER BY orders.freight DESC) as [inventory value rank]
FROM 					Orders
ORDER BY			    orders.orderdate



 


