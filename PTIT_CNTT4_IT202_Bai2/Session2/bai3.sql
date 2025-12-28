create database bai3;
use bai3;
create table SinhVien(
  MaSv int primary key,
  HoVaTen varchar(255)
);
create table MonHoc(
   MaMonHoc int primary key,
   TenMonHoc varchar(255),
   SoTinChi int check(SoTinChi >0)
);
create table Dangky(
  MaSV int,
  MaMH int,
  NgayDangKy date,
  foreign key(MaSV) references sinhvien(MaSv),
  foreign key(MaMH) references monhoc(MaMonHoc)
);