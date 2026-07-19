--daily average temperature per city--
SELECT
    city,
    AVG(temperature) as avg_temp,
    COUNT(*) as record_count
FRON data.daily_entries
GROUP BY city
ORDER BY avg_temp DESC;
