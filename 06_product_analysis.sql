-- Best Selling Products
SELECT
    p.product_name,
    COUNT(oi.order_item_id) AS items_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY items_sold DESC;

-- Revenue by Product
SELECT
    p.product_name,
    ROUND(SUM(oi.price_usd),2) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY revenue DESC;

-- Profit by Product
SELECT
    p.product_name,
    ROUND(SUM(oi.price_usd - oi.cogs_usd),2) AS profit
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY profit DESC;

-- Refund Count by Product
SELECT
    p.product_name,
    COUNT(r.order_item_refund_id) AS refunds
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
LEFT JOIN order_item_refunds r
    ON oi.order_item_id = r.order_item_id
GROUP BY p.product_name
ORDER BY refunds DESC;

-- Refund Rate by Product
SELECT
    p.product_name,
    COUNT(r.order_item_refund_id) AS refunds,
    COUNT(oi.order_item_id) AS items_sold,
    ROUND(
        COUNT(r.order_item_refund_id) * 100.0 /
        COUNT(oi.order_item_id),
        2
    ) AS refund_rate
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
LEFT JOIN order_item_refunds r
    ON oi.order_item_id = r.order_item_id
GROUP BY p.product_name
ORDER BY refund_rate DESC;

-- Average Selling Price
SELECT
    p.product_name,
    ROUND(AVG(oi.price_usd),2) AS avg_price
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY avg_price DESC;

-- Revenue Ranking
WITH product_revenue AS (
    SELECT
        p.product_name,
        SUM(oi.price_usd) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_name
)

SELECT
    product_name,
    ROUND(revenue,2) AS revenue,
    DENSE_RANK() OVER(
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM product_revenue;

-- Profit Ranking
WITH product_profit AS (
    SELECT
        p.product_name,
        SUM(oi.price_usd - oi.cogs_usd) AS profit
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    GROUP BY p.product_name
)

SELECT
    product_name,
    ROUND(profit,2) AS profit,
    DENSE_RANK() OVER(
        ORDER BY profit DESC
    ) AS profit_rank
FROM product_profit;


-- Monthly Product Revenue
SELECT
    DATE_TRUNC('month', o.created_at) AS month,
    p.product_name,
    ROUND(SUM(oi.price_usd),2) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    month,
    p.product_name
ORDER BY
    month,
    revenue DESC;

    -- Average Order Value by Product
SELECT
    p.product_name,
    ROUND(AVG(o.price_usd),2) AS avg_order_value
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
GROUP BY p.product_name
ORDER BY avg_order_value DESC;