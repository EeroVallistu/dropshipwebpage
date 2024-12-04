/* Keskmise makstud summa  */
SELECT AVG(paid_amount) AS average_paid_amount
FROM orders
WHERE status = 'delivered';

/* Kokku makstud summa viimase kuu jooksul  */
SELECT SUM(paid_amount) AS total_paid_last_month
FROM orders
WHERE payment_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

/* Aktiivsete kasutajate tellimuste arv */
SELECT COUNT(DISTINCT o.id) AS active_user_orders
FROM orders o
JOIN users u ON o.user_id = u.id;

/* Kõige populaarsemad tooted */
SELECT p.name, SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.name
ORDER BY total_quantity_sold DESC
LIMIT 5;

/* Keskmine hind ja toodete arv */
SELECT COUNT(*) AS total_products, AVG(price) AS average_price
FROM products;

/* Kasutajate arv, kellel on alla 100 EUR väärtuses tellimusi */
SELECT COUNT(DISTINCT user_id) AS high_value_customers
FROM orders
WHERE paid_amount < 100;

/* Kõige sagedamini kasutatud maksemeetod */
SELECT payment_method, COUNT(*) AS method_count
FROM orders
GROUP BY payment_method
ORDER BY method_count DESC
LIMIT 1;