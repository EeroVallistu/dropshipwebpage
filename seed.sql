INSERT INTO users (username, password, is_admin, email) VALUES
('john_doe', 'password123', 0, 'john.doe@example.com'),
('admin', 'admin', 1, 'admin@example.com'),
('jane_doe', 'mypassword', 0, 'jane.doe@example.com');

-- Insert data into `products` table
INSERT INTO products (name, price, image_url) VALUES
('Product 1', 19.99, 'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'),
('Product 2', 29.99, 'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'),
('Product 3', 39.99, 'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg');


-- Insert a new address into the address_details table
INSERT INTO address_details (address, city, postal_code, country) VALUES
('123 Main St', 'City', '123456', 'Country'),
('456 Oak Avenue', 'Shelbyville', '67890', 'USA'),
('789 Pine Lane', 'Capital City', '11223', 'USA');

-- Get the last inserted address ID
SET @address_id = LAST_INSERT_ID();

-- Insert a new order using the new address ID
INSERT INTO orders (user_id, order_date, status, address_details_id, paid_amount, payment_date, payment_method, payment_url) VALUES
(1, '2024-12-01 10:00:00', 'pending', 1, 50.00, '2024-12-01 10:15:00', 'montonio', ''),
(2, '2024-12-02 12:00:00', 'shipped', 2, 75.00, '2024-12-02 12:30:00', 'montonio', ''),
(3, '2024-12-03 14:00:00', 'delivered', 3, 100.00, '2024-12-03 14:45:00', 'montonio', '');



-- Get the last inserted order ID
SET @order_id = LAST_INSERT_ID();

-- Insert items into the order_items table
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 19.99),
(1, 2, 1, 29.99),
(2, 2, 3, 29.99),
(3, 3, 1, 39.99),
(3, 1, 2, 19.99);