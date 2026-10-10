-- Step 3: Ad hoc query to extract the first name
SELECT ContactName, 
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS FirstName
FROM t_w3_schools_customers;