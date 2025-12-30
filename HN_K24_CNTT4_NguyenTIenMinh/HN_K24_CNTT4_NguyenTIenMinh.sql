use hn_ks24_cntt4_nguyentienminh;

-- bai 1
create table reader (
	reader_id int AUTO_INCREMENT primary key,
    reader_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    register_date DATE DEFAULT (CURRENT_DATE)
);
create table book (
	book_id int primary key,
    book_title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    publish_year INT check (publish_year >= 1900)
);
create table borrow (
	reader_id INT,
    book_id INT,
    borrow_date DATE DEFAULT (CURRENT_DATE),
    return_date DATE,
    PRIMARY KEY (reader_id, book_id, borrow_date),
    FOREIGN KEY (reader_id) REFERENCES Reader(reader_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- bai 2
alter table reader 
add column email varchar(100) unique;

alter table book 
modify author varchar(150);

alter table borrow
add constraint chk_return_date
check (return_date is null or return_date >= borrow_date);

-- bai 3
insert into reader (reader_id,reader_name,phone,email,register_date) values
(1, 'Nguyễn Văn An', '0901234567', 'an.nguyen@gmail.com', '2024-09-01'),
(2, 'Trần Thị Bình', '0912345678', 'binh.tran@gmail.com', '2024-09-05'),
(3, 'Lê Minh Châu', '0923456789', 'chau.le@gmail.com', '2024-09-10');

insert into book (book_id, book_title, author, publish_year) values
(101, 'Lập trình C căn bản', 'Nguyễn Văn A', 2018),
(102, 'Cơ sở dữ liệu', 'Trần Thị B', 2020),
(103, 'Lập trình Java', 'Lê Minh C', 2019),
(104, 'Hệ quản trị MySQL', 'Phạm Văn D', 2021);

insert into borrow (reader_id, book_id, borrow_date, return_date) values
(1, 101, '2024-09-15', null),
(1, 102, '2024-09-15', '2024-09-25'),
(2, 103, '2024-09-18', null);

update borrow
set return_date = '2024-10-02'
where reader_id = 1;

update book
set publish_year = 2023
where publish_year >= 2021;

delete from borrow
where borrow_date < '2024-09-18';

select * from reader;

select * from book;

select * from borrow;