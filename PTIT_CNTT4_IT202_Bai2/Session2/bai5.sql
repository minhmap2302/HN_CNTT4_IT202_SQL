create database bai5;
use bai5;
create table SinhVien(
  MaSv int primary key,
  HoVaTen varchar(255)
);
create table MonHoc(
   MaMonHoc int primary key,
   TenMonHoc varchar(255),
   SoTinChi int check(SoTinChi >0)
);
create table bangdiem(
  MaSV int,
  MaMH int,
  Diem float check(Diem>=0),
  foreign key(Masv) references sinhvien(MaSv),
  foreign key(MaMH) references monhoc(MaMonHoc)
);