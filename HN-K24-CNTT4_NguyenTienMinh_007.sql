create database hackathon;
use hackathon;
create table Category (
	category_id	VARCHAR(10) primary key,
	category_name VARCHAR(100) unique,
	descriptions TEXT
);

create table Product (
	product_id VARCHAR(10) primary key,
	product_name VARCHAR(150),
	price DECIMAL(10, 2) not null check (price > 0),
	status enum('available','Out of Stock'),
	category_id	VARCHAR(10),
	foreign key (category_id) references Category (category_id)
);

create table Orders (
	order_id  INT primary key auto_increment,
	order_date DATETIME,
	total_amount DECIMAL(15, 2),
	customer_name VARCHAR(100) 
);

create table Order_detail (
	detail_id	INT primary key auto_increment,
	order_id	INT,
	product_id	VARCHAR(10),
	quantity	INT,
	subtotal	DECIMAL(12, 2)
);

insert into Category (category_id,category_name,descriptions) values
('C01', 'Coffee', 'All types of coffee beans and brews'),
('C02', 'Tea & Fruit', 'Fresh fruit juices and tea'),
('C03', 'Bakery', 'Cakes and pastries');

insert into Product (product_id, product_name, price, status, category_id) values
('P001','Espresso',35000.00,'Available','C01'),
('P002','Matcha Latte',45000.00,'Available','C02'),
('P003','Tiramisu',55000.00,'Available','C03'),
('P004','Cold Brew',50000.00,'Out of Stock','C04'),
('P005','Croissant',30000.00,'Available','C05');

insert into Orders (order_id, order_date, total_amount, customer_name) values 
(1, '2025-01-01 08:30:00',80000.00,'Mr. An'),
('2', '2025-01-01 09:15:00','45000.00','Ms. Hoa'),
('3', '2025-01-02 14:00:00','140000.00','CompletedMr. Binh'),
('4', '2025-01-03 10:00:00','35000.00','Anonymous'),
('5', '2025-01-03 11:20:00','90000.00','Ms. Lan');

insert into Order_detail (detail_id, order_id, product_id, quantity, subtotal) values
(1,1,1,2,35000.00),
(2,1,1,0,45000.00),
(3,3,2,4,110000.00),
(4,3,1,3,30000.00),
(5,5,2,1,90000.00);

SELECT * FROM Category;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM Order_items;

-- Chuyển trạng thái (status) của sản phẩm 'Cold Brew' sang 'Available'
update Product set status = 'available' where product_name = 'Cold Brew';
-- Tăng giá bán (price) thêm 10% cho tất cả các sản phẩm thuộc danh mục 'Bakery' (mã 'C03').
-- Xóa các chi tiết đơn hàng (order_details) có số lượng  bằng 0 hoặc nhỏ hơn
delete from Order_details where quanlity = 0 or quanlity < 0;
-- Phần 2: Truy vấn dữ liệu cơ bản
-- Liệt kê product_id, product_name, price của các sản phẩm có giá từ 40,000 trở lên và đang còn hàng (Available).
select product_id, product_name, price from Product where price >= 40.000 and status = 'Available';
-- Lấy thông tin order_id, order_date, customer_name của các khách hàng có tên bắt đầu bằng chữ 'M'.
select order_id, order_date, customer_name from Orders where customer_name = 'm';
-- Hiển thị danh sách sản phẩm gồm: product_name, price. Sắp xếp theo giá giảm dần.
select produccustomersstudentstudentstudentclasst_name, price from Product order by price desc;
-- Hiển thị danh sách sản phẩm, bỏ qua 2 sản phẩm đầu tiên và lấy 3 sản phẩm tiếp theo.
select * from Product limit 3 offset 2; 
-- Phần 3: Truy vấn dữ liệu nâng cao
-- Hiển thị product_name, price và tên danh mục (category_name) của từng sản phẩm.
select product_name, price from Product;
-- Liệt kê tất cả danh mục và các sản phẩm thuộc danh mục đó. Hiển thị cả những danh mục chưa có sản phẩm nào.

-- Tính tổng doanh thu của quán theo từng ngày.

-- Thống kê những đơn hàng (order_id) có từ 2 loại sản phẩm khác nhau trở lên trong order_detail.
select g.guest_name,r.room_type,b.check_in 
from bookings b
join guests g on  b.guest_id = g.guest_id
join rooms r on b.room_id = r.room_id;
-- Lấy danh sách sản phẩm có giá cao hơn giá trung bình của tất cả sản phẩm trong quán.
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) = (
    SELECT MAX(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM orders
        GROUP BY customer_id
    ) AS temp
);
-- Hiển thị tên các khách hàng đã từng mua sản phẩm 'Matcha Latte'.
select product_name from Product group by product_name = 'Matcha Latte';
-- Hiển thị bảng thông tin về đơn hàng gồm: order_id, order_date, product_name, quantity, subtotal.
select o.order_id, o.order_date, p.product_name, od.quantity, od.subtotal
from Orders o
join Product p on p.product_name = o.product_name
join Order_detail od on od.quantity = o.quantity;
