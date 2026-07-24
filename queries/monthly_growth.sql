-- ==========================================================
-- MONTHLY REVENUE GROWTH TREND
-- Purpose: Track month-over-month revenue growth
-- Shows recruiters: DATE functions, LAG, growth calculations
-- ==========================================================

WITH monthly_revenue AS (
    SELECT 
        strftime('%Y-%m', o.order_date) AS month,
        ROUND(SUM(o.total_amount), 2) AS revenue,
        COUNT(DISTINCT o.customer_id) AS active_customers,
        COUNT(o.order_id) AS total_orders
    FROM tables.orders o
    WHERE o.status = 'Delivered'
    GROUP BY strftime('%Y-%m', o.order_date)
)

SELECT 
    month,
    revenue,
    active_customers,
    total_orders,
    -- Previous month's revenue using LAG
    LAG(revenue, 1) OVER (ORDER BY month) AS previous_month_revenue,
    -- Growth percentage calculation
    ROUND(
        ((revenue - LAG(revenue, 1) OVER (ORDER BY month)) / 
        LAG(revenue, 1) OVER (ORDER BY month)) * 100, 1
    ) AS growth_percent,
    -- Growth label for business users
    CASE 
        WHEN ((revenue - LAG(revenue, 1) OVER (ORDER BY month)) / 
              LAG(revenue, 1) OVER (ORDER BY month)) * 100 > 10 THEN '🚀 High Growth'
        WHEN ((revenue - LAG(revenue, 1) OVER (ORDER BY month)) / 
              LAG(revenue, 1) OVER (ORDER BY month)) * 100 > 0 THEN '📈 Moderate Growth'
        WHEN revenue = LAG(revenue, 1) OVER (ORDER BY month) THEN '➡️ Flat'
        ELSE '📉 Decline'
    END AS growth_status
FROM monthly_revenue
ORDER BY month;
