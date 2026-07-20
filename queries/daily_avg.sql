-- =====================================================
-- DAILY AVERAGE TEMPERATURE PER CITY
-- Purpose: Calculate average temperature for each city
-- Use case: Monitoring city-level climate trends
-- Last updated: 2026-07-20
-- =====================================================

SELECT 
    -- Group by city to get per-location averages
    city,
    
    -- Calculate average temperature (rounded to 1 decimal)
    ROUND(AVG(temperature), 1) AS avg_temp,
    
    -- Count records to validate data completeness
    COUNT(*) AS record_count,
    
    -- Show date range for context
    MIN(date) AS first_record,
    MAX(date) AS last_record
    
FROM data.daily_entries

-- Exclude any null/incomplete rows
WHERE temperature IS NOT NULL
  AND city IS NOT NULL

-- Group by city for aggregation
GROUP BY city

-- Show hottest cities first (recruiter-friendly sorting)
ORDER BY avg_temp DESC;
