create database if not exists bai2;
use bai2;
drop table if exists order_items;
drop table if exists orders;
drop table if exists product;
drop table if exists customers;
create table customers
(
    id    int primary key auto_increment,
    name  varchar(255),
    email varchar(255)
);
create table orders
(
    id           int primary key auto_increment,
    customer_id  int,
    orders_date  date,
    total_amount decimal(10, 3),
    foreign key (customer_id) references customers (id)
);
create table product
(
    id    int primary key auto_increment,
    name  varchar(255),
    price decimal(10, 3)
);
create table order_items
(
    order_id   int,
    product_id int,
    quantity int,
    primary key (order_id, product_id),
    foreign key (order_id) references orders (id),
    foreign key (product_id) references product (id)
);
INSERT INTO customers (name, email)
VALUES ('Nguyễn Văn An', 'an@gmail.com'),
       ('Trần Thị Bình', 'binh@gmail.com'),
       ('Lê Văn Cường', 'cuong@gmail.com'),
       ('Phạm Thị Dung', 'dung@gmail.com'),
       ('Hoàng Văn Em', 'em@gmail.com'),
       ('Đỗ Thị Hoa', 'hoa@gmail.com'),
       ('Vũ Văn Long', 'long@gmail.com');
INSERT INTO orders (customer_id, orders_date, total_amount)
VALUES (1, '2024-01-05', 150.500),
       (2, '2024-01-06', 320.000),
       (1, '2024-01-10', 210.750),
       (3, '2024-01-12', 99.990),
       (4, '2024-01-15', 450.000),
       (5, '2024-01-18', 180.250),
       (2, '2024-01-20', 275.600);
INSERT INTO product (name, price) VALUES
('Laptop Dell', 15000.000),
('Chuột không dây', 350.500),
('Bàn phím cơ', 1250.750),
('Màn hình 24 inch', 4200.000),
('Tai nghe Bluetooth', 890.250),
('USB 64GB', 320.000),
('Ổ cứng SSD 512GB', 2100.900);
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 4, 1),
(3, 2, 3),
(4, 5, 2),
(5, 7, 1);

select * from product
where id in(select o.product_id from order_items o);