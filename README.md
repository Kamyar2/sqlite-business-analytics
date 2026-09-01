

# Operational SQL Diagnostics & Business Analytics

## Overview
A suite of analytical SQL scripts and diagnostic queries built for operational log environments. Designed to track transactional revenue metrics, pinpoint system performance bottlenecks, and audit retention funnels in SQLite.

## Business Value & Insights
* **Performance Diagnostics:** Pinpoints high-latency modules and system error trends to prevent failure points.
* **Revenue & Volume Tracking:** Aggregates daily transactional volume, success rates, and average ticket sizes.
* **Funnel Efficiency:** Measures conversion distributions across operational workflows.

## Tech Stack
* **Database & Dialect:** SQLite
* **Tools:** DB Browser for SQLite, DBeaver
* **Core Concepts:** Data Aggregation (`GROUP BY`, `HAVING`), Latency Profiling, Status Funnels

---

## Featured Query Scenarios & Sample Outputs

### 1. Revenue & Transaction Volume Trends
**Business Context:** Evaluate daily successful transactions and average ticket size to spot financial anomalies.

```sql
SELECT 
    DATE(transaction_date) AS Tx_Date,
    COUNT(transaction_id) AS Total_Transactions,
    SUM(amount) AS Daily_Volume,
    ROUND(AVG(amount), 2) AS Avg_Ticket_Size
FROM operational_logs
WHERE status = 'SUCCESS'
GROUP BY DATE(transaction_date)
ORDER BY Tx_Date DESC;

```

**Sample Output:**

| Tx_Date | Total_Transactions | Daily_Volume | Avg_Ticket_Size |
| --- | --- | --- | --- |
| 2026-08-31 | 145 | $12,325.00 | $85.00 |
| 2026-08-30 | 112 | $9,856.00 | $88.00 |

### 2. System Bottleneck Diagnostics

**Business Context:** Isolate modules with abnormal error rates and processing latency exceeding operational thresholds.

```sql
SELECT 
    module_name,
    COUNT(*) AS Error_Count,
    ROUND(AVG(processing_time_ms), 2) AS Avg_Latency_ms
FROM system_events
WHERE log_level IN ('WARNING', 'ERROR')
GROUP BY module_name
HAVING Error_Count > 5
ORDER BY Error_Count DESC;

```

**Sample Output:**

| module_name | Error_Count | Avg_Latency_ms |
| --- | --- | --- |
| PaymentGateway_API | 24 | 1420.50 |
| UserAuth_Service | 9 | 850.12 |

---

## Repository Structure

* `analysis_queries.sql`: Core diagnostic and reporting queries.
* `.gitattributes`: Repository language statistics override configuration.


