create database if not exists bai3;
use bai3;
drop table if exists orders;
create table orders(
    order_id int primary key auto_increment,
    customer_id int,
    total_amount decimal(10,2),
    order_date date,
    status enum('completed','pending','cancelled')
);
INSERT INTO orders (customer_id, total_amount, order_date, status) VALUES
(1, 1200000,  '2024-09-20', 'completed'),
(2, 3500000,  '2024-09-22', 'pending'),
(3, 7800000,  '2024-09-25', 'completed'),
(4, 15000000, '2024-09-28', 'completed'),
(2, 4200000,  '2024-10-01', 'cancelled'),
(5, 9800000,  '2024-10-02', 'completed'),
(1, 2600000,  '2024-10-03', 'pending'),
(3, 5400000,  '2024-10-04', 'completed'),
(4, 890000,   '2024-10-05', 'pending'),
(5, 11200000, '2024-10-06', 'completed'),
(2, 6700000,  '2024-10-07', 'completed'),
(1, 4300000,  '2024-10-08', 'cancelled');
select * from orders
where status='completed';
select * from orders
where total_amount>5000000;
select * from orders
order by order_date desc
limit 5;
select * from orders
where status='completed'
order by total_amount desc;