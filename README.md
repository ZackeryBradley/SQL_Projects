Here’s a **clean, GitHub-ready markdown section** you can drop straight into a README or learning repo. It includes a **problem**, **question**, **solution**, and **explanation**—structured for clarity and teaching value.

***

# 📊 Basic SQL Query Practice

## 🧩 Problem

You are given a table called `employees` with the following structure:

```sql
employees
---------
id (INT)
name (VARCHAR)
department (VARCHAR)
salary (INT)
hire_date (DATE)
```

### Sample Data

| id | name    | department | salary | hire\_date |
| -- | ------- | ---------- | ------ | ---------- |
| 1  | Alice   | HR         | 60000  | 2021-06-15 |
| 2  | Bob     | IT         | 80000  | 2020-03-10 |
| 3  | Charlie | IT         | 75000  | 2022-01-05 |
| 4  | Diana   | Finance    | 90000  | 2019-11-20 |
| 5  | Evan    | HR         | 65000  | 2023-07-01 |

***

## ❓ Question

Write SQL queries to answer the following:

1. Retrieve all columns for employees in the **IT department**
2. Get the **names and salaries** of employees earning more than **70,000**
3. Count the number of employees in each department
4. Find the **average salary** of all employees
5. Retrieve employees hired **after January 1, 2021**

***

## ✅ Solutions

### 1. Employees in the IT department

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

***

### 2. Names and salaries of employees earning more than 70,000

```sql
SELECT name, salary
FROM employees
WHERE salary > 70000;
```

***

### 3. Count of employees by department

```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;
```

***

### 4. Average salary of all employees

```sql
SELECT AVG(salary) AS avg_salary
FROM employees;
```

***

### 5. Employees hired after January 1, 2021

```sql
SELECT *
FROM employees
WHERE hire_date > '2021-01-01';
```

***

## 🧠 Explanation

### 🔹 SELECT

The `SELECT` statement is used to **retrieve data** from a table.

* `SELECT *` returns all columns
* `SELECT column1, column2` returns specific columns

***

### 🔹 WHERE

The `WHERE` clause filters rows based on a condition.

* Example: `salary > 70000` filters only high earners
* Example: `department = 'IT'` filters by a category

***

### 🔹 GROUP BY

The `GROUP BY` clause groups rows that share the same value.

* Often used with aggregate functions (like `COUNT`, `AVG`)
* Example: Count employees per department

***

### 🔹 Aggregate Functions

These perform calculations on multiple rows:

* `COUNT()` → number of rows
* `AVG()` → average value
* `SUM()` → total
* `MIN()` / `MAX()` → smallest/largest value

***

### 🔹 Date Filtering

SQL allows filtering by date using comparison operators:

* `>` (after a date)
* `<` (before a date)

Example:

```sql
WHERE hire_date > '2021-01-01'
```

***

## 💡 Takeaway

These fundamental SQL concepts are the building blocks for:

* Data analysis
* Reporting dashboards (like your Streamlit projects)
* ETL pipelines
* Data engineering workflows

***

If you want, I can level this up into a **real-world business case (with joins, KPIs, and analytics scenarios)** to better match your portfolio positioning.
