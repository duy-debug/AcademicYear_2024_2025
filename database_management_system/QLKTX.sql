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
-- 1. Lấy danh sách tất cả sinh viên
SELECT * FROM SINHVIEN;

-- 2. Lấy danh sách phòng có sức chứa trên 5 người
SELECT * FROM PHONG WHERE SoLuongToiDa > 5;

-- 3. Lấy danh sách hóa đơn chưa thanh toán
SELECT * FROM HOADON WHERE TrangThai = N'Chưa thanh toán';
-- 4. Đếm số lượng sinh viên trong từng phòng
SELECT MaPhong, COUNT(*) AS SoLuong FROM SINHVIEN GROUP BY MaPhong;

-- 5. Tổng số tiền của tất cả hợp đồng
SELECT SUM(GiaPhong) AS TongTien FROM HOPDONG;

-- 6. Giá phòng trung bình
SELECT AVG(GiaPhong) AS GiaPhongTrungBinh FROM HOPDONG;

-- 7. Số lượng sinh viên theo giới tính
SELECT GioiTinh, COUNT(*) AS SoLuong FROM SINHVIEN GROUP BY GioiTinh;

-- 8. Tìm phòng có nhiều người ở nhất
SELECT MaPhong, MAX(SoLuongNguoiO) AS MaxSoLuong FROM PHONG;

-- 9. Tìm số lượng hóa đơn đã thanh toán
SELECT COUNT(*) AS SoHoaDon FROM HOADON WHERE TrangThai = N'Đã thanh toán';

-- 10. Tổng số lượng sinh viên trong ký túc xá
SELECT COUNT(*) AS TongSoSinhVien FROM SINHVIEN;
-- 11. Lọc phòng có hơn 3 sinh viên
SELECT MaPhong, COUNT(*) AS SoLuong FROM SINHVIEN GROUP BY MaPhong HAVING COUNT(*) > 3;

-- 12. Lọc hợp đồng có giá phòng trung bình trên 1.5 triệu
SELECT MaSV, AVG(GiaPhong) AS GiaTB FROM HOPDONG GROUP BY MaSV HAVING AVG(GiaPhong) > 1500000;

-- 13. Dịch vụ nào được đăng ký nhiều hơn 2 lần
SELECT MaDV, COUNT(*) AS SoLanDK FROM DANGKYDV GROUP BY MaDV HAVING COUNT(*) > 2;

-- 14. Khu nào có hơn 5 phòng
SELECT MaKhu, COUNT(*) AS SoPhong FROM PHONG GROUP BY MaKhu HAVING COUNT(*) > 5;

-- 15. Sinh viên nào đăng ký từ 2 dịch vụ trở lên
SELECT MaSV, COUNT(*) AS SoDichVu FROM DANGKYDV GROUP BY MaSV HAVING COUNT(*) >= 2;
-- 16. Phòng có số lượng người ở nhiều nhất
SELECT * FROM PHONG WHERE SoLuongNguoiO = (SELECT MAX(SoLuongNguoiO) FROM PHONG);

-- 17. Hợp đồng có giá thấp nhất
SELECT * FROM HOPDONG WHERE GiaPhong = (SELECT MIN(GiaPhong) FROM HOPDONG);

-- 18. Sinh viên lớn tuổi nhất
SELECT * FROM SINHVIEN WHERE NgaySinh = (SELECT MIN(NgaySinh) FROM SINHVIEN);
-- 19. Lấy sinh viên chưa đăng ký dịch vụ nào
SELECT * FROM SINHVIEN WHERE MaSV NOT IN (SELECT MaSV FROM DANGKYDV);

-- 20. Lấy danh sách sinh viên và phòng họ đang ở
SELECT SV.MaSV, SV.HoSV, SV.TenSV, P.MaPhong FROM SINHVIEN SV INNER JOIN PHONG P ON SV.MaPhong = P.MaPhong;

-- 21. Lấy danh sách nhân viên không có khu quản lý
SELECT * FROM NHANVIEN WHERE MaKhu NOT IN (SELECT MaKhu FROM PHANKHU);

-- 22. Lấy phòng nào chưa có sinh viên ở
SELECT P.* FROM PHONG P LEFT JOIN SINHVIEN S ON P.MaPhong = S.MaPhong WHERE S.MaSV IS NULL;

-- 23. Lấy danh sách dịch vụ chưa có giá
SELECT * FROM DICHVU WHERE MaDV NOT IN (SELECT MaDV FROM DONGIA);
-- 24. Sinh viên có hợp đồng nhưng không đăng ký dịch vụ
SELECT MaSV FROM HOPDONG EXCEPT SELECT MaSV FROM DANGKYDV;

-- 25. Sinh viên đã đăng ký dịch vụ và có hợp đồng
SELECT MaSV FROM HOPDONG INTERSECT SELECT MaSV FROM DANGKYDV;

-- 26. Phòng có giá cao hoặc thấp nhất
SELECT * FROM HOPDONG WHERE GiaPhong = (SELECT MAX(GiaPhong) FROM HOPDONG)
UNION
SELECT * FROM HOPDONG WHERE GiaPhong = (SELECT MIN(GiaPhong) FROM HOPDONG);
-- 27. Cập nhật giá phòng tăng 10%
UPDATE HOPDONG SET GiaPhong = GiaPhong * 1.1;

-- 28. Xóa sinh viên không có hợp đồng
DELETE FROM SINHVIEN WHERE MaSV NOT IN (SELECT MaSV FROM HOPDONG);

-- 29. Giảm giá 5% cho dịch vụ nước
UPDATE DONGIA SET DonGia = DonGia * 0.95 WHERE MaDV = 'DV01';

-- 30. Chuyển sinh viên SV03 sang phòng P202
UPDATE SINHVIEN SET MaPhong = 'P202' WHERE MaSV = 'SV03';

-- 31. Xóa tất cả hóa đơn chưa thanh toán
DELETE FROM HOADON WHERE TrangThai = N'Chưa thanh toán';

-- 32. Cập nhật số lượng sinh viên của khu K01
UPDATE PHANKHU SET SoLuongSV = (SELECT COUNT(*) FROM SINHVIEN WHERE MaKhu = 'K01') WHERE MaKhu = 'K01';

-- 33. Xóa hợp đồng hết hạn trước năm 2024
DELETE FROM HOPDONG WHERE NgayChamDut < '2024-01-01';
-- 34. Tìm phòng mà tất cả sinh viên trong đó đều đăng ký dịch vụ
SELECT MaPhong FROM SINHVIEN S WHERE NOT EXISTS (
	SELECT * FROM DICHVU D WHERE NOT EXISTS (
		SELECT * FROM DANGKYDV DK WHERE DK.MaSV = S.MaSV AND DK.MaDV = D.MaDV
	)
);

-- 35. Tìm nhân viên làm việc ở tất cả các khu
SELECT MaNV FROM NHANVIEN N WHERE NOT EXISTS (
	SELECT * FROM PHANKHU K WHERE NOT EXISTS (
		SELECT * FROM NHANVIEN NV WHERE NV.MaNV = N.MaNV AND NV.MaKhu = K.MaKhu
	)
);
-- 34. Tìm phòng mà tất cả sinh viên trong đó đều đăng ký dịch vụ
SELECT MaPhong FROM SINHVIEN S WHERE NOT EXISTS (
	SELECT * FROM DICHVU D WHERE NOT EXISTS (
		SELECT * FROM DANGKYDV DK WHERE DK.MaSV = S.MaSV AND DK.MaDV = D.MaDV
	)
);

-- 35. Tìm nhân viên làm việc ở tất cả các khu
SELECT MaNV FROM NHANVIEN N WHERE NOT EXISTS (
	SELECT * FROM PHANKHU K WHERE NOT EXISTS (
		SELECT * FROM NHANVIEN NV WHERE NV.MaNV = N.MaNV AND NV.MaKhu = K.MaKhu
	)
);
-- 34. Tìm phòng mà tất cả sinh viên trong đó đều đăng ký dịch vụ
SELECT MaPhong FROM SINHVIEN S WHERE NOT EXISTS (
	SELECT * FROM DICHVU D WHERE NOT EXISTS (
		SELECT * FROM DANGKYDV DK WHERE DK.MaSV = S.MaSV AND DK.MaDV = D.MaDV
	)
);

-- 35. Tìm nhân viên làm việc ở tất cả các khu
SELECT MaNV FROM NHANVIEN N WHERE NOT EXISTS (
	SELECT * FROM PHANKHU K WHERE NOT EXISTS (
		SELECT * FROM NHANVIEN NV WHERE NV.MaNV = N.MaNV AND NV.MaKhu = K.MaKhu
	)
);


-- 1. Thủ tục thêm sinh viên mới
GO
CREATE PROCEDURE ThemSinhVien
    @MaSV VARCHAR(5), 
    @MaPhong VARCHAR(5), 
    @MaKhu VARCHAR(5),
    @HoSV NVARCHAR(50), 
    @TenSV NVARCHAR(50), 
    @NgaySinh DATE, 
    @GioiTinh NVARCHAR(5), 
    @Email VARCHAR(50), 
    @DiaChi NVARCHAR(100)
AS
BEGIN
    IF EXISTS (SELECT * FROM PHONG WHERE MaPhong = @MaPhong AND MaKhu = @MaKhu AND SoLuongNguoiO < SoLuongToiDa)
    BEGIN
        INSERT INTO SINHVIEN (MaSV, MaPhong, MaKhu, HoSV, TenSV, NgaySinh, GioiTinh, Email, DiaChi)
        VALUES (@MaSV, @MaPhong, @MaKhu, @HoSV, @TenSV, @NgaySinh, @GioiTinh, @Email, @DiaChi);

        -- Cập nhật số lượng người ở trong phòng
        UPDATE PHONG SET SoLuongNguoiO = SoLuongNguoiO + 1 WHERE MaPhong = @MaPhong AND MaKhu = @MaKhu;
    END
    ELSE
    BEGIN
        PRINT N'Không thể thêm sinh viên, phòng đã đầy';
    END
END;
GO

-- 2. Thủ tục cập nhật giá phòng
CREATE PROCEDURE CapNhatGiaPhong
    @PhanTramTang FLOAT
AS
BEGIN
    UPDATE HOPDONG SET GiaPhong = GiaPhong * (1 + @PhanTramTang / 100);
END;
GO

-- 3. Thủ tục xóa sinh viên không có hợp đồng
CREATE PROCEDURE XoaSinhVienKhongCoHopDong
AS
BEGIN
    DELETE FROM SINHVIEN WHERE MaSV NOT IN (SELECT MaSV FROM HOPDONG);
END;
GO

-- 4. Hàm tính tổng số tiền dịch vụ mà một sinh viên đã đăng ký
CREATE FUNCTION TinhTongTienDichVu (@MaSV VARCHAR(5))
RETURNS MONEY
AS
BEGIN
    DECLARE @TongTien MONEY;
    SELECT @TongTien = SUM(DG.DonGia)
    FROM DANGKYDV DK
    JOIN DONGIA DG ON DK.MaDV = DG.MaDV
    WHERE DK.MaSV = @MaSV;
    
    RETURN ISNULL(@TongTien, 0);
END;
GO

-- 5. Hàm lấy danh sách sinh viên theo giới tính
CREATE FUNCTION LaySinhVienTheoGioiTinh (@GioiTinh NVARCHAR(5))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM SINHVIEN WHERE GioiTinh = @GioiTinh
);
GO

-- 1. Trigger kiểm tra số lượng người ở khi thêm sinh viên vào phòng
CREATE TRIGGER trg_KiemTraSoLuongPhong
ON SINHVIEN
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM PHONG P
        JOIN inserted I ON P.MaPhong = I.MaPhong AND P.MaKhu = I.MaKhu
        WHERE P.SoLuongNguoiO >= P.SoLuongToiDa
    )
    BEGIN
        PRINT N'Phòng đã đầy, không thể thêm sinh viên';
        ROLLBACK TRANSACTION;
    END
END;
GO

-- 2. Trigger tự động tạo hợp đồng khi thêm sinh viên mới
CREATE TRIGGER trg_TaoHopDongMoi
ON SINHVIEN
AFTER INSERT
AS
BEGIN
    INSERT INTO HOPDONG (MaHD, MaSV, NgayApDung, NgayChamDut, GiaPhong)
    SELECT 'HD' + MaSV, MaSV, GETDATE(), DATEADD(YEAR, 1, GETDATE()), 1500000
    FROM inserted;
END;
GO

-- 3. Trigger cập nhật số lượng người ở khi xóa sinh viên
CREATE TRIGGER trg_CapNhatSoLuongNguoiO
ON SINHVIEN
AFTER DELETE
AS
BEGIN
    UPDATE PHONG
    SET SoLuongNguoiO = SoLuongNguoiO - 1
    WHERE EXISTS (SELECT 1 FROM deleted D WHERE D.MaPhong = PHONG.MaPhong AND D.MaKhu = PHONG.MaKhu);
END;


