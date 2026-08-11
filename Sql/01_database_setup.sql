-- Project Name : IPL Analytics Dashboard (2008–2025)
-- Database     : MySQL 8.0
-- File Name    : 01_database_setup.sql
-- Description  : Create and initialize the database for the
--                IPL Analytics project.

-- Step 1 : Create Database
       CREATE DATABASE  ipl_analysis;

-- Step 2 : Use Database
	   USE ipl_analysis;

-- Step 3 : Verify Current Database
        SELECT DATABASE() AS Active_Database;

-- Step 4 : Display Available Databases
        SHOW DATABASES;

-- End of File
