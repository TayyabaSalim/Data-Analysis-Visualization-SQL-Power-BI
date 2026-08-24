SELECT COUNT(*) AS total_sessions FROM website_sessions;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT ROUND(SUM(price_usd),2) AS total_revenue FROM orders;
SELECT ROUND(SUM(cogs_usd),2) AS total_cost FROM orders;
SELECT  ROUND(SUM(price_usd - cogs_usd),2) AS gross_profit FROM orders;
SELECT ROUND(AVG(price_usd),2) AS average_order_value FROM orders;
SELECT ROUND(AVG(items_purchased),2) AS avg_items FROM orders;

-- KPI 8 — Website Conversion Rate
SELECT
    ROUND(
        COUNT(DISTINCT o.order_id) * 100.0
        / COUNT(DISTINCT ws.website_session_id),
        2
    ) AS conversion_rate
FROM website_sessions ws
LEFT JOIN orders o
ON ws.website_session_id = o.website_session_id;

-- KPI 10 — Revenue Per Customer
SELECT
    ROUND(
        SUM(o.price_usd) /
        COUNT(DISTINCT ws.website_session_id),
        2
    ) AS revenue_per_session
FROM website_sessions ws
LEFT JOIN orders o
ON ws.website_session_id = o.website_session_id;

-- Monthly Revenue Trend
SELECT
    DATE_TRUNC('month', created_at) AS month,
    COUNT(*) AS orders,
    ROUND(SUM(price_usd),2) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Monthly Profit Trend
SELECT
    DATE_TRUNC('month', created_at) AS month,
    ROUND(SUM(price_usd - cogs_usd),2) AS profit
FROM orders
GROUP BY month
ORDER BY month;

-- Monthly Average Order Value
SELECT
    DATE_TRUNC('month', created_at) AS month,
    ROUND(AVG(price_usd),2) AS avg_order_value
FROM orders
GROUP BY month
ORDER BY month;
