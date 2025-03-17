CREATE DATABASE QLHH;
USE QLHH;
CREATE TABLE KHACHHANG
(
	MAKHACHHANG VARCHAR(10) NOT NULL PRIMARY KEY,
	TENCONGTY NVARCHAR(100) NOT NULL,
	TENGIAODICH NVARCHAR(100) NOT NULL,
	DIACHI NVARCHAR(100) NOT NULL,
	EMAIL VARCHAR(20) NOT NULL,
	DIENTHOAI VARCHAR(20) NOT NULL,
	FAX VARCHAR(20) NOT NULL
);
CREATE TABLE NHANVIEN
(
	MANHANVIEN VARCHAR(10) NOT NULL PRIMARY KEY,
	HO NVARCHAR(10) NOT NULL,
	TEN NVARCHAR(10) NOT NULL,
	NGAYSINH DATE NOT NULL,
	NGAYLAMVIEC DATE NOT NULL,
	DIACHI NVARCHAR(20) NOT NULL,
	DIENTHOAI NVARCHAR(20),
	LUONGCOBAN MONEY NOT NULL,
	PHUCAP MONEY NOT NULL
);
CREATE TABLE NHACUNGCAP
(
	MACONGTY VARCHAR(10) NOT NULL PRIMARY KEY,
	TENCONGTY NVARCHAR(100) NOT NULL,
	TENGIAODICH NVARCHAR(100) NOT NULL,
	DIACHI NVARCHAR(100) NOT NULL,
	DIENTHOAI VARCHAR(20) NOT NULL,
	FAX VARCHAR(20) NOT NULL,
	EMAIL VARCHAR(20) NOT NULL
);
CREATE TABLE LOAIHANG
(
	MALOAIHANG VARCHAR(10) NOT NULL PRIMARY KEY,
	TENLOAIHANG NVARCHAR(100) NOT NULL
);
CREATE TABLE MATHANG
(
	MAHANG VARCHAR(10) NOT NULL PRIMARY KEY,
	TENHANG NVARCHAR(100) NOT NULL,
	MACONGTY VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES NHACUNGCAP(MACONGTY),
	MALOAIHANG VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES LOAIHANG(MALOAIHANG),
	SOLUONG DECIMAL(10,2) NOT NULL,
	DONVITINH NVARCHAR(20) NOT NULL,
	GIAHANG MONEY NOT NULL
);
CREATE TABLE DONDATHANG
(
	SOHOADON VARCHAR(10) NOT NULL PRIMARY KEY,
	MAKHACHHANG VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES KHACHHANG(MAKHACHHANG),
	MANHANVIEN VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES NHANVIEN(MANHANVIEN),
	NGAYDATHANG DATETIME,
	NGAYGIAOHANG DATETIME,
	NGAYCHUYENHANG DATETIME,
	NOIGIAOHANG NVARCHAR(100)
);
CREATE TABLE CTDATHANG
(
	SOHOADON VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES DONDATHANG(SOHOADON),
	MAHANG VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES MATHANG(MAHANG),
	GIABAN MONEY NOT NULL,
	SOLUONG DECIMAL(10,2) NOT NULL,
	MUCGIAMGIA DECIMAL(10,2) NOT NULL
);
INSERT INTO KHACHHANG VALUES
	('KH01','APPLE','EK1',N'02 ĐẠI HỌC NHA TRANG','A@ntu.edu.vn','0773582646','7721'),
	('KH02','OPPO','EK2',N'02 ĐẠI HỌC NHA TRANG','B@ntu.edu.vn','0773582645','7722'),
	('KH03','SAMSUNG','EK3',N'02 ĐẠI HỌC NHA TRANG','C@ntu.edu.vn','0773582643','7723');
INSERT INTO NHANVIEN VALUES
	('NV01',N'TRẦN',N'A','2005-02-1','2025-01-1',N'SỐ 02 NGUYỄN TRÃI','0132154812',50000000,100000),
	('NV02',N'TRẦN',N'B','2005-02-2','2025-01-2',N'SỐ 03 NGUYỄN TRÃI','0121654646',60000000,200000),
	('NV03',N'TRẦN',N'C','2005-02-3','2025-01-3',N'SỐ 04 NGUYỄN TRÃI','0321212153',70000000,300000);
INSERT INTO NHACUNGCAP VALUES
	('NCC01','APPLE','EK1','91 NGUYEN TRAI, NHA TRANG, KHANH HOA','0986453121','7721','D@gmail.com'),
	('NCC02','OPPO','EK3','12/7 VINH HAI, NHA TRANG, KHANH HOA','0982453121','7722','E@gmail.com'),
	('NCC03','SAMSUNG','EK4','37 LE THANH TON, NHA TRANG, KHANH HOA','0186453121','7723','Z@gmail.com');
INSERT INTO LOAIHANG VALUES
	('LH01','DIEN THOAI'),
	('LH02','LAPTOP'),
	('LH03','IPAD');
INSERT INTO MATHANG VALUES
	('MH01',N'DIENTHOAI','NCC01','LH01',100,N'nghìn',12000),
	('MH02',N'LAPTOP','NCC02','LH02',100,N'nghìn',12000),
	('MH03',N'IPAD','NCC03','LH03',100,N'nghìn',12000);
INSERT INTO DONDATHANG VALUES
	('DDH01','KH01','NV01','2023-07-06 09:40:30','2023-07-09 12:40:50','2023-07-09 01:20:30',N'07 2/4, NHA TRANG, KHANH HOA'),
	('DDH02','KH02','NV02','2022-11-30 08:50:40','2022-12-01 09:11:23','2022-12-01 01:20:30',N'33 NGO GIA TU, NHA TRANG, KHANH HOA'),
	('DDH03','KH03','NV03','2023-12-30 07:40:40','2024-01-01 09:13:55','2024-01-01 01:20:36',N'02 NGUYEN THIEN THUAT, NHA TRANG, KHANH HOA');
INSERT INTO CTDATHANG VALUES
	('DDH01','MH01',12000,1,0),
	('DDH02','MH02',17000,1,0),
	('DDH03','MH03',23000,2,0.3);
-- Câu 1. Cho biết danh sách các đối tác cung cấp hàng cho công ty.
-- Câu 2 (QLHH): Cho biết mã hàng, tên hàng và số lượng hiện có của các mặt hàng trong công ty.
-- Câu 3: Cho biết họ, tên, địa chỉ, và năm đầu làm việc của nhân viên
-- Câu 4(qlhh):Cho biết địa chỉ và điện thoại của nhà cung cấp có tên giao dịch VINAMILK là gì?
-- Câu 5: Cho biết mã và tên của các mặt hàng có giá > 100000 và số lượng có ít hơn 50:
-- Câu 6: Cho biết mỗi mặt hàng trong công ty do ai cũng cấp
-- Câu 7: Công Ty Việt Tiến đã cung cấp những mặt hàng nào.
-- Câu 8: Loại hàng thực phẩm do những công ty nào cung cấp và địa chỉ các công ty đó là gì? bài làm:
-- Câu 9: Những khách hàng nào (tên giao dịch) đã đặt mua mặt hàng Sữa hộp XYZ
-- Câu 10(Quản lý hàng hóa):Cho biết đơn đặt hàng số 1 do ai đặt và do nhân viên nào lập, thời gian và địa điểm giao hàng là ở đâu?
-- Câu 11. Cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu (lương = lương cơ bản + phụ cấp)
-- Câu 12: ( Quản lí hàng hoá ) : cho biết đơn đặt hàng số 3 đã đặt mua những mặt hàng nào và số tiền mà khách hàng phải trả cho mỗi mặt hàng là bao nhiêu(tienphaitra = soluong * giaban - soluong * giaban *( mucgiamgia/100 ) )
-- câu 13: Hãy cho biết những khách hàng nào lại chính là đối tác cung cấp hàng cho công ty
-- Cau 14: Trong CTY co nhung nhan vien nao co cung ngay sinh
-- Câu 15: Những đơn đặt hàng nào yêu cầu giao hàng ngay  tại công ty đặt hàng và những đơn đó là của công ty nào?
-- Câu 16: Cho biết tên công ty, tên giao dịch, địa chỉ và điện thoại của các khách hàng và các nhà cung cấp hàng cho công ty.
-- câu 17. (quản lý hàng hoá) Những mặt hàng nào chưa từng được khách hàng đặt mua?
-- Cau 18: Những nv nao cua CTY chua tung lap bat ki 1 hoa don đặt hang nào?
-- Câu 19: Những nhân viên nào của công ty có lương cơ bản cao nhất?
-- câu 20: Tổng số tiền khách hàng phải trả cho mỗi đơn đặt hàng là bao nhiêu?
-- câu 21: Trong năm 2021, những mặt hàng nào chỉ được đặt mua đúng một lần
-- Câu 22: Cho biết mỗi một khách hàng đã phải bỏ ra bao nhiêu tiền để đặt mua hàng?
-- Câu 23: Mỗi một nhân viên của công ty đã lập bao nhiêu đơn đặt hàng (nếu nhân viên chưa hề lập một hóa đơn nào thì cho kết quả là 0)
-- Câu 24: Cho biết tổng số tiền hàng mà cửa hàng thu được trong mỗi tháng của năm 2021 (thời gian  được tính theo thời gian ngày đặt hàng)
-- Câu 25: Hãy cho biết tổng số tiền lời mà công ty thu được từ mỗi mặt hàng trong năm 2021.
-- Câu 26: Hãy cho biết tổng số  lượng hàng của mỗi mặt hàng mà công ty đã có (tổng số lượng hàng hiện có và đã bán
-- câu 27: Hãy cho biết nhân viên nào của công ty bán được số lượng mặt hàng nhiều nhất  và số lượng mặt hàng bán được của những nhân viên này là bao nhiêu?
-- Câu 28: Đơn đặt hàng nào có số lượng mặt hàng được đặt mua ít nhất?
SELECT DONDATHANG.SOHOADON, SUM(CT.SOLUONG)
FROM DONDATHANG
INNER JOIN CTDATHANG CT ON DONDATHANG.SOHOADON = CT.SOHOADON
GROUP BY DONDATHANG.SOHOADON
HAVING SUM(CT.SOLUONG) <= ALL (
    SELECT SUM(CTD.SOLUONG)
    FROM DONDATHANG
    INNER JOIN CTDATHANG CTD ON DONDATHANG.SOHOADON = CTD.SOHOADON
    GROUP BY DONDATHANG.SOHOADON
);

-- Câu 29: Hiển thị  Số tiền nhiều nhất mà mỗi khách hàng đã từng bỏ ra để đặt hàng trong các đơn đặt hàng là bao nhiêu
SELECT DONDATHANG.MAKHACHHANG, MAX(CTDATHANG.GIABAN * CTDATHANG.SOLUONG) AS 'TongSoTien'
FROM DONDATHANG
INNER JOIN CTDATHANG ON DONDATHANG.SOHOADON = CTDATHANG.SOHOADON
GROUP BY DONDATHANG.MAKHACHHANG;

-- Câu 30 : Thống kê xem mỗi mặt hàng trong tháng và cả năm 2021, bán được với số lượng bao nhiêu. Kết quả hiển thị dưới dạng bảng, 2 cột đầu là mã hàng và tên bảng, các cột còn lại tương ứng với các tháng từ 1 đến 12 và cả năm.
SELECT
    MH.MAHANG,
    MH.TENHANG,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 1 THEN CTDH.SOLUONG ELSE 0 END) AS Thang1,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 2 THEN CTDH.SOLUONG ELSE 0 END) AS Thang2,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 3 THEN CTDH.SOLUONG ELSE 0 END) AS Thang3,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 4 THEN CTDH.SOLUONG ELSE 0 END) AS Thang4,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 5 THEN CTDH.SOLUONG ELSE 0 END) AS Thang5,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 6 THEN CTDH.SOLUONG ELSE 0 END) AS Thang6,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 7 THEN CTDH.SOLUONG ELSE 0 END) AS Thang7,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 8 THEN CTDH.SOLUONG ELSE 0 END) AS Thang8,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 9 THEN CTDH.SOLUONG ELSE 0 END) AS Thang9,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 10 THEN CTDH.SOLUONG ELSE 0 END) AS Thang10,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 11 THEN CTDH.SOLUONG ELSE 0 END) AS Thang11,
    SUM(CASE WHEN MONTH(DDH.NGAYDATHANG) = 12 THEN CTDH.SOLUONG ELSE 0 END) AS Thang12,
    SUM(CTDH.SOLUONG) AS CaNam
FROM
    DONDATHANG DDH
JOIN
    CTDATHANG CTDH ON DDH.SOHOADON = CTDH.SOHOADON
JOIN
    MATHANG MH ON CTDH.MAHANG = MH.MAHANG
WHERE
    YEAR(DDH.NGAYDATHANG) = 2021
GROUP BY
    MH.MAHANG, MH.TENHANG;

-- câu 31(quản lí hàng hoá) :Cập nhật lại giá trị trường NGAYCHUYENHANG của những bản ghi có NGAYCHUYENHANG chưa xác định (NULL) trong bảng DONDA THANG bằng với giá trị của trường NGAYDATHANG.
UPDATE DONDATHANG
SET NGAYCHUYENHANG = NGAYDATHANG
WHERE NGAYCHUYENHANG IS NULL;

-- Câu 32: Tăng số lượng hàng của những mặt hàng do công ty VINAMILK cung cấp lên gấp đôi.
UPDATE MATHANG
SET SOLUONG = SOLUONG * 2
WHERE MACONGTY IN (
    SELECT MACONGTY
    FROM NHACUNGCAP
    WHERE TENCONGTY = N'VINAMILK'
);

-- Câu 33: Cập nhật giá trị của trường NOIGIAOHANG trong bảng ĐONATHANG bằng địa chỉ của khách hàng đối với những đơn đặt hàng chưa xác định được nơi giao hàng (giá trị trường NOIGIAOHANG bằng NULL).
UPDATE DONDATHANG
SET NOIGIAOHANG = KHACHHANG.DIACHI
FROM DONDATHANG
INNER JOIN KHACHHANG ON DONDATHANG.MAKHACHHANG = KHACHHANG.MAKHACHHANG
WHERE DONDATHANG.NOIGIAOHANG IS NULL;

-- Câu 34: Cập nhật lại dữ liệu trong bảng KHACHHANG sao cho nếu tên công tu và tên giao dịch khách hàng trùng với tên công ty và tên giao dịch của một nhà cung cấp nào đó thì địa chỉ, điện thoại, fax và e-mail phải giống nhau:
UPDATE KHACHHANG
SET DIACHI = NC.DIACHI,
    EMAIL = NC.EMAIL,
    DIENTHOAI = NC.DIENTHOAI,
    FAX = NC.FAX
FROM KHACHHANG KH
INNER JOIN NHACUNGCAP NC ON KH.TENCONGTY = NC.TENCONGTY AND KH.TENGIAODICH = NC.TENGIAODICH;

-- câu 35 : Tăng lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 100 trong năm 2018
UPDATE NHANVIEN SET LUONGCOBAN = LUONGCOBAN * 2
WHERE MANHANVIEN IN (
    SELECT DISTINCT NV.MANHANVIEN
    FROM NHANVIEN NV
    JOIN DONDATHANG DDH ON NV.MANHANVIEN = DDH.MANHANVIEN
    JOIN CTDATHANG CTDH ON DDH.SOHOADON = CTDH.SOHOADON
    WHERE YEAR(NGAYDATHANG) = 2018
    GROUP BY NV.MANHANVIEN
    HAVING SUM(SOLUONG) > 100
);
-- Câu 36:  Tăng phụ cấp lên bằng 25% lương cho những nhân viên bán được hàng nhiều nhất
UPDATE NHANVIEN
SET PHUCAP = PHUCAP + (LUONGCOBAN * 0.25)
WHERE MANHANVIEN IN (
    SELECT TOP 1 WITH TIES MANHANVIEN
    FROM CTDATHANG
    JOIN DONDATHANG ON CTDATHANG.SOHOADON = DONDATHANG.SOHOADON
    GROUP BY MANHANVIEN
    ORDER BY COUNT(*) DESC
);

-- Câu 37(Quản lý hàng hoá): giảm 25% lương của những nhân viên trong năm 2018 không lặp được bất kỳ đơn đặt hàng nào?
UPDATE NHANVIEN
SET LUONGCOBAN = LUONGCOBAN * 0.75
WHERE MANHANVIEN NOT IN (
    SELECT MANHANVIEN
    FROM DONDATHANG
    WHERE YEAR(NGAYDATHANG) = 2018
);

-- Câu 38: Giả sử trong bảng DONDATHANG có thêm trường SOTIEN cho biết số tiền mà khách hàng phải trả cho mỗi đơn đặt hàng. Hãy tính giá trị cho trường này.
ALTER TABLE DONDATHANG
ADD SOTIEN Money;
UPDATE DONDATHANG
SET SOTIEN = (SELECT SUM((GIABAN * (1 - MUCGIAMGIA/100)) * SOLUONG) FROM CTDATHANG WHERE CTDATHANG.SOHOADON = DONDATHANG.SOHOADON);

-- Câu 39: Xóa khỏi bảng NHANVIEN những nhân viên đã làm việc trong công ty quá 40 năm.
DELETE FROM NHANVIEN
WHERE DATEDIFF(year, NGAYLAMVIEC, GETDATE()) > 40;

-- Câu 40: Xóa những đơn hàng trước năm 2022 ra khỏi cơ sở dữ liệu trên.
DELETE FROM CTDATHANG
WHERE SOHOADON IN (
    SELECT SOHOADON
    FROM DONDATHANG
    WHERE YEAR(NGAYDATHANG) < 2022
);

-- Câu 41: Xóa khỏi bảng LOAIHANG những loại hàng hiện không có mặt hàng
DELETE FROM LOAIHANG
WHERE NOT EXISTS (
    SELECT 1 FROM MATHANG
    WHERE LOAIHANG.MaLoaiHang = MATHANG.MaLoaiHang
);

-- Câu 42:  Xóa khỏi bảng KHACHHANG những khách hàng hiện không có bất kỳ đơn đặt hàng nào cho công ty
DELETE FROM KHACHHANG
WHERE NOT EXISTS (
    SELECT 1
    FROM DONDATHANG
    WHERE DONDATHANG.MAKHACHHANG = KHACHHANG.MAKHACHHANG
);

-- Câu 43: Xóa khỏi bảng MATHANG những mặt hàng có số lượng bằng 0 và không được đặt mua trong bất kỳ đơn đặt hàng nào.
DELETE FROM MATHANG
WHERE SOLUONG = 0
AND MAHANG NOT IN (
    SELECT MAHANG
    FROM CTDATHANG
);
