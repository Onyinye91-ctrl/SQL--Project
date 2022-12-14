-- Create Database
CREATE DATABASE projects;

-- Use project database
USE projects;

-- Create covid_19_data
CREATE TABLE Covid_19_data(
SerialNo INT,
Observation_Date DATE,
Province_State VARCHAR(50),
Country_Region VARCHAR(50),
LastUpdate DATE,
Confirmed INTEGER,
Deaths INTEGER,
Recovered INTEGER);


-- Change the datatype of SerialNo
ALTER TABLE covid_19_data
MODIFY column SerialNo VARCHAR(50);


-- Change the datatype of LastUpdate
ALTER TABLE covid_19_data
MODIFY column LastUpdate DATE;

-- Show the covid_19_data table
SELECT * FROM covid_19_data;

-- Retrieve the total number of records in the data you loaded to the database
-- Answer 513
SELECT COUNT(*) FROM covid_19_data;

-- Retrieve the records for the following observation dates - 1/22/2020,1/27/2020, 1/31/2020

SELECT * FROM covid_19_data
WHERE Observation_Date IN ('2020/01/22','2020/01/27','2020/01/31');

-- Retrieve a summary of all the records. This should include the following information for each country/region:
-- The total number of confirmed cases
-- The total number of deaths
-- The total number of recoveries

SELECT SUM(Confirmed) AS total_confirmed, SUM(Deaths) AS total_deaths, SUM(Recovered) AS total_recovered
FROM covid_19_data;


-- Retrieve the number of confirmed cases, deaths, and recoveries for Mainland China.
SELECT Confirmed, Deaths, Recovered
FROM covid_19_data WHERE Country_Region = 'Mainland China';


-- Retrieve information for the top 5 countries with the highest confirmed cases.
SELECT Country_Region, SUM(Confirmed) AS total_Confirmed
FROM covid_19_data
GROUP BY Country_Region
ORDER BY total_Confirmed DESC
LIMIT 5;


-- Retrieve information for the top 5 countries with the highest death cases specifically for 27th and 31st of January, 2020.
SELECT Country_Region, SUM(Deaths) AS total_Death
FROM covid_19_data
WHERE Observation_Date BETWEEN '2020/01/27' AND '2020/01/31'
GROUP BY Country_Region
ORDER BY total_Death DESC
LIMIT 5;



