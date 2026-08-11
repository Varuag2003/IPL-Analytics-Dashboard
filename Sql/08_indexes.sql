-- Project Name : IPL Analytics Dashboard (2008-2025)
-- Database     : MySQL 8.0
-- File Name    : 08_indexes.sql
-- Description  : Performance Optimization using Indexes.


-- Step 1 : Use Database
         USE ipl_analysis;
 
 DESCRIBE matches;
 ALTER TABLE matches
MODIFY COLUMN match_id INT;
SELECT match_id
FROM matches
LIMIT 20;
SELECT match_id
FROM matches
WHERE match_id NOT REGEXP '^[0-9]+$'
LIMIT 20;