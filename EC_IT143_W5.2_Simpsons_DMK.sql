/*****************************************************************************************************************
NAME:    EC_IT143_W5.2_Simpsons_DMK.sql
PURPOSE: Create answers using SQL queries for the Simpsons community dataset.

MODIFICATION HISTORY:
Ver      Date        Author           Description
-----  ----------  ---------------  ----------------------------------------
1.0    10/03/2026  DMK              Initial creation of questions and answers.
******************************************************************************************************************/

-- Q1: How many total episodes are recorded in the Simpsons dataset?
-- Author: DMK
SELECT 
    COUNT(episode_id) AS total_episodes;
FROM 
    dbo.simpsons_episodes;


-- Q2: Which Simpson character has the highest number of appearance counts?
-- Author: DMK
SELECT TOP 1
    character_name,
    appearance_count
FROM 
    dbo.simpsons_characters
ORDER BY 
    appearance_count DESC;


-- Q3: What is the average viewership rating for episodes aired in Season 1?
-- Author: DMK
SELECT 
    AVG(viewers_rating) AS avg_rating
FROM 
    dbo.simpsons_episodes
WHERE 
    season = 1;


-- Q4: What are the distinct occupations of characters living in Springfield?
-- Author: Jane Doe (Classmate)
SELECT DISTINCT 
    occupation
FROM 
    dbo.simpsons_characters
WHERE 
    city = 'Springfield';
