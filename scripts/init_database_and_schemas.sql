/*
===================================================================================
Create Database and Schemas 
===================================================================================
Script Purpose:
  This script is used to initials the database to be used in this project. It first checks if there is a database with the name that we want to use
  and if so it drops it. It then creates a new database named 'DataWarehousePortfolioProject'. Afterwards it uses the newly created database and creates
  three schemas, namely: 'Bronze', 'Silver', and 'Gold'. 

WARNING: 
  Running this script will drop the entire 'DataWarehousePortfolioProject' database if it exists. All the data in the database will be permanently 
  deleted. Ensure that proper precautions and backups are in place before use. 
*/

USE master; 
GO 

--Drop and recreate the 'DataWarehousePortfolioProject' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehousePortfolioProject')
BEGIN 
  ALTER DATABASE DataWarehousePortfolioProject SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehousePortfolioProject;
END;
GO

--Create the 'DataWarehousePortfolioProject' database
CREATE DATABASE DataWarehousePortfolioProject;
GO 

USE DataWarehousePortfolioProject;
GO

--Create Schemas
CREATE SCHEMA Bronze;
GO

CREATE SCHEMA Silver;
GO

CREATE SCHEMA Gold;
GO
