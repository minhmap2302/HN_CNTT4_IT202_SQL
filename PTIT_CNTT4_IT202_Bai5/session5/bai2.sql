create database if not exists bai2;
use bai2;
drop table if exists customers;
create table customers(
    customer_id int primary key auto_increment,
    full_name varchar(255),
    email varchar(255),
    city varchar(255),
    status enum('active','inactive')
);
INSERT INTO customers (full_name, email, city, status) VALUES
('Nguyễn Văn An', 'an@gmail.com', 'Hà Nội', 'active'),
('Trần Thị Bình', 'binh@gmail.com', 'TP.HCM', 'active'),
('Lê Văn Cường', 'cuong@gmail.com', 'Đà Nẵng', 'inactive'),
('Phạm Thị Dung', 'dung@gmail.com', 'Cần Thơ', 'active'),
('Hoàng Văn Em', 'em@gmail.com', 'Hải Phòng', 'inactive');

select * from customers;
select * from customers
where city='TP.HCM';
select * from customers
where status='active' and city='Hà Nội';
select * from customers
order by full_name asc;
