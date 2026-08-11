-- Project Name : IPL Analytics Dashboard (2008-2025)
-- Database     : MySQL 8.0
-- File Name    : 07_stored_procedures.sql
-- Description  : Stored Procedures for Dashboard Reporting.


-- Step 1 : Use Database
       USE ipl_analysis;
       
-- Step 2 : Total Matches
     DELIMITER $$
     CREATE PROCEDURE sp_total_matches()
        BEGIN
            SELECT COUNT(*) AS Total_Matches     FROM matches;
        END$$
	 DELIMITER ;

-- Step 3 : Season Wise Matches
      DELIMITER $$
      CREATE PROCEDURE sp_matches_by_season()
         BEGIN
            SELECT season, COUNT(*) AS Total_Matches
            FROM matches GROUP BY season ORDER BY season;
		 END$$
      DELIMITER ;
      
-- Step 4 : Top 10 Batsmen
       DELIMITER $$
       CREATE PROCEDURE sp_top_batsmen()
          BEGIN
            SELECT batter, SUM(batter_runs) AS Total_Runs FROM ball_clean 
            GROUP BY batter ORDER BY Total_Runs DESC LIMIT 10;
          END$$
	   DELIMITER ;

-- Step 5 : Top 10 Bowlers
        DELIMITER $$
		CREATE PROCEDURE sp_top_bowlers()
          BEGIN
            SELECT bowler, SUM(is_wicket) AS Total_Wickets FROM ball_clean
            GROUP BY bowler ORDER BY Total_Wickets DESC LIMIT 10;
          END$$
		DELIMITER ;
        
-- Step 6 : Team Win Summary
        DELIMITER $$
           CREATE PROCEDURE sp_team_wins()
              BEGIN
                 SELECT match_winner, COUNT(*) AS Total_Wins
                 FROM matches WHERE match_winner IS NOT NULL
                 GROUP BY match_winner ORDER BY Total_Wins DESC;
              END$$
        DELIMITER ;

-- Step 7 : Venue Analysis
         DELIMITER $$
             CREATE PROCEDURE sp_venue_analysis()
                 BEGIN
                   SELECT venue, COUNT(*) AS Matches_Hosted FROM matches 
                   GROUP BY venue ORDER BY Matches_Hosted DESC;
				 END$$
         DELIMITER ;

-- Step 8 : Display Stored Procedures
         SHOW PROCEDURE STATUS
         WHERE Db='ipl_analysis';

-- End of File