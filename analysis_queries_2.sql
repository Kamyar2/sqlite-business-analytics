
-- Language: SQL (SQLite Business Diagnostics)
-- Operational Data Diagnostics & SQL Analytics
-- Objective: Identify bottlenecks, calculate KPIs, and aggregate user activity trends.

-- 1. Daily Active Transactions & Revenue Trends
SELECT 
    DATE(transaction_date) AS Tx_Date,
    COUNT(transaction_id) AS Total_Transactions,
    SUM(amount) AS Daily_Volume,
    ROUND(AVG(amount), 2) AS Avg_Ticket_Size
FROM operational_logs
WHERE status = 'SUCCESS'
GROUP BY DATE(transaction_date)
ORDER BY Tx_Date DESC;

-- 2. Diagnostic Query: Identifying System Bottlenecks & High Latency Operations
SELECT 
    module_name,
    COUNT(*) AS Error_Count,
    AVG(processing_time_ms) AS Avg_Latency
FROM system_events
WHERE log_level IN ('WARNING', 'ERROR')
GROUP BY module_name
HAVING Error_Count > 5
ORDER BY Error_Count DESC;

-- 3. Customer Retention & Operational Funnel Analysis
SELECT 
    user_status,
    COUNT(user_id) AS User_Count,
    ROUND((COUNT(user_id) * 100.0 / (SELECT COUNT(*) FROM users)), 2) AS Percentage
FROM users
GROUP BY user_status;

