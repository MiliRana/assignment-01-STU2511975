- Q1: 
SELECT 
    c.customer_name,
    SUM(p.unit_price * oi.quantity) AS total_order_value
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id
WHERE c.customer_city = 'Mumbai'
GROUP BY c.customer_name;


- Q2:
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 3;


- Q3: 
SELECT 
    s.sales_rep_name,
    COUNT(DISTINCT o.customer_id) AS unique_customers_handled
FROM sales_reps s
LEFT JOIN orders o 
    ON s.sales_rep_id = o.sales_rep_id
GROUP BY s.sales_rep_name;


- Q4:
SELECT 
    o.order_id,
    SUM(p.unit_price * oi.quantity) AS total_order_value
FROM orders o
JOIN order_items oi 
    ON o.order_id = oi.order_id
JOIN products p 
    ON oi.product_id = p.product_id
GROUP BY o.order_id
HAVING SUM(p.unit_price * oi.quantity) > 10000
ORDER BY total_order_value DESC;


- Q5: 
SELECT 
    p.product_name
FROM products p
LEFT JOIN order_items oi 
    ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
