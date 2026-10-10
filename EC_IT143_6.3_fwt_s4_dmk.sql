-- Step 4. Create an after-update trigger.[cite: 1]
CREATE TRIGGER trg_customers_audit
ON t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE t_w3_schools_customers
    SET ModifiedDate = GETDATE(),
        ModifiedBy = SUSER_NAME()
    FROM t_w3_schools_customers c
    INNER JOIN inserted i ON c.CustomerID = i.CustomerID;
END;
GO