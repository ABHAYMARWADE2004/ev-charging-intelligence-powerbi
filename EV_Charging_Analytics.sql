-- =========================================
-- EV CHARGING INTELLIGENCE ANALYTICS
-- SQL DATA ANALYSIS PROJECT
-- =========================================
USE ev_charging_db;

-- Query 1: Overall Charging Summary

SELECT
    COUNT(*) AS Total_Sessions,
    ROUND(SUM(Energy_kWh), 2) AS Total_Energy_kWh,
    ROUND(AVG(Energy_kWh), 2) AS Avg_Energy_Per_Session,
    ROUND(AVG(Charging_Duration_Min), 2) AS Avg_Duration_Minutes
FROM ev_charging;

-- Query 2: Busiest Charging Hours

SELECT
    Charging_Hour,
    COUNT(*) AS Total_Sessions
FROM ev_charging
GROUP BY Charging_Hour
ORDER BY Total_Sessions DESC
LIMIT 5;

-- Query 3: Top 5 Charging Points by Sessions

SELECT
    Charging_Point_Number,
    COUNT(*) AS Total_Sessions,
    ROUND(SUM(Energy_kWh), 2) AS Total_Energy_kWh
FROM ev_charging
GROUP BY Charging_Point_Number
ORDER BY Total_Sessions DESC
LIMIT 5;

-- Query 4: Monthly Energy Consumption

SELECT
    Month,
    COUNT(*) AS Total_Sessions,
    ROUND(SUM(Energy_kWh), 2) AS Total_Energy_kWh
FROM ev_charging
GROUP BY Month
ORDER BY Total_Energy_kWh DESC;

-- Query 5: Charging Duration Analysis

SELECT
    ROUND(AVG(Charging_Duration_Min), 2) AS Avg_Duration_Min,
    ROUND(MIN(Charging_Duration_Min), 2) AS Min_Duration_Min,
    ROUND(MAX(Charging_Duration_Min), 2) AS Max_Duration_Min
FROM ev_charging;

-- Query 6: Charging Point Energy Performance

SELECT
    Charging_Point_Number,
    ROUND(SUM(Energy_kWh), 2) AS Total_Energy_kWh,
    ROUND(AVG(Energy_kWh), 2) AS Avg_Energy_kWh
FROM ev_charging
GROUP BY Charging_Point_Number
ORDER BY Total_Energy_kWh DESC
LIMIT 5;

-- Query 7: Energy Consumption Categories

SELECT
    CASE
        WHEN Energy_kWh < 10 THEN 'Low Energy'
        WHEN Energy_kWh < 30 THEN 'Medium Energy'
        ELSE 'High Energy'
    END AS Energy_Category,
    COUNT(*) AS Total_Sessions,
    ROUND(SUM(Energy_kWh), 2) AS Total_Energy_kWh
FROM ev_charging
GROUP BY Energy_Category
ORDER BY Total_Sessions DESC;

-- Query 8: Monthly Sessions and Average Energy

SELECT
    Month,
    COUNT(*) AS Total_Sessions,
    ROUND(AVG(Energy_kWh), 2) AS Avg_Energy_kWh,
    ROUND(SUM(Energy_kWh), 2) AS Total_Energy_kWh
FROM ev_charging
GROUP BY Month
ORDER BY Month;

-- Query 9: Charging Point Performance Summary

SELECT
    Charging_Point_Number,
    COUNT(*) AS Total_Sessions,
    ROUND(SUM(Energy_kWh), 2) AS Total_Energy_kWh,
    ROUND(AVG(Charging_Duration_Min), 2) AS Avg_Duration_Min
FROM ev_charging
GROUP BY Charging_Point_Number
ORDER BY Total_Energy_kWh DESC;

