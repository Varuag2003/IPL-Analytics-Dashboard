-- Project Name : IPL Analytics Dashboard (2008-2025)
-- Database     : MySQL 8.0
-- File Name    : 04_business_analysis.sql
-- Description  : Business Insights and KPI Analysis using SQL.


-- Step 1 : Use Database
      USE ipl_analysis;

-- Step 2 : Top 10 Run Scorers
       SELECT batter, SUM(batter_runs) AS Total_Runs FROM ball_clean
	   GROUP BY batter ORDER BY Total_Runs DESC LIMIT 10;

-- Step 3 : Top 10 Wicket Takers
      SELECT bowler, SUM(is_wicket) AS Total_Wickets FROM ball_clean
      GROUP BY bowler ORDER BY Total_Wickets DESC LIMIT 10;

-- Step 4 : Top 10 Match Winning Teams
      SELECT match_winner, COUNT(*) AS Total_Wins FROM matches
      WHERE match_winner IS NOT NULL GROUP BY match_winner
      ORDER BY Total_Wins DESC LIMIT 10;
      
-- Step 5 : Highest Team Scores
      SELECT match_id, team_batting, SUM(total_runs) AS Team_Score FROM ball_clean
      GROUP BY match_id, team_batting ORDER BY Team_Score DESC LIMIT 10;

-- Step 6 : Teams Winning Toss Most Frequently
	 SELECT toss_winner, COUNT(*) AS Toss_Wins FROM matches
     GROUP BY toss_winner ORDER BY Toss_Wins DESC;
     
-- Step 7 : Players with Most Sixes
      SELECT batter, COUNT(*) AS Total_Sixes FROM ball_clean
      WHERE batter_runs = 6 GROUP BY batter ORDER BY Total_Sixes DESC LIMIT 10;

-- Step 8 : Players with Most Fours
      SELECT batter, COUNT(*) AS Total_Fours FROM ball_clean
      WHERE batter_runs = 4 GROUP BY batter ORDER BY Total_Fours DESC LIMIT 10;
      
-- Step 9 : Season-wise Total Runs
    SELECT m.season, SUM(b.total_runs) AS Season_Runs FROM ball_clean b
    JOIN matches m ON b.match_id = m.match_id
	GROUP BY m.season ORDER BY m.season;
    
-- Step 10 : Top 10 Venues by Matches
     SELECT venue, COUNT(*) AS Matches_Hosted FROM matches
	 GROUP BY venue ORDER BY Matches_Hosted DESC LIMIT 10;

-- Step 11 : Top 10 Cities by Matches
      SELECT city, COUNT(*) AS Total_Matches FROM matches
      GROUP BY city ORDER BY Total_Matches DESC LIMIT 10;
      
-- Step 12 : Top 10 Player of the Match Winners
     SELECT player_of_match, COUNT(*) AS Awards FROM matches
     WHERE player_of_match IS NOT NULL GROUP BY player_of_match
     ORDER BY Awards DESC LIMIT 10;

-- Step 13 : Average First Innings Score
     SELECT AVG(innings_score) AS Average_First_Innings_Score
FROM ( SELECT match_id, SUM(total_runs) AS innings_score FROM ball_clean
    WHERE innings = 1 GROUP BY match_id ) AS first_innings;

-- End of File