-- Step 4. Research and test a solution.[cite: 1]
-- Reference: Stack Overflow / Microsoft Docs for string manipulation
SELECT ContactName, 
       SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName + ' ') - 1) AS TestedFirstName
FROM t_w3_schools_customers;