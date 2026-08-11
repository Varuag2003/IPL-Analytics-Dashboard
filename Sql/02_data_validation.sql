-- Project Name : IPL Analytics Dashboard (2008–2025)
-- Database     : MySQL 8.0
-- File Name    : 02_data_validation.sql
-- Description  : Validate imported datasets before starting SQL analysis.


-- Step 1 : Use Database
      USE ipl_analysis;

-- Step 2 : Show All Tables
        SHOW TABLES;

-- Step 3 : Verify Total Records
          SELECT COUNT(*) AS Total_Matches FROM matches;
          SELECT COUNT(*) AS Total_Ball_Records FROM ball_clean;
          SELECT COUNT(*) AS Total_Players FROM players_clean;
          SELECT COUNT(*) AS Total_Teams FROM teams_clean;


-- Step 4 : Preview Data
          SELECT *FROM matches LIMIT 10;
          SELECT *FROM ball_clean LIMIT 10;
          SELECT *FROM players_clean LIMIT 10;
          SELECT *FROM teams_clean LIMIT 10;

-- Step 5 : Check Table Structure
       DESCRIBE matches;
	   DESCRIBE ball_clean;
       DESCRIBE players_clean;
       DESCRIBE teams_clean;

-- Step 6 : Check NULL Primary Keys
SELECT *FROM matches WHERE match_id IS NULL;
SELECT *FROM ball_clean WHERE match_id IS NULL;

-- End of File