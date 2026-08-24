-- 1. Check for Duplicate Records
SELECT product_id, COUNT(*) AS duplicate_count FROM products GROUP BY product_id HAVING COUNT(*) > 1;
SELECT order_id, COUNT(*) AS duplicate_count FROM orders GROUP BY order_id HAVING COUNT(*) > 1;
SELECT website_session_id, COUNT(*) AS duplicate_count FROM website_sessions GROUP BY website_session_id HAVING COUNT(*) > 1;
SELECT order_item_id, COUNT(*) AS duplicate_count FROM order_items GROUP BY order_item_id HAVING COUNT(*) > 1;

-- 2. Check for Missing Values
SELECT COUNT(*) AS missing_sessions FROM orders WHERE website_session_id IS NULL;
SELECT COUNT(*) AS missing_users FROM orders WHERE user_id IS NULL;
SELECT COUNT(*) AS missing_price FROM orders WHERE price_usd IS NULL;
SELECT COUNT(*) AS missing_user FROM website_sessions WHERE user_id IS NULL;
SELECT * FROM products WHERE product_name IS NULL;

-- 3. Check Invalid Values
SELECT * FROM orders WHERE price_usd < 0;
SELECT * FROM orders WHERE cogs_usd > price_usd;
SELECT * FROM orders WHERE items_purchased <= 0;

-- 4. Verify Relationships
SELECT COUNT(*) FROM orders o LEFT JOIN website_sessions s ON o.website_session_id = s.website_session_id WHERE s.website_session_id IS NULL;
SELECT COUNT(*) FROM order_items oi LEFT JOIN orders o ON oi.order_id = o.order_id WHERE o.order_id IS NULL;
SELECT COUNT(*) FROM order_item_refunds r LEFT JOIN order_items oi ON r.order_item_id = oi.order_item_id WHERE oi.order_item_id IS NULL;

-- 5. Explore the Data
SELECT * FROM products;
SELECT product_id, AVG(price_usd) AS avg_price FROM order_items GROUP BY product_id ORDER BY avg_price DESC;
SELECT items_purchased, COUNT(*) AS total_orders FROM orders GROUP BY items_purchased ORDER BY items_purchased;
SELECT MIN(price_usd) AS min_order, MAX(price_usd) AS max_order, AVG(price_usd) AS avg_order FROM orders;

-- 6. Understand Website Traffic
SELECT utm_source, COUNT(*) AS sessions FROM website_sessions GROUP BY utm_source ORDER BY sessions DESC;
SELECT utm_campaign, COUNT(*) AS sessions FROM website_sessions GROUP BY utm_campaign ORDER BY sessions DESC;
SELECT device_type, COUNT(*) AS sessions FROM website_sessions GROUP BY device_type ORDER BY sessions DESC;
SELECT http_referer, COUNT(*) AS sessions FROM website_sessions GROUP BY http_referer ORDER BY sessions DESC;
SELECT DATE_TRUNC('month', created_at) AS month, COUNT(*) AS sessions FROM website_sessions GROUP BY month ORDER BY month;
SELECT DATE_TRUNC('month', created_at) AS month, COUNT(*) AS orders, SUM(price_usd) AS revenue FROM orders GROUP BY month ORDER BY month;