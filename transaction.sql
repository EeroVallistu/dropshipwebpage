START TRANSACTION;

/* Lisab uue aadressi */
INSERT INTO address_details (address, city, postal_code, country)
VALUES ('123 Main St', 'City', '123456', 'Country');

/* Salvestab aadressi ID muutujasse */
SET @address_id = LAST_INSERT_ID();

/* Lisab tellimuse */
INSERT INTO orders (user_id, order_date, status, address_details_id, paid_amount, payment_method)
VALUES (1, NOW(), 'pending', @address_id, 100.00, 'montonio');

/* Salvestab tellimuse ID muutujasse */
SET @last_order_id = LAST_INSERT_ID();

/* Lisab tellimuse kaubad tabelisse order_items */
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (@last_order_id, 1, 2, 50.00);

/* sisestatakse andmed kui kõik on korrektne */
COMMIT;

/* toimub rollback kui midagi läks valesti */
ROLLBACK;

/* tellimuse sisestamine ilma aadressita */
START TRANSACTION;

/* Lisab uue tellimuse */
INSERT INTO orders (user_id, order_date, status, paid_amount, payment_method)
VALUES (1, NOW(), 'pending', 100.00, 'montonio');

/* Salvestab tellimuse ID muutujasse */
SET @last_order_id = LAST_INSERT_ID();

/* Lisab tellimuse kaubad tabelisse order_items */
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (@last_order_id, 1, 2, 50.00);

/* sisestatakse andmed kui kõik on korrektne */
COMMIT;

/* toimub rollback kui midagi läks valesti */
ROLLBACK;