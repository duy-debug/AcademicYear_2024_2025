CREATE DATABASE QuanLyBanHangSieuThi
USE QuanLyBanHangSieuThi;
CREATE TABLE KHACH_HANG
(
	MSKH VARCHAR(6) NOT NULL PRIMARY KEY,
	HoKH NVARCHAR(10) NOT NULL,
	TenKH NVARCHAR(10) NOT NULL,
	NgaySinh DATE NOT NULL,
	DiaChi NVARCHAR(50) NOT NULL
);
CREATE TABLE LOAI_SAN_PHAM
(
	MaLoai VARCHAR(6) NOT NULL PRIMARY KEY,
	TenLoai NVARCHAR(50) NOT NULL
);
CREATE TABLE SAN_PHAM
(
	MSP VARCHAR(5) NOT NULL PRIMARY KEY,
	TenSP NVARCHAR(50) NOT NULL,
	Gia DECIMAL(10,2) NOT NULL,
	MaLoai VARCHAR(6) NOT NULL FOREIGN KEY REFERENCES LOAI_SAN_PHAM(MaLoai)
);
CREATE TABLE HOA_DON
(
	MSHD VARCHAR(6) NOT NULL PRIMARY KEY,
	MSKH VARCHAR(6) NOT NULL FOREIGN KEY REFERENCES KHACH_HANG(MSKH),
	NgayMua DATE NOT NULL
);
CREATE TABLE CHI_TIET_HOA_DON
(
	MSHD VARCHAR(6) NOT NULL FOREIGN KEY REFERENCES HOA_DON(MSHD),
	MSP VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES SAN_PHAM(MSP),
	Soluong INT NOT NULL
);
INSERT INTO KHACH_HANG (MSKH, HoKH, TenKH, NgaySinh, DiaChi) VALUES
('KH0001', N'Nguyễn', N'An', '1995-01-15', N'Hà Nội'),
('KH0002', N'Trần', N'Bình', '1988-05-22', N'TP HCM'),
('KH0003', N'Phạm', N'Chi', '1992-11-03', N'Đà Nẵng'),
('KH0004', N'Lê', N'Dũng', '2000-07-09', N'Hải Phòng'),
('KH0005', N'Hoàng', N'Lan', '1997-09-25', N'Cần Thơ');
INSERT INTO LOAI_SAN_PHAM (MaLoai, TenLoai) VALUES
('L00001', N'Bánh kẹo'),
('L00002', N'Đồ gia dụng'),
('L00003', N'Gia vị'),
('L00004', N'Mỹ phẩm'),
('L00005', N'Sữa');
INSERT INTO SAN_PHAM (MSP, TenSP, Gia, MaLoai) VALUES
('SP001', N'Bánh Oreo', 12000, 'L00001'),
('SP002', N'Máy lạnh', 10000, 'L00002'),
('SP003', N'Muối i-ốt', 5000, 'L00003'),
('SP004', N'Kem đánh răng PS', 25000, 'L00004'),
('SP005', N'Sữa Vinamilk 1L', 35000, 'L00005');
INSERT INTO HOA_DON (MSHD, MSKH, NgayMua) VALUES
('HD0001', 'KH0001', '2023-03-01'),
('HD0002', 'KH0002', '2024-03-02'),
('HD0003', 'KH0003', '2025-03-03'),
('HD0004', 'KH0004', '2023-03-04'),
('HD0005', 'KH0005', '2023-03-05');
INSERT INTO CHI_TIET_HOA_DON (MSHD, MSP, Soluong) VALUES
('HD0001', 'SP001', 2),
('HD0001', 'SP003', 1),
('HD0002', 'SP002', 3),
('HD0003', 'SP005', 2),
('HD0004', 'SP004', 1);
-- Hiển thị danh sách các sản phẩm có giá dưới 100.000 VND thuộc loại "đồ gia dụng"
SELECT sp.MSP, sp.TenSP, sp.Gia, sp.MaLoai
FROM SAN_PHAM sp
JOIN LOAI_SAN_PHAM lsp ON lsp.MaLoai = sp.MaLoai
WHERE sp.Gia < 100000 AND lsp.TenLoai = N'Đồ gia dụng';
-- Liệt kê thông tin khách hàng, sản phẩm đã mua, ngày mua, với các giao dịch thực hiện trong tháng 3 năm 2024
SELECT kh.MSKH, kh.HoKH, kh.TenKH, kh.NgaySinh, kh.DiaChi, sp.MSP, sp.TenSP, hd.NgayMua
FROM KHACH_HANG kh
JOIN HOA_DON hd ON hd.MSKH = kh.MSKH
JOIN CHI_TIET_HOA_DON cthd ON cthd.MSHD = hd.MSHD
JOIN SAN_PHAM sp ON sp.MSP = cthd.MSP
WHERE hd.NgayMua LIKE '2024-03-%';
-- Cho biết tổng doanh thu của từng loại sản phẩm theo quý trong năm 2023
SELECT sp.MSP, sp.TenSP,
       SUM(CASE WHEN MONTH(NgayMua) BETWEEN 1 AND 3 THEN cthd.SoLuong * sp.Gia ELSE 0 END) AS Quy1,
       SUM(CASE WHEN MONTH(NgayMua) BETWEEN 4 AND 6 THEN cthd.SoLuong * sp.Gia ELSE 0 END) AS Quy2,
       SUM(CASE WHEN MONTH(NgayMua) BETWEEN 7 AND 9 THEN cthd.SoLuong * sp.Gia ELSE 0 END) AS Quy3,
       SUM(CASE WHEN MONTH(NgayMua) BETWEEN 10 AND 12 THEN cthd.SoLuong * sp.Gia ELSE 0 END) AS Quy4
FROM SAN_PHAM sp
JOIN CHI_TIET_HOA_DON cthd ON cthd.MSP = sp.MSP
JOIN HOA_DON hd ON hd.MSHD = cthd.MSHD
WHERE YEAR(hd.NgayMua) = 2023
GROUP BY sp.MSP, sp.TenSP;
-- Xóa các sản phẩm chưa từng xuất hiện trong hóa đơn trong 5 năm gần đây
DELETE FROM SAN_PHAM
WHERE MSP NOT IN (
    SELECT DISTINCT cthd.MSP
    FROM CHI_TIET_HOA_DON cthd
    JOIN HOA_DON hd ON cthd.MSHD = hd.MSHD
    WHERE hd.NgayMua >= DATEADD(YEAR, -5, GETDATE())
);
-- Tìm danh sách khách hàng đã mua tất cả các sản phẩm của siêu thị
SELECT kh.MSKH, kh.HoKH, kh.TenKH, kh.NgaySinh, kh.DiaChi
FROM KHACH_HANG kh
JOIN HOA_DON hd ON hd.MSKH = kh.MSKH
JOIN CHI_TIET_HOA_DON cthd ON cthd.MSHD = hd.MSHD
JOIN SAN_PHAM sp ON sp.MSP = cthd.MSP
GROUP BY kh.MSKH, kh.HoKH, kh.TenKH, kh.NgaySinh, kh.DiaChi
HAVING COUNT(DISTINCT sp.MSP) = (SELECT COUNT(*) FROM SAN_PHAM);

-- Tạo thủ tục thống kê doanh thu của một sản phẩm bất kỳ (Mã sản phẩm là tham số). Cho ví dụ minh họa
GO
CREATE PROCEDURE sp_ThongKeDoanhThuSP (@MSP VARCHAR(6))
AS
BEGIN
    SELECT sp.MSP, sp.TenSP, SUM(cthd.Soluong) AS TongSoLuong, SUM(cthd.Soluong * sp.Gia) AS TongDoanhThu
    FROM SAN_PHAM sp
    INNER JOIN CHI_TIET_HOA_DON cthd ON sp.MSP = cthd.MSP
    WHERE sp.MSP = @MSP
    GROUP BY sp.MSP, sp.TenSP;
END;
-- Ví dụ
EXEC sp_ThongKeDoanhThuSP 'SP001';
-- Tạo hàm liệt kê tên sản phẩm và tổng số lần bán ra theo năm bất kỳ. Cho ví dụ minh họa.
GO
CREATE FUNCTION fn_TongSoLanBanTheoNam (@Nam INT)
RETURNS TABLE
AS
RETURN
(
    SELECT sp.TenSP, SUM(cthd.Soluong) AS TongSoLanBan
    FROM SAN_PHAM sp
    JOIN CHI_TIET_HOA_DON cthd ON sp.MSP = cthd.MSP
    JOIN HOA_DON hd ON hd.MSHD = cthd.MSHD
    WHERE YEAR(hd.NgayMua) = @Nam
    GROUP BY sp.TenSP
);
GO
-- Ví dụ
SELECT * FROM fn_TongSoLanBanTheoNam(2025);
-- Tạo trigger kiểm tra dữ liệu khi thêm hóa đơn, sao cho mỗi khách hàng không mua quá 10 sản phẩm mỗi lần.
GO
CREATE TRIGGER tr_KiemTraSoLuongSP
ON CHI_TIET_HOA_DON
AFTER INSERT
AS
BEGIN
    DECLARE @MSKH VARCHAR(6), @TongSoLuong INT;

    IF EXISTS (SELECT 1 FROM INSERTED)
    BEGIN
        SELECT @MSKH = hd.MSKH
        FROM HOA_DON hd
        JOIN INSERTED i ON hd.MSHD = i.MSHD;

        SELECT @TongSoLuong = SUM(Soluong)
        FROM INSERTED i
        WHERE i.MSHD = (SELECT MSHD FROM HOA_DON WHERE MSKH = @MSKH);

        IF @TongSoLuong > 10
            ROLLBACK TRANSACTION;
    END
END;


