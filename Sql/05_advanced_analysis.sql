-- Project Name : IPL Analytics Dashboard (2008-2025)
-- Database     : MySQL 8.0
-- File Name    : 05_advanced_analysis.sql
-- Description  : Advanced SQL Analysis using Joins, CTEs,
--                Window Functions and Subqueries.


-- Step 1 : Use Database
          USE ipl_analysis;

-- Step 2 : Top 10 Batsmen using Window Function
          SELECT batter, SUM(batter_runs) AS Total_Runs, RANK() OVER(ORDER BY SUM(batter_runs) DESC)
          AS Player_Rank FROM ball_clean GROUP BY batter LIMIT 10;

-- Step 3 : Top 10 Bowlers using Dense Rank
          SELECT bowler, SUM(is_wicket) AS Total_Wickets, DENSE_RANK() OVER(ORDER BY SUM(is_wicket) DESC) 
          AS Bowler_Rank FROM ball_clean GROUP BY bowler LIMIT 10; 

-- Step 4 : Team-wise Win Percentage
          SELECT team, Matches_Played, Matches_Won, ROUND((Matches_Won * 100.0) / Matches_Played,2) 
          AS Win_Percentage FROM
(
    SELECT team1 AS team,
           COUNT(*) AS Matches_Played,
           SUM(team1 = match_winner) AS Matches_Won
    FROM matches
    GROUP BY team1 ) AS Team_Stats ORDER BY Win_Percentage DESC;
    
-- Step 5 : Top 5 Highest Scoring Matches
         SELECT match_id, team_batting, SUM(total_runs) AS Team_Score FROM ball_clean
         Group BY match_id, team_batting ORDER BY Team_Score DESC LIMIT 5;
         
-- Step 6 : Players Scoring More Than 5000 Runs
         SELECT batter, SUM(batter_runs) AS Total_Runs FROM ball_clean
         GROUP BY batter HAVING SUM(batter_runs) > 5000 ORDER BY Total_Runs DESC;
         
-- Step 7 : Average Runs by Each Batter
         SELECT batter, ROUND(AVG(batter_runs),2) AS Average_Runs FROM ball_clean
		 GROUP BY batter ORDER BY Average_Runs DESC;
         
-- Step 8 : Most Economical Bowlers
         SELECT bowler, ROUND(SUM(total_runs)/(COUNT(*)/6),2) AS Economy FROM ball_clean
         GROUP BY bowler HAVING COUNT(*) >= 120 ORDER BY Economy ASC LIMIT 10;

-- Step 9 : Top 10 Matches by Total Runs
         SELECT match_id, SUM(total_runs) AS Total_Runs FROM ball_clean
         GROUP BY match_id ORDER BY Total_Runs DESC LIMIT 10; 
         
-- Step 10 : Number of Matches Played by Each Team
         SELECT Team_Name, Matches_Played
FROM (
    SELECT team1 AS Team_Name,
           COUNT(*) AS Matches_Played
    FROM matches
    GROUP BY team1 ) AS Team_Count;
    
-- Step 11 : Highest Individual Score
	    SELECT batter, match_id, SUM(batter_runs) AS Runs FROM ball_clean
        GROUP BY batter, match_id ORDER BY Runs DESC LIMIT 10;
    
-- Step 12 : Season-wise Highest Run Scorer
        WITH Season_Runs AS 
(
SELECT m.season,
       b.batter,
       SUM(b.batter_runs) AS Runs FROM ball_clean b JOIN matches m
       ON b.match_id = m.match_id GROUP BY m.season,b.batter
)
SELECT * FROM Season_Runs ORDER BY season,Runs DESC;

-- Step 13 : Teams Winning by Highest Run Margin
        SELECT match_winner, MAX(win_by_runs) AS Highest_Run_Margin FROM matches
		GROUP BY match_winner ORDER BY Highest_Run_Margin DESC;

-- Step 14 : Teams Winning by Highest Wicket Margin
        SELECT match_winner, MAX(win_by_wickets) AS Highest_Wicket_Margin FROM matches
        GROUP BY match_winner ORDER BY Highest_Wicket_Margin DESC;
        
-- Step 15 : Top 10 Boundary Hitters
        SELECT batter, SUM(CASE WHEN batter_runs IN (4,6) THEN 1
               ELSE 0
			  END) AS Total_Boundaries FROM ball_clean GROUP BY batter
              ORDER BY Total_Boundaries DESC LIMIT 10;
              
-- End of File