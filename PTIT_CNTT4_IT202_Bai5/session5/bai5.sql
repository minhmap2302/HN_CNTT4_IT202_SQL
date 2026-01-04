create database if not exists bai5;
use bai5;
drop table if exists orders;
create table orders(
    order_id int primary key auto_increment,
    customer_id int,
    total_amount decimal(10,2),
    order_date date,
    status enum('completed','pending','cancelled')
);
INSERT INTO orders (customer_id, total_amount, order_date, status) VALUES
(1, 1200000,  '2024-09-20', 'cancelled'),
(2, 3500000,  '2024-09-22', 'cancelled'),
(3, 7800000,  '2024-09-25', 'completed'),
(4, 15000000, '2024-09-28', 'cancelled'),
(2, 4200000,  '2024-10-01', 'cancelled'),
(5, 9800000,  '2024-10-02', 'completed'),
(1, 2600000,  '2024-10-03', 'cancelled'),
(3, 5400000,  '2024-10-04', 'pending'),
(4, 890000,   '2024-10-05', 'cancelled'),
(5, 11200000, '2024-10-06', 'completed'),
(2, 6700000,  '2024-10-07', 'cancelled'),
(1, 4300000,  '2024-10-08', 'cancelled'),
(3, 3100000,  '2024-10-09', 'pending'),
(4, 8600000,  '2024-10-10', 'cancelled'),
(5, 5200000,  '2024-10-11', 'cancelled');
select * from orders
where status='cancelled'
order by order_date desc
limit 5 offset 0;
select * from orders
where status='cancelled'
order by order_date desc
limit 5 offset 5;
select * from orders
where status='cancelled'
order by order_date desc
limit 5 offset 10;