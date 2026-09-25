TRUNCATE TABLE dbo.t_my_fc_members;

INSERT INTO dbo.t_my_fc_members (member_id, member_status, date_joined)
SELECT member_id, member_status, date_joined FROM dbo.vw_my_fc_members;