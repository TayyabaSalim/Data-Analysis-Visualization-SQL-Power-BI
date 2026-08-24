-- Total Website Sessions
SELECT COUNT(*) AS total_sessions FROM website_sessions;

-- Monthly Website Sessions
SELECT
    DATE_TRUNC('month', created_at) AS month,
    COUNT(*) AS total_sessions
FROM website_sessions
GROUP BY month
ORDER BY month;

-- Sessions by Device
SELECT
    device_type,
    COUNT(*) AS total_sessions
FROM website_sessions
GROUP BY device_type
ORDER BY total_sessions DESC;

-- Top Landing Pages
WITH first_page AS (
    SELECT
        website_session_id,
        MIN(website_pageview_id) AS first_pageview
    FROM website_pageviews
    GROUP BY website_session_id
)

SELECT
    wp.pageview_url,
    COUNT(*) AS landing_sessions
FROM first_page fp
JOIN website_pageviews wp
    ON fp.first_pageview = wp.website_pageview_id
GROUP BY wp.pageview_url
ORDER BY landing_sessions DESC;

-- Most Viewed Pages
SELECT
    pageview_url,
    COUNT(*) AS total_pageviews
FROM website_pageviews
GROUP BY pageview_url
ORDER BY total_pageviews DESC;

-- Average Pages Per Session
SELECT
    ROUND(AVG(page_count),2) AS avg_pages_per_session
FROM (
    SELECT
        website_session_id,
        COUNT(*) AS page_count
    FROM website_pageviews
    GROUP BY website_session_id
);

-- Bounce Rate
SELECT
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(DISTINCT website_session_id) FROM website_sessions),
        2
    ) AS bounce_rate
FROM (
    SELECT
        website_session_id
    FROM website_pageviews
    GROUP BY website_session_id
    HAVING COUNT(*) = 1
);

-- Orders by Device
SELECT
    ws.device_type,
    COUNT(o.order_id) AS total_orders
FROM website_sessions ws
LEFT JOIN orders o
    ON ws.website_session_id = o.website_session_id
GROUP BY ws.device_type
ORDER BY total_orders DESC;


-- Conversion Rate by Device
SELECT
    ws.device_type,
    ROUND(
        COUNT(DISTINCT o.order_id) * 100.0 /
        COUNT(DISTINCT ws.website_session_id),
        2
    ) AS conversion_rate
FROM website_sessions ws
LEFT JOIN orders o
    ON ws.website_session_id = o.website_session_id
GROUP BY ws.device_type;


-- Best Landing Pages
WITH first_page AS (
    SELECT
        website_session_id,
        MIN(website_pageview_id) AS first_pageview
    FROM website_pageviews
    GROUP BY website_session_id
)

SELECT
    wp.pageview_url,
    COUNT(o.order_id) AS total_orders
FROM first_page fp
JOIN website_pageviews wp
    ON fp.first_pageview = wp.website_pageview_id
LEFT JOIN orders o
    ON fp.website_session_id = o.website_session_id
GROUP BY wp.pageview_url
ORDER BY total_orders DESC;

-- Rank Pages by Views
SELECT
    pageview_url,
    COUNT(*) AS total_pageviews,
    DENSE_RANK() OVER (
        ORDER BY COUNT(*) DESC
    ) AS page_rank
FROM website_pageviews
GROUP BY pageview_url;

