-- ==========================================================
-- TOP CUSTOMER PER COUNTRY BY REVENUE
-- Purpose: Rank customers within each country by spending
-- Shows recruiters: ROW_NUMBER, PARTITION BY, CTEs
-- ==========================================================

WITH customer_spending AS (
    -- Step 1: Calculate total spend per customer
    SELECT 
        c.customer_id,
        c.customer_name,
        c.country,
        ROUND(SUM(o.total_amount), 2) AS total_spent,
        COUNT(o.order_id) AS order_count
    FROM tables.customers c
    JOIN tables.orders o ON c.customer_id = o.customer_id
    WHERE o.status = 'Delivered'
    GROUP BY c.customer_id, c.customer_name, c.country
),

ranked_customers AS (
    -- Step 2: Rank customers within each country
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY country 
            ORDER BY total_spent DESC
        ) AS rank_in_country
    FROM customer_spending
)

-- Step 3: Show only top customer per country
SELECT 
    country,
    customer_name,
    total_spent,
    order_count,
    rank_in_country
FROM ranked_customers
WHERE rank_in_country = 1
ORDER BY total_spent DESC;
