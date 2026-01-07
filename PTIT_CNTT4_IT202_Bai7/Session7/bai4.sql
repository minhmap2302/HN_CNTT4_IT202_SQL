create database if not exists bai3;
use bai3;
drop table if exists orders;
drop table if exists customers;
create table customers(
    id int primary key auto_increment,
    name varchar(255),
    email varchar(255)
);
create table orders(
    id int primary key auto_increment,
    customer_id int,
    orders_date date,
    total_amount decimal(10,3),
    foreign key (customer_id) references customers(id)
);
INSERT INTO customers (name, email) VALUES
('Nguyễn Văn An', 'an@gmail.com'),
('Trần Thị Bình', 'binh@gmail.com'),
('Lê Văn Cường', 'cuong@gmail.com'),
('Phạm Thị Dung', 'dung@gmail.com'),
('Hoàng Văn Em', 'em@gmail.com'),
('Đỗ Thị Hoa', 'hoa@gmail.com'),
('Vũ Văn Long', 'long@gmail.com');

INSERT INTO orders (customer_id, orders_date, total_amount) VALUES
(1, '2024-01-05', 150.500),
(2, '2024-01-06', 320.000),
(1, '2024-01-10', 210.750),
(3, '2024-01-12', 99.990),
(4, '2024-01-15', 450.000),
(5, '2024-01-18', 180.250),
(2, '2024-01-20', 275.600);
SELECT
    c.name AS customer_name,
    (
        SELECT COUNT(*)
        FROM orders o
        WHERE o.customer_id = c.id
    ) AS order_count
FROM customers c;
