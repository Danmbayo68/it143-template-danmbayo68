-- Step 7. Perform a “0 results expected” test.[cite: 1]
WITH CTE_Check AS (
    SELECT ContactName,
           LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHoc_Result,
           dbo.udf_get_first_name(ContactName) AS UDF_Result
    FROM t_w3_schools_customers
)
SELECT *
FROM CTE_Check
WHERE AdHoc_Result <> UDF_Result;