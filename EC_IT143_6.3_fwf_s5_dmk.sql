-- Step 5. Create a user-defined scalar function.[cite: 1]
CREATE FUNCTION dbo.udf_get_first_name (@ContactName VARCHAR(100))
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @FirstName VARCHAR(50);
    IF CHARINDEX(' ', @ContactName) > 0
        SET @FirstName = LEFT(@ContactName, CHARINDEX(' ', @ContactName) - 1);
    ELSE
        SET @FirstName = @ContactName;
    RETURN @FirstName;
END;
GO