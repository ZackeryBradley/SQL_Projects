--Project 1
--Zackery Bradley
--no-table selects
--20210516

--1. Show the number 337894 in a one-row, one-column table using SELECT.

select 337894

--2. show the word 'redundant' in a one-row, one column table using SELECT.

select 'redundant'

--3. Show the number 88 in a one-row, one-column table using SELECT. The column should be named [Even Number].

select 88 as [Even Number]

--4. Show the 'Betty', 'Rubble', 'female', and 28 in a one-row, four-column table. 
--The columns should be named [First], [Last], [gender], and [age].

select 'Betty' as [first],
'Rubble' as [Last],
'female' as [gender],
28 as [age]

--5. Show the SQRT of 66784 using the SQRT() function. (documentation with examples (Links to an external site.))

select SQRT(66784)

--6. Show the name 'Johnny D. Quest' in a single column. Do this by concatenating (plus sign) these things:
--'Johnny'
--'D'
--'. '
--'Quest'. 

select 'Johnny' + ' ' + 'D.' + ' ' + 'Quest'

--7. Show the current server time in a column named [Current System Time]. Use the GETDATE() function.

select GETDATE() as [Current System Time]

--8. Show a 3-column, 1 row table that has 3378, "Betty", 36*27 in the columns. 
--The columns should be named "number", "name", and "result".

select 3378 as [number],
'Betty' as [name],
36*27 as [result]

--9. Find the SQRT of 7867, and multiple it by the SQRT of 3872. Show the result 
--in a one-row, one-column table where the column is called "calculation result". Use a single SELECT statement.

select SQRT(7867) * SQRT(3872) as [calculation result]

--10. Show the result of this calculation in a one-row, one-column table: ((897.0*13.0)+77.0)/4.0 
--. Name the column "calculation result".

select ((897.0*13.0)+77.0)/4.0 as [calculation result]