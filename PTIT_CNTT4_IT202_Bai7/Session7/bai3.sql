create database if not exists bai4;
use bai4;
drop table if exists orders;
create table orders(
    id int primary key auto_increment,
    customer_id int,
    orders_date date,
    total_amount decimal(10,3)
);
INSERT INTO orders (customer_id, orders_date, total_amount) VALUES
(1, '2024-01-05', 150.500),
(2, '2024-01-06', 320.000),
(1, '2024-01-10', 210.750),
(3, '2024-01-12', 99.990),
(4, '2024-01-15', 450.000),
(5, '2024-01-18', 180.250),
(2, '2024-01-20', 275.600);
SELECT *
FROM orders
WHERE total_amount >= (
    SELECT AVG(total_amount)
    FROM orders
);
