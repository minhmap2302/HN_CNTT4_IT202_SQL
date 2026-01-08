DROP DATABASE IF EXISTS online_sales_srs;
CREATE DATABASE online_sales_srs;
USE online_sales_srs;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL UNIQUE,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending','Completed','Cancel') DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_name, email, phone) VALUES
('Nguyen Van A', 'a@gmail.com', '0900000001'),
('Tran Thi B', 'b@gmail.com', '0900000002'),
('Le Van C', 'c@gmail.com', '0900000003'),
('Pham Thi D', 'd@gmail.com', '0900000004'),
('Hoang Van E', 'e@gmail.com', '0900000005'),
('Vo Thi F', 'f@gmail.com', '0900000006'),
('Dang Van G', 'g@gmail.com', '0900000007');

INSERT INTO categories (category_name) VALUES
('Dien thoai'),
('Laptop'),
('Phu kien');

INSERT INTO products (product_name, price, category_id) VALUES
('iPhone 15', 25000000, 1),
('Samsung S23', 20000000, 1),
('MacBook Air M2', 30000000, 2),
('Dell XPS 13', 28000000, 2),
('Tai nghe Bluetooth', 1500000, 3),
('Chuot khong day', 800000, 3);

INSERT INTO orders (customer_id, status) VALUES
(1, 'Completed'),
(1, 'Pending'),
(2, 'Completed'),
(3, 'Cancel'),
(4, 'Completed'),
(5, 'Pending');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 5, 2),
(2, 3, 1),
(3, 2, 1),
(3, 6, 1),
(4, 4, 1),
(5, 1, 1),
(6, 5, 3);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

SELECT COUNT(*) AS total_orders FROM orders;

SELECT SUM(quantity) AS total_products_sold
FROM order_items;

SELECT *
FROM products
WHERE price = (SELECT MAX(price) FROM products);

SELECT *
FROM products
WHERE price = (SELECT MIN(price) FROM products);

SELECT AVG(price) AS avg_price FROM products;

SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS temp
);

SELECT *
FROM customers
WHERE customer_id IN (
    SELECT DISTINCT customer_id FROM orders
);
