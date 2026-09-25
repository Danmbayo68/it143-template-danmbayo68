CREATE PROCEDURE dbo.usp_hello_world_load
AS
BEGIN
    SET NOCOUNT ON;
    TRUNCATE TABLE dbo.t_hello_world;

    INSERT INTO dbo.t_hello_world (greeting_message)
    SELECT greeting_message FROM dbo.vw_hello_world;
END;