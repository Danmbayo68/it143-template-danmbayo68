/*******************************************************************************
NAME:    EC_IT143_W3.4_da.sql
PURPOSE: Craft SQL statements to answer selected AdventureWorks questions for Assignment 3.4.

MODIFICATION LOG:
Ver      Date        Author      Description
-----    ----------  --------    -----------------------------------------------
1.0      09/16/2026  DANI        1. Built initial script answering 8 selected questions.

RUNTIME: 
~2s

NOTES:
Answers 8 questions (2 Marginal, 2 Moderate, 2 Increased, 2 Metadata) using the
AdventureWorks2022 database in accordance with IT143 standards.
*******************************************************************************/

USE AdventureWorks2022;
GO

-- =============================================================================
-- CATEGORY 1: Business User questions — Marginal complexity
-- =============================================================================

-- Q1: Who are the top five employees with the highest number of vacation hours?
-- Author: Classmate 2
SELECT TOP 5 
    p.FirstName, 
    p.LastName, 
    e.VacationHours
FROM HumanResources.Employee AS e
INNER JOIN Person.Person AS p 
    ON e.BusinessEntityID = p.BusinessEntityID
ORDER BY e.VacationHours DESC;

-- Q2: What are the names of all the unique product colors available in stock?
-- Author: Classmate 2
SELECT DISTINCT 
    Color
FROM Production.Product
WHERE Color IS NOT NULL;

-- =============================================================================
-- CATEGORY 2: Business User questions — Moderate complexity
-- =============================================================================

-- Q3: We want to review our product lines. Which categories have more than twenty items and what are their names?
-- Author: Classmate 2
SELECT 
    pc.Name AS CategoryName, 
    COUNT(p.ProductID) AS TotalProducts
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS ps 
    ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc 
    ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
HAVING COUNT(p.ProductID) > 20;

-- Q4: How can I join Sales.SalesOrderHeader and Sales.Customer to calculate the total sales amount per customer?
-- Author: Dani (Self)
SELECT TOP 10
    c.CustomerID,
    SUM(soh.TotalDue) AS TotalSalesAmount
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.Customer AS c 
    ON soh.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalSalesAmount DESC;

-- =============================================================================
-- CATEGORY 3: Business User questions — Increased complexity
-- =============================================================================

-- Q5: Our logistics team is auditing order delivery timelines to improve customer satisfaction. 
-- Can you extract a summary of web orders placed in 2012 that took more than seven days to ship?
-- Author: Classmate 2
SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    soh.ShipDate,
    DATEDIFF(day, soh.OrderDate, soh.ShipDate) AS DaysToShip
FROM Sales.SalesOrderHeader AS soh
WHERE soh.OnlineOrderFlag = 1
  AND YEAR(soh.OrderDate) = 2012
  AND DATEDIFF(day, soh.OrderDate, soh.ShipDate) > 7;

-- Q6: How do I use a window function like ROW_NUMBER() to rank sales orders by total amount within each sales territory?
-- Author: Dani (Self)
SELECT 
    SalesOrderID,
    TerritoryID,
    TotalDue,
    ROW_NUMBER() OVER(PARTITION BY TerritoryID ORDER BY TotalDue DESC) AS OrderRank
FROM Sales.SalesOrderHeader
WHERE TerritoryID IS NOT NULL;

-- =============================================================================
-- CATEGORY 4: Metadata questions
-- =============================================================================

-- Q7: List all columns in the database that use the data type MONEY, based on INFORMATION_SCHEMA.COLUMNS.
-- Author: Classmate 1
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE DATA_TYPE = 'money'
ORDER BY TABLE_SCHEMA, TABLE_NAME;

-- Q8: Which tables in the AdventureWorks database contain a column named ProductID, according to INFORMATION_SCHEMA.COLUMNS?
-- Author: Classmate 1
SELECT 
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'ProductID'
ORDER BY TABLE_SCHEMA, TABLE_NAME;