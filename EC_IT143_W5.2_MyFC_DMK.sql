/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_MyFC_DMK.sql
PURPOSE: Create answers using SQL queries for the MyFC community dataset.

MODIFICATION HISTORY:
Ver      Date        Author           Description
-----  ----------  ---------------  ----------------------------------------
1.0    10/03/2026  DMK              Initial creation of questions and answers.
******************************************************************************************************************/

-- Q1: What is the total number of players registered in MyFC?
-- Author: DMK
SELECT 
    COUNT(player_id) AS total_players
FROM 
    dbo.myfc_players;


-- Q2: Which player has scored the highest number of goals this season?
-- Author: DMK
SELECT TOP 1
    player_name,
    goals
FROM 
    dbo.myfc_stats
ORDER BY 
    goals DESC;


-- Q3: What is the average salary of players grouped by their field position?
-- Author: DMK
SELECT 
    position,
    AVG(salary) AS average_salary
FROM 
    dbo.myfc_finance
GROUP BY 
    position;


-- Q4: Who are the top 3 players with the most assists in the tournament?
-- Author: John Smith (Classmate)
SELECT TOP 3
    player_name,
    assists
FROM 
    dbo.myfc_stats
ORDER BY 
    assists DESC;
