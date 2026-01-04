create database if not exists bai1;
use bai1;
drop table if exists product;
create table product(
    product_id int primary key auto_increment,
    product_name varchar(255) unique,
    stock int,
    status enum('active','inactive'),
    price decimal(10,2)
);
INSERT INTO product (product_name, price, stock, status) VALUES
('Laptop Dell', 15000000.00, 10, 'active'),
('Chuột Logitech', 350000.00, 50, 'active'),
('Bàn phím cơ', 1200000.00, 20, 'inactive'),
('Màn hình Samsung', 4200000.00, 15, 'active'),
('Tai nghe Sony', 1800000.00, 0, 'inactive');
select * from product
where status='active' and price>=1000000
order by price asc;
