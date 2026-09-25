CREATE TABLE dbo.t_hello_world (
    greeting_id INT IDENTITY(1,1) NOT NULL,
    greeting_message VARCHAR(50) NOT NULL,
    date_created DATETIME DEFAULT GETDATE()
);