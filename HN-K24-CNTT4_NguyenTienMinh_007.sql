create database hackathon;
use hackathon;


create table Category (
    category_id varchar(10) primary key,
    category_name varchar(100) unique,
    descriptions text
);

create table Product (
    product_id varchar(10) primary key,
    product_name varchar(150),
    price decimal(10,2) not null check (price > 0),
    status enum('Available','Out of Stock'),
    category_id varchar(10),
    foreign key (category_id) references Category(category_id)
);

create table Orders (
    order_id int primary key auto_increment,
    order_date datetime,
    total_amount decimal(15,2),
    customer_name varchar(100)
);

create table Order_detail (
    detail_id int primary key auto_increment,
    order_id int,
    product_id varchar(10),
    quantity int,
    subtotal decimal(12,2),
    foreign key (order_id) references Orders(order_id),
    foreign key (product_id) references Product(product_id)
);

insert into Category values
('C01','Coffee','All types of coffee beans and brews'),
('C02','Tea & Fruit','Fresh fruit juices and tea'),
('C03','Bakery','Cakes and pastries');

-- cau 2

insert into Product values
('P001','Espresso',35000,'Available','C01'),
('P002','Matcha Latte',45000,'Available','C02'),
('P003','Tiramisu',55000,'Available','C03'),
('P004','Cold Brew',50000,'Out of Stock','C01'),
('P005','Croissant',30000,'Available','C03');

insert into Orders (order_date,total_amount,customer_name) values
('2025-01-01 08:30:00',80000,'Mr. An'),
('2025-01-01 09:15:00',45000,'Ms. Hoa'),
('2025-01-02 14:00:00',140000,'Mr. Binh'),
('2025-01-03 10:00:00',35000,'Anonymous'),
('2025-01-03 11:20:00',90000,'Ms. Lan');

insert into Order_detail (order_id,product_id,quantity,subtotal) values
(1,'P001',1,35000),
(1,'P002',1,45000),
(3,'P002',2,110000),
(3,'P001',1,30000),
(5,'P002',2,90000);

-- update & delete
-- câu 3
update Product set status = 'Available' where product_name = 'Cold Brew';

-- câu 4
update Product set price = price * 1.1 where category_id = 'C03';

-- câu 5
delete from Order_detail where quantity <= 0;

-- câu 6
select product_id, product_name, price from Product where price >= 40000 and status = 'Available';

-- câu 7
select order_id, order_date, customer_name from Orders where customer_name like 'M%';

-- câu 8
select product_name, price from Product order by price desc;

-- câu 9
select * from Orders order by order_date desc limit 3;

-- câu 10
select * from Product limit 3 offset 2;


-- truy vấn nâng cao
-- câu 11
select p.product_name, p.price, c.category_name
from Product p
join Category c on p.category_id = c.category_id;

-- câu 12
select c.category_name, p.product_name
from Category c
left join Product p on c.category_id = p.category_id;

-- câu 13
select date(order_date) as order_day,
       sum(total_amount) as total_revenue
from Orders
group by date(order_date);

-- câu 14
select order_id
from Order_detail


-- câu 15
select *
from Product
where price > (select avg(price) from Product);

-- câu 16
select distinct o.customer_name
from Orders o
join Order_detail od on o.order_id = od.order_id
join Product p on od.product_id = p.product_id
where p.product_name = 'Matcha Latte';

-- câu 17
select o.order_id, o.order_date, p.product_name, od.quantity, od.subtotal
from Orders o
join Order_detail od on o.order_id = od.order_id
join Product p on od.product_id = p.product_id;
