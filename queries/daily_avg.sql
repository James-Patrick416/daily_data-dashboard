-- ==========================================================
-- MULTI-CITY WEATHER ANALYSIS
-- Purpose: Compare temperatures across 5 global cities
-- Shows recruiters: GROUP BY, filtering, date functions
-- ==========================================================

SELECT 
    -- City-level aggregation
    city,
    
    -- Temperature statistics
    ROUND(AVG(temperature), 1) AS avg_temp,
    ROUND(MAX(temperature), 1) AS max_temp,
    ROUND(MIN(temperature), 1) AS min_temp,
    
    -- Data completeness
    COUNT(*) AS total_days,
    COUNT(DISTINCT date) AS unique_days,
    
    -- Latest record for freshness check
    MAX(date) AS last_updated
    
FROM data.daily_entries

-- Filter: Only complete data
WHERE temperature IS NOT NULL
  AND city IS NOT NULL
  AND date >= DATE('now', '-30 days')  -- Last 30 days only

-- Group by city for comparison
GROUP BY city

-- Sort by hottest average first
ORDER BY avg_temp DESC;
