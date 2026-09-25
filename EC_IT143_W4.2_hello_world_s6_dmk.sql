TRUNCATE TABLE dbo.t_hello_world;

INSERT INTO dbo.t_hello_world (greeting_message)
SELECT greeting_message FROM dbo.vw_hello_world;