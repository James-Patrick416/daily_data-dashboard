-- ==========================================================
-- CITY TEMPERATURE COMPARISON (Day-over-Day)
-- Purpose: Track which city had the biggest daily swing
-- Shows recruiters: LAG functions, window operations
-- ==========================================================

WITH daily_city AS (
    SELECT 
        date,
        city,
        temperature,
        -- Rank cities by temperature each day
        ROW_NUMBER() OVER (
            PARTITION BY date 
            ORDER BY temperature DESC
        ) AS rank_today
    FROM data.daily_entries
    WHERE date >= DATE('now', '-7 days')
)

SELECT 
    date,
    city,
    temperature,
    rank_today AS hottest_rank,
    CASE 
        WHEN rank_today = 1 THEN '🔥 Hottest'
        WHEN rank_today = 2 THEN '☀️ 2nd'
        WHEN rank_today = 3 THEN '🌤️ 3rd'
        ELSE '❄️ Cooler'
    END AS rank_label
FROM daily_city
ORDER BY date DESC, rank_today ASC;
