-- Retail Sales Performance Analysis
-- Example business questions

SELECT sales_channel,
       ROUND(SUM(revenue), 2) AS total_revenue,
       ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY sales_channel
ORDER BY total_revenue DESC;

SELECT strftime('%Y-%m', order_date) AS order_month,
       ROUND(SUM(revenue), 2) AS monthly_revenue,
       ROUND(SUM(profit), 2) AS monthly_profit
FROM orders
GROUP BY strftime('%Y-%m', order_date)
ORDER BY order_month;

SELECT p.category,
       ROUND(SUM(o.revenue), 2) AS revenue,
       ROUND(SUM(o.profit), 2) AS profit,
       ROUND(AVG(o.discount_rate), 3) AS avg_discount
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;
