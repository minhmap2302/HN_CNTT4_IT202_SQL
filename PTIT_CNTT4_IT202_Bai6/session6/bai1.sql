create database if not exists bai1;
use bai1;
drop table if exists order_items;
drop table if exists orders;
drop table if exists customers;
drop table if exists products;
CREATE TABLE customers (
    customer_id   INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email         VARCHAR(100),
    city          VARCHAR(50)
);
CREATE TABLE products (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(100),
    price        DECIMAL(12,2),
    category     VARCHAR(50)
);
CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT,
    order_date  DATE,
    status      VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id      INT,
    product_id    INT,
    quantity      INT,
    unit_price    DECIMAL(12,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);



INSERT INTO customers VALUES
(1, 'Nguyen Van An',  'an@gmail.com',   'Ha Noi'),
(2, 'Tran Thi Binh',  'binh@gmail.com', 'Da Nang'),
(3, 'Le Van Cuong',   'cuong@gmail.com','Ho Chi Minh'),
(4, 'Pham Thi Dao',   'dao@gmail.com',  'Ha Noi'),
(5, 'Hoang Van Em',   'em@gmail.com',   'Can Tho');



INSERT INTO products VALUES
(1, 'Laptop Dell',          20000000, 'Electronics'),
(2, 'iPhone 15',            25000000, 'Electronics'),
(3, 'Tai nghe Bluetooth',    1500000, 'Accessories'),
(4, 'Chuột không dây',        500000, 'Accessories'),
(5, 'Bàn phím cơ',           2000000, 'Accessories');




INSERT INTO orders VALUES
(101, 1, '2025-01-05', 'Completed'),
(102, 2, '2025-01-06', 'Completed'),
(103, 3, '2025-01-07', 'Completed'),
(104, 1, '2025-01-08', 'Completed'),
(105, 4, '2025-01-09', 'Completed'),
(106, 5, '2025-01-10', 'Completed'),
(107, 2, '2025-01-11', 'Completed'),
(108, 3, '2025-01-12', 'Completed');


INSERT INTO order_items VALUES

(1, 101, 1, 1, 20000000),
(2, 101, 3, 2, 1500000),


(3, 102, 2, 1, 25000000),
(4, 102, 4, 1, 500000),


(5, 103, 5, 2, 2000000),
(6, 103, 3, 1, 1500000),


(7, 104, 1, 1, 20000000),
(8, 104, 5, 1, 2000000),


(9, 105, 4, 3, 500000),


(10, 106, 3, 5, 1500000),


(11, 107, 2, 1, 25000000),
(12, 107, 3, 2, 1500000),


(13, 108, 1, 1, 20000000),
(14, 108, 4, 2, 500000);

select o.order_id,c.customer_name,GROUP_CONCAT(
    CONCAT(p.product_name, ' x', oi.quantity)
    SEPARATOR ', '
) AS danh_sach_san_pham from orders o
    inner join customers c
on o.customer_id=c.customer_id
    inner join order_items oi
        on oi.order_id=o.order_id
    inner join products p
     on oi.product_id=p.product_id
group by o.order_id,c.customer_name;
select count(*) as `total` from orders;
select sum(oi.quantity*oi.unit_price) from order_items oi;
select oi.order_id,p.product_name,oi.quantity*oi.unit_price as `total` from order_items oi
inner join products p
on oi.product_id=p.product_id;

SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
HAVING total_spent > 5000000;
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING total_quantity > 100;
SELECT
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING total_orders > 5;
