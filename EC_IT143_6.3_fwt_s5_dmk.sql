-- Step 5. Test results to see if they are as expected.[cite: 1]
UPDATE t_w3_schools_customers
SET ContactName = 'Maria Anders Updated'
WHERE CustomerID = 'ALFKI';

SELECT CustomerID, ContactName, ModifiedDate, ModifiedBy
FROM t_w3_schools_customers
WHERE CustomerID = 'ALFKI';