-- --------------------------------------------------------
-- Table structure for table `users`
-- --------------------------------------------------------

CREATE TABLE users (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(191) NOT NULL UNIQUE,
    password NVARCHAR(191) NOT NULL,
    is_admin BIT DEFAULT 0,
    email NVARCHAR(191) NOT NULL
);

-- Insert data for table `users`
INSERT INTO users (username, password, is_admin, email) VALUES
('admin', 'admin', 1, 'admins@gmail.com'),
('abc', 'abc', 0, 'test2@gmail.com'),
('abcd', 'abcd', 0, 'test5@gmail.com');

-- --------------------------------------------------------
-- Table structure for table `address_details`
-- --------------------------------------------------------

CREATE TABLE address_details (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    address NVARCHAR(255) NOT NULL,
    city NVARCHAR(100) NOT NULL,
    postal_code NVARCHAR(20) NOT NULL,
    country NVARCHAR(100) NOT NULL
);

-- Insert data for table `address_details`
INSERT INTO address_details (address, city, postal_code, country) VALUES
('123 Main St', 'Sample City', '12345', 'Sample Country'),
('123 Main Stt', 'City', '123456', 'Country'),
('123 Main St', 'City', '123456', 'Country'),
('456 Main St', 'City', '123456', 'Country');

-- --------------------------------------------------------
-- Table structure for table `products`
-- --------------------------------------------------------

CREATE TABLE products (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(191) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    image_url NVARCHAR(255) NOT NULL
);

-- Insert data for table `products`
INSERT INTO products (name, price, image_url) VALUES
('Product 1', 19.99, 'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'),
('Product 2', 29.99, 'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'),
('Product 3', 39.99, 'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'),
('Product 4', 49.99, 'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'),
('Product 5', 59.99, 'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg');

-- --------------------------------------------------------
-- Table structure for table `orders`
-- --------------------------------------------------------

CREATE TABLE orders (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    order_date DATETIME DEFAULT GETDATE(),
    status NVARCHAR(20) DEFAULT 'pending',
    address_details_id INT NOT NULL,
    paid_amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME DEFAULT GETDATE(),
    payment_method NVARCHAR(50) NOT NULL,
    payment_url NVARCHAR(255) NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (address_details_id) REFERENCES address_details(id)
);

-- Insert data for table `orders`
INSERT INTO orders (user_id, order_date, status, address_details_id, paid_amount, payment_date, payment_method, payment_url) VALUES
(1, '2024-12-02 14:34:42', 'delivered', 1, 100.00, '2024-12-02 14:34:42', 'montonio', ''),
(2, '2024-12-02 14:36:11', 'delivered', 2, 99.00, '2024-12-02 14:36:11', 'montonio', ''),
(1, '2024-12-04 15:09:29', 'pending', 3, 100.00, '2024-12-04 15:09:29', 'montonio', NULL),
(1, '2024-12-04 15:18:31', 'pending', 4, 50.00, '2024-12-04 15:18:31', 'montonio', NULL);

-- --------------------------------------------------------
-- Table structure for table `order_items`
-- --------------------------------------------------------

CREATE TABLE order_items (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity SMALLINT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert data for table `order_items`
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(2, 1, 2, 19.99),
(2, 2, 1, 29.99),
(3, 1, 2, 19.99),
(3, 2, 1, 29.99),
(4, 1, 2, 50.00),
(4, 5, 1, 50.00);

-- --------------------------------------------------------
-- Table structure for table `users_log`
-- --------------------------------------------------------

CREATE TABLE users_log (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    old_email NVARCHAR(255),
    new_email NVARCHAR(255),
    changed_by NVARCHAR(255),
    changed_at DATETIME DEFAULT GETDATE()
);

-- Insert data for table `users_log`
INSERT INTO users_log (user_id, old_email, new_email, changed_by, changed_at) VALUES
(1, 'admin@gmail.com', 'admins@gmail.com', 'student@localhost', '2024-12-04 14:11:12'),
(1, 'admins@gmail.com', 'admins@gmail.c', 'student@localhost', '2024-12-04 14:11:18'),
(1, 'admins@gmail.c', 'admins@gmail.com', 'student@localhost', '2024-12-04 14:11:33'),
(1, 'admins@gmail.com', 'admins@gmail.c', 'student@localhost', '2024-12-04 14:13:48'),
(1, 'admins@gmail.c', 'admins@gmail.com', 'student@localhost', '2024-12-04 14:13:57');
