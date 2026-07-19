-- Weekly temperature trend analysis
SELECT 
    strftime('%W', date) as week_number,
    city,
    ROUND(AVG(temperature), 1) as avg_temp,
    ROUND(AVG(humidity), 1) as avg_humidity,
    COUNT(*) as days_recorded
FROM data.daily_entries
GROUP BY week_number, city
ORDER BY week_number DESC, avg_temp DESC;
