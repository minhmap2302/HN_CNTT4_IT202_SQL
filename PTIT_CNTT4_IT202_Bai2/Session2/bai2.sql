create database bai2;
use bai2;
create table SinhVien(
  MaSv int primary key,
  HoVaTen varchar(255)
);
create table MonHoc(
   MaMonHoc int primary key,
   TenMonHoc varchar(255),
   SoTinChi int check(SoTinChi >0)
);