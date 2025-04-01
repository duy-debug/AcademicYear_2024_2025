CREATE DATABASE QuanLyKhachSan;
USE QuanLyKhachSan;
CREATE TABLE KhachSan
(
	MaKhachSan VARCHAR(5) NOT NULL PRIMARY KEY,
	TenKhachSan NVARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(50) NOT NULL
);
CREATE TABLE KhachHang
(
	MaKhachHang VARCHAR(5) NOT NULL PRIMARY KEY,
	HoTen NVARCHAR(50) NOT NULL,
	CMND VARCHAR(12) NOT NULL,
	DiaChi NVARCHAR(50) NOT NULL
);
CREATE TABLE BangPhong
(
	MaPhong VARCHAR(5) NOT NULL PRIMARY KEY,
	MaKhachSan VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES KhachSan(MaKhachSan),
	LoaiPhong NVARCHAR(50) NOT NULL,
	GiaPhong MONEY NOT NULL
);
CREATE TABLE DatPhong
(
	MaDatPhong VARCHAR(5) NOT NULL PRIMARY KEY,
	MaKhachHang VARCHAR(5) FOREIGN KEY REFERENCES KhachHang(MaKhachHang),
	MaPhong VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES BangPhong(MaPhong),
	NgayDen DATETIME NOT NULL,
	NgayDi DATETIME NOT NULL,
	SoNguoi TINYINT NOT NULL
);
-- Thêm dữ liệu vào bảng KhachSan
INSERT INTO KhachSan (MaKhachSan, TenKhachSan, DiaChi) VALUES
('KS001', N'Khách sạn Hà Nội', N'123 Đường Lê Lợi, Hà Nội'),
('KS002', N'Khách sạn Sài Gòn', N'456 Đường Nguyễn Huệ, TP.HCM'),
('KS003', N'Khách sạn Đà Nẵng', N'789 Đường Võ Văn Kiệt, Đà Nẵng'),
('KS004', N'Khách sạn Nha Trang', N'101 Đường Trần Phú, Nha Trang'),
('KS005', N'Khách sạn Phú Quốc', N'202 Đường Bạch Đằng, Phú Quốc');

-- Thêm dữ liệu vào bảng KhachHang
INSERT INTO KhachHang (MaKhachHang, HoTen, CMND, DiaChi) VALUES
('KH001', N'Nguyễn Văn A', '123456789012', N'Quận 1, TP.HCM'),
('KH002', N'Trần Thị B', '987654321098', N'Quận Hoàn Kiếm, Hà Nội'),
('KH003', N'Phạm Văn C', '567890123456', N'Quận Hải Châu, Đà Nẵng'),
('KH004', N'Lê Thị D', '345678901234', N'Thành phố Nha Trang'),
('KH005', N'Hoàng Minh E', '234567890123', N'Thành phố Phú Quốc');

-- Thêm dữ liệu vào bảng BangPhong
INSERT INTO BangPhong (MaPhong, MaKhachSan, LoaiPhong, GiaPhong) VALUES
('P001', 'KS001', N'Deluxe', 1200000),
('P002', 'KS001', N'Superior', 800000),
('P003', 'KS002', N'Standard', 500000),
('P004', 'KS002', N'VIP', 2000000),
('P005', 'KS003', N'Family', 1500000);

-- Thêm dữ liệu vào bảng DatPhong
INSERT INTO DatPhong (MaDatPhong, MaKhachHang, MaPhong, NgayDen, NgayDi, SoNguoi) VALUES
('DP001', 'KH001', 'P001', '2025-04-01 14:00:00', '2025-04-05 12:00:00', 2),
('DP002', 'KH002', 'P002', '2025-04-02 13:00:00', '2025-04-06 11:00:00', 1),
('DP003', 'KH003', 'P003', '2025-04-03 15:00:00', '2025-04-07 10:00:00', 3),
('DP004', 'KH004', 'P004', '2025-04-04 12:00:00', '2025-04-08 09:00:00', 4),
('DP005', 'KH005', 'P005', '2025-04-05 16:00:00', '2025-04-09 14:00:00', 2);
--3.Liệt kê danh sách khách hàng đã đặt phòng trong tháng 6/2024. Bao gồm thông tin: Họ tên, CMND, Tên khách sạn, Loại phòng.
SELECT KH.HoTen,KH.CMND, KS.TenKhachSan, BP.LoaiPhong
FROM KhachHang KH
JOIN DatPhong DP ON DP.MaKhachHang = KH.MaKhachHang
JOIN BangPhong BP ON BP.MaPhong = DP.MaPhong
JOIN KhachSan KS ON KS.MaKhachSan = BP.MaKhachSan
WHERE DP.NgayDen BETWEEN '2025-04-01 00:00:00' AND '2025-04-30 23:59:59';
--4.Tính tổng doanh thu của từng khách sạn trong năm 2024.
SELECT KS.TenKhachSan,SUM(BP.GiaPhong) AS DoanhThu
FROM KhachSan KS
JOIN BangPhong BP ON BP.MaKhachSan = KS.MaKhachSan
JOIN DatPhong DP ON DP.MaPhong = BP.MaPhong
WHERE DP.NgayDen BETWEEN '2025-01-01 00:00:00' AND '2025-12-31 23:59:59'
GROUP BY KS.TenKhachSan;
--5.Xác định khách sạn có tổng doanh thu cao nhất trong năm 2024.
SELECT TOP 1 KS.TenKhachSan,SUM(BP.GiaPhong) AS DoanhThu
FROM KhachSan KS
JOIN BangPhong BP ON BP.MaKhachSan = KS.MaKhachSan
JOIN DatPhong DP ON DP.MaPhong = BP.MaPhong
WHERE DP.NgayDen BETWEEN '2025-01-01 00:00:00' AND '2025-12-31 23:59:59'
GROUP BY KS.TenKhachSan
ORDER BY SUM(BP.GiaPhong) DESC;
--6.Liệt kê họ tên của khách hàng đã đặt phòng ở tất cả các khách sạn trong hệ thống.
SELECT KH.HoTen
FROM KhachHang KH
JOIN DatPhong DP ON DP.MaKhachHang = KH.MaKhachHang
JOIN BangPhong BP ON BP.MaPhong = DP.MaPhong
JOIN KhachSan KS ON KS.MaKhachSan = BP.MaKhachSan
GROUP BY KH.HoTen
HAVING COUNT(DISTINCT KS.MaKhachSan) = (SELECT COUNT(*) FROM KhachSan);
--7.Tạo thủ tục cho phép chèn dữ liệu vào bảng DatPhong. Cho ví dụ minh họa.
-- Tạo thủ tục InsertDatPhong
GO
CREATE PROCEDURE InsertDatPhong
    @MaDatPhong VARCHAR(5),
    @MaKhachHang VARCHAR(5),
    @MaPhong VARCHAR(5),
    @NgayDen DATETIME,
    @NgayDi DATETIME,
    @SoNguoi TINYINT
AS
BEGIN
    INSERT INTO DatPhong (MaDatPhong, MaKhachHang, MaPhong, NgayDen, NgayDi, SoNguoi)
    VALUES (@MaDatPhong, @MaKhachHang, @MaPhong, @NgayDen, @NgayDi, @SoNguoi);
END;
GO

-- Ví dụ minh họa: Chèn một bản ghi mới vào bảng DatPhong
EXEC InsertDatPhong 'DP006', 'KH001', 'P001', '2025-05-01', '2025-05-05', 2;


--8.Tạo hàm trả về danh sách đặt phòng của một khách hàng theo CMND. Cho ví dụ minh họa.
GO
CREATE FUNCTION fn_LietKeDatPhong(@CMND VARCHAR(12))
RETURNS TABLE
AS
RETURN
(
    SELECT DP.MaDatPhong, KH.HoTen, KH.CMND, KS.TenKhachSan, BP.LoaiPhong, DP.NgayDen, DP.NgayDi, DP.SoNguoi
    FROM KhachHang KH
    JOIN DatPhong DP ON DP.MaKhachHang = KH.MaKhachHang
    JOIN BangPhong BP ON BP.MaPhong = DP.MaPhong
    JOIN KhachSan KS ON KS.MaKhachSan = BP.MaKhachSan
    WHERE KH.CMND = @CMND
);
GO

--VÍ DỤ
SELECT * FROM fn_LietKeDatPhong('123456789012');
--9.Tạo hàm trả cho phép nhập vào một mã khách hàng và liệt kê tổng số phòng mà khách hàng đã đặt.
GO
CREATE FUNCTION fn_TongSoPhongDaDat(@MaKhachHang VARCHAR(5))
RETURNS INT
AS
BEGIN
    DECLARE @TongSoPhong INT;

    -- Tính tổng số phòng khách hàng đã đặt
    SELECT @TongSoPhong = COUNT(DISTINCT DP.MaPhong)
    FROM DatPhong DP
    WHERE DP.MaKhachHang = @MaKhachHang;

    RETURN @TongSoPhong;
END;
GO
--VÍ DỤ	
SELECT dbo.fn_TongSoPhongDaDat('KH001') AS TongSoPhong;
--10.	Tạo trigger kiểm tra số người đặt phòng không vượt quá 4 người cho loại phòng tiêu chuẩn.
GO
CREATE TRIGGER trg_KiemTraSoNguoi
ON DatPhong
AFTER INSERT, UPDATE
AS
BEGIN
    -- Kiểm tra nếu có bất kỳ phòng tiêu chuẩn nào có số người > 4
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN BangPhong bp ON i.MaPhong = bp.MaPhong
        WHERE bp.LoaiPhong = N'Tiêu chuẩn' AND i.SoNguoi > 4
    )
    BEGIN
        RAISERROR(N'Không thể đặt phòng tiêu chuẩn với số người vượt quá 4 người!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO