CREATE DATABASE QLKTX;
USE QLKTX;

CREATE TABLE PHANKHU (
	MaKhu VARCHAR(5) NOT NULL PRIMARY KEY,
	DiaChi NVARCHAR(100) NOT NULL,
	SoLuongSV SMALLINT NOT NULL CHECK(SoLuongSV > 0)
);

CREATE TABLE DICHVU (
	MaDV VARCHAR(5) NOT NULL PRIMARY KEY,
	TenDV NVARCHAR(50) NOT NULL
);

CREATE TABLE PHONG (
	MaPhong VARCHAR(5) NOT NULL,
	MaKhu VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES PHANKHU(MaKhu),
	SoLuongToiDa TINYINT NOT NULL CHECK(SoLuongToiDa > 0 AND SoLuongToiDa <= 10),
	SoLuongNguoiO TINYINT NOT NULL CHECK(SoLuongNguoiO >= 0),
	CONSTRAINT pk_phong PRIMARY KEY (MaPhong, MaKhu)
);

CREATE TABLE NHANVIEN ( -- sửa quản trị thành nhân viên
	MaNV VARCHAR(5) NOT NULL PRIMARY KEY,
	HoNV NVARCHAR(50) NOT NULL,
	TenNV NVARCHAR(50) NOT NULL,
	SDT VARCHAR(10) NOT NULL,
	MaKhu VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES PHANKHU(MaKhu)
);

CREATE TABLE SINHVIEN (
	MaSV VARCHAR(5) NOT NULL PRIMARY KEY,
	MaPhong VARCHAR(5) NOT NULL,
	MaKhu VARCHAR(5) NOT NULL,
	HoSV NVARCHAR(50) NOT NULL,
	TenSV NVARCHAR(50) NOT NULL,
	NgaySinh DATE NOT NULL,
	GioiTinh NVARCHAR(5) NOT NULL CHECK (GioiTinh IN (N'Nam', N'Nữ')),
	Email VARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	CONSTRAINT fk_sinhvien FOREIGN KEY (MaPhong, MaKhu) REFERENCES PHONG(MaPhong, MaKhu)
);

CREATE TABLE HOPDONG (
	MaHD VARCHAR(5) NOT NULL PRIMARY KEY,
	MaSV VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES SINHVIEN(MaSV),
	NgayApDung DATE NOT NULL,
	NgayChamDut DATE NOT NULL, 
	GiaPhong MONEY NOT NULL
);

CREATE TABLE DANGKYDV (
	MaSV VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES SINHVIEN(MaSV),
	MaDV VARCHAR(5) NOT NULL,
	TGBatDau DATE NOT NULL,
	TGKetThuc DATE NOT NULL,
	CONSTRAINT pk_dangkydv PRIMARY KEY (MaSV, MaDV),
	CONSTRAINT fk_dangkydv FOREIGN KEY (MaDV) REFERENCES DICHVU(MaDV)
);

CREATE TABLE DONGIA (
	MaDV VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES DICHVU(MaDV),
	DonGia MONEY NOT NULL,
	DonViTinh NVARCHAR(10) NOT NULL,
	CONSTRAINT pk_dongia PRIMARY KEY (MaDV)
);

CREATE TABLE HOADON (
	MaHoaDon VARCHAR(5) NOT NULL PRIMARY KEY,
	MaPhong VARCHAR(5) NOT NULL,
	MaKhu VARCHAR(5) NOT NULL,
	MaDV VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES DICHVU(MaDV),
	TrangThai NVARCHAR(20) NOT NULL,
	CONSTRAINT fk_hoadon FOREIGN KEY (MaPhong, MaKhu) REFERENCES PHONG(MaPhong, MaKhu)
);

CREATE TABLE USERS (
	Username NVARCHAR(50) NOT NULL PRIMARY KEY,
	Passwordhash NVARCHAR(255) NOT NULL,
	Role NVARCHAR(20) NOT NULL CHECK (Role IN (N'Admin', N'Nhân viên', N'Sinh viên'))
);
-- Thêm dữ liệu vào bảng PHANKHU
INSERT INTO PHANKHU (MaKhu, DiaChi, SoLuongSV) VALUES
('K01', N'Khu A - Số 1 Đường ABC', 100),
('K02', N'Khu B - Số 2 Đường XYZ', 80),
('K03', N'Khu C - Số 3 Đường LMN', 120);

-- Thêm dữ liệu vào bảng DICHVU
INSERT INTO DICHVU (MaDV, TenDV) VALUES
('DV01', N'Nước'),
('DV02', N'Điện'),
('DV03', N'Internet'),
('DV04', N'Giặt ủi'),
('DV05', N'Vệ sinh phòng');

-- Thêm dữ liệu vào bảng PHONG
INSERT INTO PHONG (MaPhong, MaKhu, SoLuongToiDa, SoLuongNguoiO) VALUES
('P101', 'K01', 4, 3),
('P102', 'K01', 4, 2),
('P102', 'K02', 6, 5),
('P202', 'K02', 6, 4),
('P301', 'K03', 8, 7);

-- Thêm dữ liệu vào bảng NHANVIEN
INSERT INTO NHANVIEN (MaNV, HoNV, TenNV, SDT, MaKhu) VALUES
('NV01', N'Nguyễn', N'Văn A', '0912345678', 'K01'),
('NV02', N'Trần', N'Thị B', '0923456789', 'K02'),
('NV03', N'Lê', N'Văn C', '0934567890', 'K03');

-- Thêm dữ liệu vào bảng SINHVIEN
INSERT INTO SINHVIEN (MaSV, MaPhong, MaKhu, HoSV, TenSV, NgaySinh, GioiTinh, Email, DiaChi) VALUES
('SV01', 'P101', 'K01', N'Nguyễn', N'Văn An', '2002-05-10', N'Nam', 'an.nguyen@example.com', N'Hà Nội'),
('SV02', 'P102', 'K01', N'Trần', N'Thị Hoa', '2003-08-12', N'Nữ', 'hoa.tran@example.com', N'Hải Phòng'),
('SV03', 'P102', 'K02', N'Phạm', N'Minh Tuấn', '2001-11-20', N'Nam', 'tuan.pham@example.com', N'Đà Nẵng'),
('SV04', 'P202', 'K02', N'Lê', N'Kim Ngọc', '2004-02-15', N'Nữ', 'ngoc.le@example.com', N'Hồ Chí Minh'),
('SV05', 'P301', 'K03', N'Hoàng', N'Đức Bình', '2002-06-18', N'Nam', 'binh.hoang@example.com', N'Cần Thơ');

-- Thêm dữ liệu vào bảng HOPDONG
INSERT INTO HOPDONG (MaHD, MaSV, NgayApDung, NgayChamDut, GiaPhong) VALUES
('HD01', 'SV01', '2024-01-01', '2024-12-31', 1500000),
('HD02', 'SV02', '2024-02-01', '2024-12-31', 1600000),
('HD03', 'SV03', '2024-03-01', '2024-12-31', 1400000),
('HD04', 'SV04', '2024-04-01', '2024-12-31', 1700000),
('HD05', 'SV05', '2024-05-01', '2024-12-31', 1800000);

-- Thêm dữ liệu vào bảng DANGKYDV
INSERT INTO DANGKYDV (MaSV, MaDV, TGBatDau, TGKetThuc) VALUES
('SV01', 'DV01', '2024-01-01', '2024-12-31'),
('SV02', 'DV02', '2024-02-01', '2024-12-31'),
('SV03', 'DV03', '2024-03-01', '2024-12-31'),
('SV04', 'DV04', '2024-04-01', '2024-12-31'),
('SV05', 'DV05', '2024-05-01', '2024-12-31');

-- Thêm dữ liệu vào bảng DONGIA
INSERT INTO DONGIA (MaDV, DonGia, DonViTinh) VALUES
('DV01', 50000, N'M3'),
('DV02', 3000, N'KWh'),
('DV03', 100000, N'Tháng'),
('DV04', 20000, N'Kg'),
('DV05', 150000, N'Tháng');

-- Thêm dữ liệu vào bảng HOADON
INSERT INTO HOADON (MaHoaDon, MaPhong, MaKhu, MaDV, TrangThai) VALUES
('HD01', 'P101', 'K01', 'DV01', N'Đã thanh toán'),
('HD02', 'P102', 'K01', 'DV02', N'Chưa thanh toán'),
('HD03', 'P102', 'K02', 'DV03', N'Đã thanh toán'),
('HD04', 'P202', 'K02', 'DV04', N'Chưa thanh toán'),
('HD05', 'P301', 'K03', 'DV05', N'Đã thanh toán');

-- Thêm dữ liệu vào bảng USERS
INSERT INTO USERS (Username, Passwordhash, Role) VALUES
('admin', 'e58ff872611207784913736b428ab7423910f28ef1bbfcb353517a4afb6fa8fa
', N'Admin'),
('nhanvien1', 'e58ff872611207784913736b428ab7423910f28ef1bbfcb353517a4afb6fa8fa
', N'Nhân viên'),
('sinhvien1', 'e58ff872611207784913736b428ab7423910f28ef1bbfcb353517a4afb6fa8fa
', N'Sinh viên'); -- mật khẩu duy123 


