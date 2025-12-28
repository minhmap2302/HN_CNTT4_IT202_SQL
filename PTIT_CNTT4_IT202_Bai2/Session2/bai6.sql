USE bai6;
CREATE TABLE LopHoc (
  MaLop INT PRIMARY KEY,
  TenLop VARCHAR(255) NOT NULL,
  NamHoc DATE
);
CREATE TABLE SinhVien (
  MaSv INT PRIMARY KEY,
  HoTen VARCHAR(255) NOT NULL,
  MaLopHoc INT,
  FOREIGN KEY (MaLopHoc) REFERENCES LopHoc(MaLop)
);
CREATE TABLE GiangVien (
  MaGV INT PRIMARY KEY,
  TenGiangVien VARCHAR(255),
  Email VARCHAR(255)
);
CREATE TABLE MonHoc (
  MaMonHoc INT PRIMARY KEY,
  TenMonHoc VARCHAR(255),
  SoTinChi INT CHECK (SoTinChi > 0),
  GiangVienID INT,
  FOREIGN KEY (GiangVienID) REFERENCES GiangVien(MaGV)
);
CREATE TABLE DangKy (
  MaSv INT,
  MaMonHoc INT,
  NgayDangKy DATE,
  PRIMARY KEY (MaSv, MaMonHoc),
  FOREIGN KEY (MaSv) REFERENCES SinhVien(MaSv),
  FOREIGN KEY (MaMonHoc) REFERENCES MonHoc(MaMonHoc)
);
CREATE TABLE BangDiem (
  MaSv INT,
  MaMonHoc INT,
  Diem FLOAT CHECK (Diem >= 0 AND Diem <= 10),
  PRIMARY KEY (MaSv, MaMonHoc),
  FOREIGN KEY (MaSv) REFERENCES SinhVien(MaSv),
  FOREIGN KEY (MaMonHoc) REFERENCES MonHoc(MaMonHoc)
);
