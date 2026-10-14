/* ============================================================================
   Course: Assignment 6.3 Performance Analysis
   Author: DMK
   Date: October 2026
   Target Engine: Microsoft SQL Server (AdventureWorks)
   Commit Message: Adding deliverable W6.4.
   ============================================================================ */

USE AdventureWorks2022; -- Adjust name to match your specific AdventureWorks database version
GO

/* ----------------------------------------------------------------------------
   ACTIVITY 1: QUERY 1 & INDEX CREATION (Table: Person.Address)
   ---------------------------------------------------------------------------- */

-- Step 1 & 2: Run query with an unindexed character field in the WHERE clause
-- NOTE: Before executing, ensure "Include Actual Execution Plan" (Ctrl + M) is active
SELECT AddressLine1, City, StateProvinceID, PostalCode
FROM Person.Address
WHERE City = 'Bothell';
GO

-- Step 6 & 7: Index Creation Step based on SQL Server Missing Index Recommendation
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_PersonAddress_City_DMK')
BEGIN
    CREATE NONCLUSTERED INDEX [IX_PersonAddress_City_DMK]
    ON [Person].[Address] ([City])
    INCLUDE ([AddressLine1], [StateProvinceID], [PostalCode]);
END
GO

-- Step 8: Re-run Query 1 to verify execution plan cost reduction
SELECT AddressLine1, City, StateProvinceID, PostalCode
FROM Person.Address
WHERE City = 'Bothell';
GO


/* ----------------------------------------------------------------------------
   ACTIVITY 2: QUERY 2 & INDEX CREATION (Table: Production.ProductDescription)
   ---------------------------------------------------------------------------- */

-- Step 1 & 2: Run a second slow query on an unindexed column in a different table
SELECT ProductDescriptionID, Description, ModifiedDate
FROM Production.ProductDescription
WHERE Description LIKE 'This%';
GO

-- Step 6 & 7: Create the second missing index to fix the subtree cost variance
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_ProductDescription_Description_DMK')
BEGIN
    CREATE NONCLUSTERED INDEX [IX_ProductDescription_Description_DMK]
    ON [Production].[ProductDescription] ([Description])
    INCLUDE ([ProductDescriptionID], [ModifiedDate]);
END
GO

-- Step 8: Re-run Query 2 to validate database performance scaling
SELECT ProductDescriptionID, Description, ModifiedDate
FROM Production.ProductDescription
WHERE Description LIKE 'This%';
GO
