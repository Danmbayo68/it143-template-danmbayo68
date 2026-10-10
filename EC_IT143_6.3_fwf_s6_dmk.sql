-- Step 6. Compare UDF results to ad hoc query results.[cite: 1]
SELECT ContactName,
       LEFT(ContactName, CHARINDEX(' ', ContactName + ' ') - 1) AS AdHoc_Result,
       dbo.udf_get_first_name(ContactName) AS UDF_Result
FROM t_w3_schools_customers;