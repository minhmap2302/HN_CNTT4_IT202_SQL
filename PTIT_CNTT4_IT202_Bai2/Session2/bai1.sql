
use demo;
create table LopHoc(
  MaLop int primary key not null unique,
  TenLop varchar(255) not null,
  NamHoc date
);
CREATE table SinhVien(
 MaSv int primary key not null unique,
 HoTen varchar(255) not null,
 MaLopHoc int, 
 FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLop)
);
