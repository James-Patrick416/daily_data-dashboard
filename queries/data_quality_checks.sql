-- ==========================================================
-- DATA QUALITY DASHBOARD
-- Purpose: Check for data issues before analysis
-- Shows recruiters: Quality-first mindset
-- ==========================================================

-- 1. Check for null values
SELECT 'Null check' AS check_type,
    (SELECT COUNT(*) FROM tables.customers WHERE customer_id IS NULL) AS null_customers,
    (SELECT COUNT(*) FROM tables.products WHERE product_id IS NULL) AS null_products,
    (SELECT COUNT(*) FROM tables.orders WHERE order_id IS NULL) AS null_orders;

-- 2. Duplicate checks
SELECT 'Duplicate check' AS check_type,
    (SELECT COUNT(*) - COUNT(DISTINCT customer_id) FROM tables.customers) AS dup_customers,
    (SELECT COUNT(*) - COUNT(DISTINCT product_id) FROM tables.products) AS dup_products,
    (SELECT COUNT(*) - COUNT(DISTINCT order_id) FROM tables.orders) AS dup_orders;

-- 3. Orphan orders (orders with no valid customer)
SELECT 'Orphan check' AS check_type,
    COUNT(*) AS orphan_orders
FROM tables.orders o
LEFT JOIN tables.customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 4. Price consistency check
SELECT 'Price mismatch' AS check_type,
    COUNT(*) AS mismatched_orders
FROM tables.orders o
LEFT JOIN tables.products p ON o.product_id = p.product_id
WHERE o.unit_price != p.price;

-- 5. Data freshness (most recent order date)
SELECT 'Data freshness' AS check_type,
    MAX(order_date) AS latest_order,
    ROUND(CAST(JULIANDAY('2026-07-24') - JULIANDAY(MAX(order_date)) AS REAL), 1) AS days_since_last_order
FROM tables.orders;
