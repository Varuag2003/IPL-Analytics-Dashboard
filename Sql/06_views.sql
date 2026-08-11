-- Project Name : IPL Analytics Dashboard (2008-2025)
-- Database     : MySQL 8.0
-- File Name    : 06_views.sql
-- Description  : Create reusable SQL Views for Power BI Dashboard.


-- Step 1 : Use Database
         USE ipl_analysis;
         
-- Step 2 : View - Top Batsmen
         CREATE OR REPLACE VIEW vw_top_batsmen AS
         SELECT batter, SUM(batter_runs) AS Total_Runs 
         FROM ball_clean GROUP BY batter;
         
-- Step 3 : View - Top Bowlers
		 CREATE OR REPLACE VIEW vw_top_bowlers AS 
         SELECT bowler, SUM(is_wicket) AS Total_Wickets
         FROM ball_clean GROUP BY bowler;

-- Step 4 : View - Team Performance
         CREATE OR REPLACE VIEW vw_team_performance AS
         SELECT match_winner, COUNT(*) AS Total_Wins
         FROM matches WHERE match_winner IS NOT NULL
         GROUP BY match_winner;

-- Step 5 : View - Season Summary
        CREATE OR REPLACE VIEW vw_season_summary AS
		SELECT season, COUNT(*) AS Total_Matches
        FROM matches GROUP BY season;
        
-- Step 6 : View - Venue Analysis
        CREATE OR REPLACE VIEW vw_venue_analysis AS
		SELECT venue, COUNT(*) AS Matches_Hosted
        FROM matches GROUP BY venue;
        
-- Step 7 : View - City Analysis
        CREATE OR REPLACE VIEW vw_city_analysis AS
        SELECT city, COUNT(*) AS Total_Matches
        FROM matches GROUP BY city;

-- Step 8 : View - Player of the Match Summary
		CREATE OR REPLACE VIEW vw_player_of_match AS
		SELECT player_of_match, COUNT(*) AS Awards
        FROM matches WHERE player_of_match IS NOT NULL
        GROUP BY player_of_match;

-- Step 9 : View - Highest Team Scores
       CREATE OR REPLACE VIEW vw_team_scores AS
       SELECT match_id, team_batting, SUM(total_runs) AS Team_Score
	   FROM ball_clean GROUP BY match_id, team_batting;

-- Step 10 : View - Season Runs
       CREATE OR REPLACE VIEW vw_season_runs AS
       SELECT m.season, SUM(b.total_runs) AS Total_Runs
       FROM ball_clean b JOIN matches m 
       ON b.match_id = m.match_id GROUP BY m.season;

-- Step 11 : View - Toss Analysis
      CREATE OR REPLACE VIEW vw_toss_analysis AS
	  SELECT toss_winner, COUNT(*) AS Toss_Wins
      FROM matches GROUP BY toss_winner;
      
-- Step 12 : Display All Views
         SHOW FULL TABLES
         WHERE Table_type = 'VIEW';
         
-- End of File