1. --Select the ProductName and ProductID. Order by ProductName.

select ProductName,
ProductID
from Products
order by ProductName

2. --Select the ProductID and ProductName. Order by ProductName. 
--(note that it is natural to order first by the left-most column)

select ProductID,
ProductName
from Products
order by ProductName

3. --Select the ProductID, productname, and total value of inventory. 
--The total value is found by multiplying the unitsInstock and unitprice. 
--Name the new column [inventory value]. Order by inventory value descending.

select ProductID,
ProductName,
unitsInstock*unitprice as [inventory value]
from Products
order by [inventory value] desc

4. --Select the CategoryID, ProductID, productname and inventory value. Order first 
--by CategoryID ascending, then by inventory value descending.

select CategoryID,
ProductID,
productname,
UnitsInStock*UnitPrice as [inventory value]
from Products
order by CategoryID ASC,
[inventory value] DESC

5. --Select the ProductID, ProductName, and 
--unitsInstock plus unitsOnOrder. Name this column [units available].

select ProductID,
ProductName,
unitsInstock + unitsOnOrder as [units available]
from Products

6. --(Note, we're switching to the customer table....) Show the CustomerID and ContactName 
--of all customers. Order by CustomerID. Rename the columns [ID] and [name].

select CustomerID as [ID],
ContactName AS [name]
from customers
order by CustomerID


7. --Show the CustomerID, ContactName, location of the space character in the contactname, 
--and the length of the contactName. 
--Use the CHARINDEX() and LEN() functions.

select CustomerID,
ContactName,
CHARINDEX(' ', contactname), 
LEN(contactName)
from Customers

8.--Show the CustomerID, ContactName, 
--and the last name of the contact. Use code from 7 above, and the RIGHT() function

select CustomerID,
ContactName,
RIGHT(ContactName , 
LEN(ContactName)
-
CHARINDEX(' ',Contactname) )
as [last name]
from Customers

9.--Show the CustomerID, CompanyName, and the City and Country 
--concatenated together with a comma, like this: Berlin, Germany. 
--USE the plus sign. Order first by the Country, then by the City, then by the customerID.

SELECT
 CustomerID,
 CompanyName,
 City,
 Country,
CustomerID+ ',' + ' ' + CompanyName + ',' + ' ' + City + ',' + ' ' + [Country] 
from customers 
order by Country, 
City,
CustomerID

10. --Let's check to see if the CompanyNames are clean. 
--Show the CustomerID and CompanyName of each customer. 
--Also show the length in characters of the CompanyName. 
--Also show the trimmed CompanyName (use the TRIM() function.) 
--Also show the length of the trimmed CompanyName. 
--If those two lengths are different, then CompanyName has some trailing spaces.

SELECT CustomerID,
 CompanyName,
 City,
 Country,
CustomerID + ',' + ' ' + CompanyName + ',' + ' ' + City + ',' + ' '  + [Country],
LEN(CompanyName),
TRIM(CompanyName) 
from customers 
order by Country, 
City,
CustomerID

11. --Show the CustomerID and the contactName converted to lower case (use LOWER()).

select CustomerID,
ContactName,
LOWER (CustomerID), 
LOWER(contactName) 
from customers

12. --Show the CustomerID, and the contactname. 
--We'd also like to see the customer name like this: first initial, 
--one space, then the lastname, all in one column called [short name].

select CustomerId,
ContactName,
LEFT( ContactName, 1) + ' ' +
RIGHT(ContactName, LEN(ContactName) - CHARINDEX(' ', ContactName))
as [short name]
from Customers














