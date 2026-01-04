create database if not exists bai6;
use bai6;
drop table if exists product;
create table product(
    product_id int primary key auto_increment,
    product_name varchar(255) unique,
    stock int,
    status enum('active','inactive'),
    price decimal(10,2),
    sold_quantity int
);
INSERT INTO product (product_name, stock, status, price, sold_quantity) VALUES
('Laptop Dell Inspiron', 50, 'active', 15000000, 120),
('Laptop HP Pavilion', 40, 'active', 14500000, 95),
('Laptop Asus VivoBook', 60, 'active', 13500000, 150),
('MacBook Air M1', 30, 'active', 21000000, 200),
('Chuột Logitech M331', 200, 'active', 450000, 320),
('Bàn phím Logitech K120', 150, 'active', 350000, 280),
('Tai nghe Sony WH-1000XM4', 25, 'active', 6500000, 180),
('Tai nghe AirPods Pro', 35, 'active', 6200000, 210),
('Màn hình LG 24 inch', 45, 'active', 3200000, 160),
('Màn hình Samsung 27 inch', 40, 'active', 4800000, 140),
('Ổ cứng SSD Samsung 1TB', 70, 'active', 2900000, 260),
('Ổ cứng HDD WD 2TB', 80, 'active', 2100000, 190),
('USB Kingston 64GB', 300, 'active', 250000, 400),
('USB Sandisk 128GB', 250, 'active', 450000, 360),
('Router TP-Link Archer C6', 90, 'active', 1200000, 175),
('Router Asus RT-AX55', 60, 'active', 2800000, 155),
('Loa Bluetooth JBL Flip 5', 70, 'active', 1900000, 220),
('Webcam Logitech C920', 55, 'active', 2300000, 165),
('Balo laptop Xiaomi', 100, 'active', 550000, 240),
('Đế tản nhiệt laptop', 120, 'inactive', 650000, 130);
select * from product
where status='active' and price between 1000000 and 3000000
order by price asc
limit 10 offset 0;
select * from product
where status='active' and price between 1000000 and 3000000
order by price asc
limit 10 offset 10;
