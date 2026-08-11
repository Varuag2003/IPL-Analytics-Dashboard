-- Project Name : IPL Analytics Dashboard (2008-2025)
-- Database     : MySQL 8.0
-- File Name    : 03_exploratory_analysis.sql
-- Description  : Basic Exploratory Data Analysis using SQL.

-- Step 1 : Use Database
        USE ipl_analysis;

-- Step 2 : Total Matches
        SELECT COUNT(*) AS Total_Matches FROM matches;

-- Step 3 : Total Teams
        SELECT COUNT(*) AS Total_Teams FROM teams_clean;
        
-- Step 4 : Total Players
        SELECT COUNT(*) AS Total_Players FROM players_clean;

-- Step 5 : Matches Played Per Season
		SELECT season, COUNT(*) AS Total_Matches FROM matches
        GROUP BY season ORDER BY season;

-- Step 6 : Top 10 Venues by Matches Hosted
        SELECT venue, COUNT(*) AS Matches_Hosted FROM matches
		GROUP BY venue ORDER BY Matches_Hosted DESC LIMIT 10;

-- Step 7 : Top 10 Cities by Matches Hosted
        SELECT city, COUNT(*) AS Total_Matches FROM matches
        GROUP BY city ORDER BY Total_Matches DESC LIMIT 10;

-- Step 8 : Top 10 Teams by Matches Played
	    SELECT team1 AS Team_Name, COUNT(*) AS Matches_Played FROM matches
	    GROUP BY team1 ORDER BY Matches_Played DESC LIMIT 10;

-- Step 9 : Toss Wins by Team
		SELECT toss_winner, COUNT(*) AS Toss_Wins FROM matches
        GROUP BY toss_winner ORDER BY Toss_Wins DESC;

-- Step 10 : Match Wins by Team
	    SELECT match_winner, COUNT(*) AS Match_Wins FROM matches
        WHERE match_winner IS NOT NULL GROUP BY match_winner
		ORDER BY Match_Wins DESC;

-- Step 11 : Top 10 Player of the Match Winners
		SELECT player_of_match, COUNT(*) AS Awards FROM matches
        WHERE player_of_match IS NOT NULL GROUP BY player_of_match
		ORDER BY Awards DESC LIMIT 10;

-- End of File