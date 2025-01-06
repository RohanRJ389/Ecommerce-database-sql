-- CREATE TABLE Statements for an E-commerce Platform

-- Create User Table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('customer', 'admin') NOT NULL
);

-- Create Product Table
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Create Order Table
CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Create OrderItem Table
CREATE TABLE OrderItem (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);

-- Insert example data into User table
INSERT INTO User (name, email, password, role) VALUES
('John Doe', 'johndoe@example.com', 'password123', 'customer'),
('Jane Smith', 'janesmith@example.com', 'password456', 'customer'),
('Admin User', 'admin@example.com', 'adminpassword', 'admin');

-- Insert example data into Product table
INSERT INTO Product (name, description, price, stock_quantity) VALUES
('Laptop', 'High-performance laptop', 999.99, 50),
('Smartphone', 'Latest model smartphone', 699.99, 100),
('Headphones', 'Noise-cancelling headphones', 149.99, 200);

-- Insert example data into Order table
INSERT INTO `Order` (user_id, total_amount) VALUES
(1, 1149.98),
(2, 699.99);

-- Insert example data into OrderItem table
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 999.99),
(1, 3, 1, 149.99),
(2, 2, 1, 699.99);

-- Sample SELECT queries to verify the data

-- View all users
-- SELECT * FROM User;

-- -- View all products
-- SELECT * FROM Product;

-- -- View all orders
-- SELECT * FROM `Order`;

-- -- View all order items with product details
-- SELECT oi.order_item_id, oi.quantity, oi.price, p.name as product_name, o.order_date, u.name as user_name
-- FROM OrderItem oi
-- JOIN `Order` o ON oi.order_id = o.order_id
-- JOIN Product p ON oi.product_id = p.product_id
-- JOIN User u ON o.user_id = u.user_id;

-- -- View all orders placed by a specific user
-- SELECT o.order_id, o.order_date, o.total_amount
-- FROM `Order` o
-- JOIN User u ON o.user_id = u.user_id
-- WHERE u.name = 'John Doe';
