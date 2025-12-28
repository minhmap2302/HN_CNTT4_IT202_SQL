
use bai4;
create table GiangVien(
 MaGV int primary key,
 TenGiangVien varchar(255),
 Email varchar(255)
);
create table monhoc(
   MaMH int primary key,
   TenMonHoc varchar(255) unique
);
alter table monhoc
add GiangvienID int;
alter table monhoc
add foreign key(GiangVienID) references giangvien(MaGV);