1.	--Select the ProductID, ProductName, and unitsInStock of all products that 
--have fewer than 5 unitsInStock. Order products by productID.
select ProductID,
       ProductName,
       UnitsInStock
from   products
where  UnitsInstock < 5

2.	--Select the ProductID, ProductName, and unitsInStock of all products that 
--have unitprice greater than $8.00. Order by ProductID.

select ProductID,
       ProductName,
       UnitsInstock
from   Products
where  UnitPrice > $8.00
order by ProductID


3.	--Select the Productname, unitprice, and total value in inventory of all 
--products. Value in inventory is calculated by multiplying unitsInstock by 
--unitprice. Order by productname.

select ProductName,
       Unitprice,
       UnitsInstock*Unitprice as [total inventory value]
from   products
order by productname

4.	--Select the Productname, categoryID and unitprice of all products that are in 
--category 2 and cost less than $4. 

select Productname,
      categoryID,
      unitprice
from  Products
where unitprice < $4
and   CategoryID = 2 

5.	--Select the ProductName, categoryID, and unitprice of all products that are in
--category 7 and cost more than $8

select      ProductName,
            CategoryID,
            unitprice
from        Products
where       unitprice > $8.00
and         categoryID = 7

6.	--Combine all the records from questions 4 and 5 into a single SELECT 
--statement. Use parentheses, ANDs and ORs as necessary

select  Productname,
        categoryID,
        unitprice
from    Products
where   unitprice < $4 or  UnitPrice > $8
and     CategoryID = 2 or CategoryID = 7 

7.	--Show all productnames and prices of products that are packaged in bottles.
 --Do this by using the LIKE statement on the QuantityPerUnit field.

 select Productname,
        Unitprice
from    Products
where   QuantityPerUnit LIKE '%bottles%'

8.	--Show all productnames that end in the word 'Lager'.
select  productname
FROM    Products       
where   productname like '%Lager%'

9.	--Show all products that are in one of these categories: 2, 4, 5, or 7. Use the 
---IN clause. Show the name and unitprice of each product.

select  ProductName,
        unitprice
from    Products
where   CategoryID in (2, 4, 5, 7)

10.	--Select ProductID, ProductName, and SupplierID of all products that have 
--the word "Ale" or "Lager" in the productname. Order by ProductID.

select ProductID,
       ProductName,
       SupplierID
from   Products
where  ProductName LIKE '% ale' 
OR     ProductName LIKE  '%Lager'
order by ProductID

11.	--Select the productname, unitprice, and unitsInStock of all products whose 
--units in stock are less than half of the reorder level. Order by units in stock 
--ascending.

select  ProductName,
        Unitprice,
        UnitsInstock
from    Products
where   UnitsInStock< ReorderLevel/2
order by UnitsInStock ASC

12.	--Select the productname of all products whose value in inventory is less than 
--$200. Order by inventory value descending.

select   ProductName
from     Products
Where    UnitPrice < $200
order by UnitPrice desc 


13.	--Select the Productname of any products whose value in inventory is more 
--than $500 and is discontinued. Also show inventory value. Order by inventory 
--value descending.

select  ProductName
From    Products
where   UnitPrice < $500
and     Discontinued = 1

14.	--Show all products that we need to reorder. These are the products that are 
---not discontinued, and the unitsinstock plus unitsOnOrder is less than or 
--equal to the reorderLevel.

select  ProductName
from    Products
where   UnitsInStock + UnitsOnOrder <= ReorderLevel
and     Discontinued = 0


15.	--Show the categoryID, productID, productname, and unitprice of all products. 
--Order by categoryID, then unitprice descending, then productID.

select  ProductName, 
        CategoryID,
        ProductID,
        Unitprice
from    Products
order by CategoryID,
        UnitsOnOrder desc,
        ProductID


select ProductName
from Products
where ProductName LIKE ('% ale') OR
productname like ('% lager')
order by ProductID
