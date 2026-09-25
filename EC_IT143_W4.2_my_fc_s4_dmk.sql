CREATE VIEW dbo.vw_my_fc_members AS
SELECT 1 AS member_id, 'Active' AS member_status, GETDATE() AS date_joined;