CREATE DATABASE QLBONGDA;
USE QLBONGDA;

CREATE TABLE TINH
(
	MATINH VARCHAR(5) NOT NULL PRIMARY KEY,
	TENTINH NVARCHAR(100) NOT NULL
);
CREATE TABLE SANVD
(
	MASAN VARCHAR(5) NOT NULL PRIMARY KEY,
	TENSAN NVARCHAR(100) NOT NULL,
	DIACHI NVARCHAR(200) NOT NULL
);
CREATE TABLE QUOCGIA
(
	MAQG VARCHAR(5) NOT NULL PRIMARY KEY,
	TENQG NVARCHAR(60) NOT NULL
);
CREATE TABLE CAULACBO
(
	MACLB VARCHAR(5) NOT NULL PRIMARY KEY,
	TENCLB NVARCHAR(100) NOT NULL,
	MASAN VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES SANVD(MASAN),
	MATINH VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES TINH(MATINH)	
);
CREATE TABLE CAUTHU
(
	MACT NUMERIC IDENTITY(1,1) PRIMARY KEY,
	HOTEN NVARCHAR(100) NOT NULL,
	VITRI NVARCHAR(20) NOT NULL,
	NGAYSINH DATETIME,
	DIACHI NVARCHAR(200) NULL,
	MACLB VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES CAULACBO(MACLB),
	MAQG VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES QUOCGIA(MAQG),
	SO INT NOT NULL
);
CREATE TABLE HUANLUYENVIEN
(
	MAHLV VARCHAR(5) NOT NULL PRIMARY KEY,
	TENHLV NVARCHAR(100) NOT NULL,
	NGAYSINH DATETIME,
	DIACHI NVARCHAR(200) NULL,
	DIENTHOAI NVARCHAR(20) NOT NULL,
	MAQG VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES QUOCGIA(MAQG)
);
CREATE TABLE HLV_CLB
(
	MAHLV VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES HUANLUYENVIEN(MAHLV),
	MACLB VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES CAULACBO(MACLB),
	VAITRO NVARCHAR(100) NOT NULL,
	PRIMARY KEY(MAHLV,MACLB),
);
CREATE TABLE BANGXH
(
	MACLB VARCHAR(5) NOT NULL FOREIGN KEY REFERENCES CAULACBO(MACLB),
	NAM INT NOT NULL,
	VONG INT NOT NULL,
	SOTRAN INT NOT NULL,
	THANG INT NOT NULL,
	HOA INT NOT NULL,
	THUA INT NOT NULL,
	HIEUSO VARCHAR(5),
	DIEM INT NOT NULL,
	HANG INT NOT NULL,
	PRIMARY KEY (MACLB,NAM,VONG)
);
CREATE TABLE TRANDAU
(
	MATRAN NUMERIC NOT NULL PRIMARY KEY,
	NAM INT NOT NULL,
	VONG INT NOT NULL,
	NGAYTD DATETIME NOT NULL,
	MACLB1 VARCHAR(5) FOREIGN KEY REFERENCES CAULACBO(MACLB),
	MACLB2 VARCHAR(5) FOREIGN KEY REFERENCES CAULACBO(MACLB),
	MASAN VARCHAR(5) FOREIGN KEY REFERENCES SANVD(MASAN),
	KETQUA VARCHAR(5) NOT NULL
);
INSERT INTO TINH VALUES
	('BD',N'Bình Dương'),
	('GL',N'Gia Lai'),
	('DN',N'Đà Nẵng'),
	('KH',N'Khánh Hòa'),
	('PY',N'Phú Yên'),
	('LA',N'Long An');
INSERT INTO SANVD VALUES
	('GD',N'Gò Đậu',N'123 QL1,  TX Thủ Dầu Một, Bình Dương'),
	('PL',N'Pleiku',N'22 Hồ Tùng Mậu, Thống Nhất, Thĩ xã Pleiku, Gia Lai'),
	('CL',N'Chi Lăng',N'127 Võ Văn Tần, Đà Nẵng'),
	('NT',N'Nha Trang',N'128 Phan Chu Trinh, Nha Trang, Khánh Hòa'),
	('TH',N'Tuy Hòa',N'57 Trường Chinh, Tuy Hòa, Phú Yên'),
	('LA',N'Long An',N'102 Hùng Vương, Tp Tân An, Long An');
INSERT INTO QUOCGIA VALUES
	('VN',N'Việt Nam'),
	('ANH',N'Anh Quốc'),
	('TBN',N'Tây Ban Nha'),
	('BDN',N'Bồ Đào Nha'),
	('BRA',N'Bra-xin'),
	('ITA',N'Ý'),
	('THA',N'Thái Lan');
INSERT INTO CAULACBO VALUES
	('BBD',N'BECAMEX BÌNH DƯƠNG','GD','BD'),
	('HAGL',N'HOÀNG ANH GIA LAI','PL','GL'),
	('SDN',N'SHB ĐÀ NẴNG','CL','DN'),
	('KKH',N'KHATOCO KHÁNH HÒA','NT','KH'),
	('TPY',N'THÉP PHÚ YÊN','TH','PY'),
	('GDT',N'GẠCH ĐỒNG TÂM LONG','LA','LA');
INSERT INTO CAUTHU VALUES
	(N'Nguyễn Vũ Phong',N'Tiền vệ','1990-02-20','BBD','VN',17),
	(N'Nguyễn Công Vinh',N'Tiền đạo','1992-03-10','HAGL','VN',9),
	(N'Trần Tấn Tài',N'Tiền vệ','1999-11-12','BBD','VN',8),
	(N'Phan Hồng Sơn',N'Thủ môn','1991-06-10','HAGL','VN',1),
	(N'Ronaldo',N'Tiền vệ','1989-12-12','SDN','BRA',7),
	(N'Robinho',N'Tiền vệ','1989-10-12','SDN','BRA',8),
	(N'Vidic',N'Hậu vệ','1987-10-15','HAGL','ANH',3),
	(N'Trần Văn Santos',N'Thủ môn','1990-10-21','BBD','BRA',1),
	(N'Nguyễn Trường Sơn',N'Hậu vệ','1993-8-26','BBD','VN',4);
INSERT INTO HUANLUYENVIEN VALUES
	('HLV01',N'Vital','1975-10-15',N'0918011075','BDN'),
	('HLV02',N'Lê Huỳnh Đức','1972-05-20',N'01223456789','VN'),
	('HLV03',N'Kiatisuk','1970-12-11',N'01990123456','THA'),
	('HLV04',N'Hoàng Anh Tuấn','1970-06-10',N'0989112233','VN'),
	('HLV05',N'Trần Công Minh','1973-07-07',N'0909099990','VN'),
	('HLV06',N'Trần Văn Phúc','1975-03-02',N'01650101234','VN');
	INSERT INTO HLV_CLB VALUES
	('HLV01','BBD',N'HLV Chính'),
	('HLV02','SDN',N'HLV Chính'),
	('HLV03','HAGL',N'HLV Chính'),
	('HLV04','KKH',N'HLV Chính'),
	('HLV05','GDT',N'HLV Chính'),
	('HLV06','BBD',N'HLV Thủ môn');
INSERT INTO BANGXH VALUES
	('BBD',2023,1,1,1,0,0,'3-0',3,1),
	('KKH',2023,1,1,0,1,0,'1-1',1,2),
	('GDT',2023,1,1,0,1,0,'1-1',1,3),
	('TPY',2023,1,0,0,0,0,'0-0',0,4),
	('SDN',2023,1,1,0,0,1,'0-3',0,5),
	('TPY',2023,2,1,1,0,0,'5-0',3,1),
	('BBD',2023,2,2,1,0,1,'3-5',3,2),
	('KKH',2023,2,2,0,2,0,'3-3',2,3),
	('GDT',2023,2,1,0,1,0,'1-1',1,4),
	('SDN',2023,2,2,1,1,0,'2-5',1,5),
	('BBD',2023,3,3,2,0,1,'4-5',6,1),
	('GDT',2023,3,2,1,1,0,'3-1',4,2),
	('TPY',2023,3,2,1,0,1,'5-2',3,3),
	('KKH',2023,3,3,0,2,1,'3-4',2,4),
	('SDN',2023,3,2,1,1,0,'2-5',1,5),
	('BBD',2023,4,4,2,1,1,'6-7',7,1),
	('GDT',2023,4,3,1,2,0,'5-1',5,2),
	('KKH',2023,4,4,1,2,1,'4-4',5,3),
	('TPY',2023,4,3,1,0,2,'5-3',3,4),
	('SDN',2023,4,2,1,1,0,'2-5',1,5);
INSERT INTO TRANDAU VALUES
	(1,2023,1,'2023-2-7','BBD','SDN','GD','3-0'),
	(2,2023,1,'2023-2-7','KKH','GDT','NT','1-1'),
	(3,2023,2,'2023-2-16','SDN','KKH','CL','2-2'),
	(4,2023,2,'2023-2-16','TPY','BBD','TH','5-0'),
	(5,2023,3,'2023-3-1','TPY','GDT','TH','0-2'),
	(6,2023,3,'2023-3-1','KKH','BBD','NT','0-1'),
	(7,2023,4,'2023-3-7','KKH','TPY','NT','1-0'),
	(8,2023,4,'2023-3-7','BBD','GDT','GD','2-2');
-- Câu 1: Cho biết thông tin (mã cầu thủ, họ tên , số áo. vị trí , ngày sinh , đại chỉ) của tất cả các cầu thủ.
-- Câu 2: Hiển thị thông tin tất cả các cầu thủ có số áo là 7 chơi ở vị trí tiền vệ.
-- Câu 3: Cho biết tên, ngày sinh, địa chỉ, điện thoại của tất cả các huấn luyện viên.
-- Câu 4: Hiển thị thông tin tất cả các cầu thủ có quốc tịch Việt Nam thuộc câu lạc bộ Becamex Bình Dương
-- Câu 5. Cho biết mã số, họ tên, ngày sinh, địa chỉ và vị trí của các cầu thủ thuộc đội bóng "SHB Đà Nẵng” có quốc tịch "Bra-xin".
-- Câu 6. Hiển thị thông tin các cầu thủ đang thi đấu trong câu lạc bộ sân nhà “Long An”.
-- Câu 7: Cho biết kết quả(MATRAN, NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA) các trận đấu vòng 2 của mùa bóng năm 2021
-- Câu 8: Cho biết mã HLV, họ tên, ngày sinh, địa chỉ, vai trò, và tên CLB đang làm việc của các hlv có quốc tịch "Việt Nam"
-- Câu 9: Lấy tên 3 câu lạc bộ có điểm cao nhất sau vòng 3 năm 2023.
-- Câu 10: Cho biết mã huấn luyện viên,họ tên ngày sinh , địa chỉ vai trò và tên clb đang làm việc mà câu lạc bộ đó đóng ở tỉnh Bình Dương.
-- Câu 11:  Thống kê số lượng cầu thủ của mỗi câu lạc bộ.
-- Câu 12: Thống kê số lượng cầu thủ nước ngoài(có quốc tịch khác Việt Nam) của mỗi câu lạc bộ
-- Câu 13: Cho biết mã câu lạc bộ, tên câu lạc bộ, tên sân vận động, địa chỉ và số lượng cầu thủ nước ngoài (có quốc tịch khác "Viet Nam") tương ứng của các câu lạc bộ có nhiều hơn 2 cầu thủ nước ngoài.
-- Câu 14:Cho biết tên tỉnh, số lượng cầu thủ đang thi đấu ở vị trí tiền đạo trong các câu lạc bộ thuộc địa bàn tỉnh đó quản lý.
-- Câu 15:Cho biết tên câu lạc bộ, tên tỉnh mà CLB đang đóng nằm ở vị trí cao nhất của bảng xếp hạng của vòng 3, năm 2023.
-- Câu 16:Cho biết tên huấn luyện viên đang nắm giữ một vị trí trong một câu lạc bộ mà chưa có số điện thoại
-- Câu 17. Liệt kê các huấn luyện viên thuộc quốc gia Việt Nam chưa làm công tác huấn luyện tại bất kỳ 1 câu lạc bộ nào.
-- Câu 18: Liệt kê các cầu thủ đang thi đấu trong các câu lạc bộ có thứ hạng ở vòng 3 năm 2023 lớn hơn 6 hoặc nhỏ hơn 3
-- Câu 19. Cho biết danh sách các trận đấu (NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA) của câu lạc bộ CLB đang xếp hạng cao nhất tính đến hết vòng 3 năm 2023.
-- Câu 20: Cho biết NGAYTD, TENSAN, TENCLB1, TENCLB2, KETQUA các trận đấu diễn ra vào tháng 3 trên sân nhà mà không bị thủng lưới
-- Câu 21: Cho biết mã số,  họ tên, ngày sinh của những cầu thủ có họ lót là "Công"
-- Câu 22: Cho biết mã số,  họ tên, ngày sinh của những cầu thủ có họ không phải là họ "Nguyễn"
-- Câu 23 Cho biết mã huấn luyện viên,họ tên,ngày sinh,địa chỉ của những huấn luyện viên Việt Nam có tuổi nằm trong khoảng 35-40
-- Câu 24.Cho biết tên câu lạc bộ có huấn luyện viên trưởng sinh vào ngày 20 tháng 5
-- Câu 25 Cho biết tên câu lạc bộ, tên tỉnh mà CLB đang đóng có số bàn thắng nhiều nhất tính đến hết vòng 3 năm 2021
SELECT CLB.TENCLB, TINH.TENTINH
FROM BANGXH BX
JOIN CAULACBO CLB ON BX.MACLB = CLB.MACLB
JOIN TINH ON CLB.MATINH = TINH.MATINH
WHERE BX.NAM = 2023 AND BX.VONG <= 3
GROUP BY CLB.TENCLB, TINH.TENTINH
HAVING SUM(BX.THANG) = (
    SELECT MAX(TOTAL_THANG)
    FROM (
        SELECT SUM(THANG) AS TOTAL_THANG
        FROM BANGXH
        WHERE NAM = 2023 AND VONG <= 3
        GROUP BY MACLB
    ) AS MAX_THANG
);

-- Câu 26 Cho biết mã câu lạc bộ, tên câu lạc bộ, tên sân vận động, địa chỉ và số lượng cầu thủ nước ngoài(có quốc tịch khác "Việt Nam") tương ứng của các câu lạc bộ có nhiều hơn 2 cầu thủ nước ngoài
SELECT CLB.MACLB, CLB.TENCLB, SANVD.TENSAN, SANVD.DIACHI,
COUNT(CASE WHEN CT.MAQG <> 'VN' THEN 1 END) AS 'SO_LUONG_CTNNUOCNGOAI'
FROM CAULACBO CLB
JOIN SANVD ON CLB.MASAN = SANVD.MASAN
JOIN CAUTHU CT ON CLB.MACLB = CT.MACLB
GROUP BY CLB.MACLB, CLB.TENCLB, SANVD.TENSAN, SANVD.DIACHI
HAVING COUNT(CASE WHEN CT.MAQG <> 'VN' THEN 1 END) > 2;

-- Câu 27: Cho biết tên câu lạc bộ, tên tỉnh mà CLB đang đóng có hiệu số bàn thắng bại cao nhất năm 2021:
SELECT TOP 1 CAULACBO.TENCLB, TINH.TENTINH
FROM CAULACBO
JOIN TINH ON CAULACBO.MATINH = TINH.MATINH
JOIN BANGXH ON CAULACBO.MACLB = BANGXH.MACLB
WHERE BANGXH.NAM = 2021
ORDER BY ABS(BANGXH.THANG - BANGXH.THUA) DESC;

-- Câu 28: Cho biết danh sách các trận đấu (NGAYTD, TENSAN, TENCLB1, TENCLB2,( KETQUA) của câu lạc bộ CLB có thứ "hạng" thấp nhất trong "bảng xếp hạng" vòng 3 năm 2021
SELECT TRANDAU.NGAYTD, SANVD.TENSAN, CLB1.TENCLB AS TENCLB1, CLB2.TENCLB AS TENCLB2, BANGXH.HIEUSO AS KETQUA
FROM TRANDAU
JOIN SANVD ON TRANDAU.MASAN = SANVD.MASAN
JOIN CAULACBO AS CLB1 ON TRANDAU.MACLB1 = CLB1.MACLB
JOIN CAULACBO AS CLB2 ON TRANDAU.MACLB2 = CLB2.MACLB
JOIN BANGXH ON TRANDAU.MACLB1 = BANGXH.MACLB
WHERE BANGXH.NAM = 2021 AND BANGXH.VONG = 3
AND BANGXH.HANG = (SELECT MAX(HANG) FROM BANGXH WHERE NAM = 2021 AND VONG = 3);

-- Câu 29:( QLBD) Cho biết mã câu lạc bộ, tên câu lạc bộ đã tham gia thi đấu với tất cả các câu lạc bộ còn lại ( kể cả sân nhà và sân khách) trong mùa giải năm 2021.
SELECT DISTINCT c1.MACLB, clb.TENCLB
FROM CAULACBO clb
JOIN TRANDAU t1 ON clb.MACLB = t1.MACLB1
JOIN TRANDAU t2 ON clb.MACLB = t2.MACLB2
JOIN CAULACBO c1 ON t1.MACLB2 = c1.MACLB AND t1.MASAN = c1.MASAN
JOIN CAULACBO c2 ON t2.MACLB1 = c2.MACLB AND t2.MASAN = c2.MASAN
WHERE t1.NAM = 2021 AND t2.NAM = 2021;

-- Câu 30:( QLBD) Cho biết mã câu lạc bộ, tên câu lạc bộ đã tham gia thi đấu với tất cả các câu lạc bộ còn lại ( chỉ tính sân nhà) trong mùa giải năm 2021.
SELECT DISTINCT A.MACLB, A.TENCLB
FROM CAULACBO A
WHERE NOT EXISTS (
    SELECT *
    FROM CAULACBO B
    WHERE A.MACLB <> B.MACLB
    AND NOT EXISTS (
        SELECT *
        FROM TRANDAU TD
        WHERE (TD.MACLB1 = A.MACLB AND TD.MACLB2 = B.MACLB)
        AND TD.NAM = 2021
    )
);

-- Câu 31  Khi thêm cầu thủ mới, kiểm tra vị trí trên sân của cần thủ chỉ thuộc một trong các vị trí sau: Thủ môn, Tiền đạo, Tiền vệ, Trung vệ, Hậu vệ.

ALTER TABLE CAUTHU
ADD CONSTRAINT CHK_VITRI CHECK (VITRI IN (N'Thủ môn', N'Tiền đạo', N'Tiền vệ', N'Trung vệ', N'Hậu vệ'));

-- Câu 32 - Khi phân công huấn luyện viên, kiểm tra vai trò của huấn luyên viên chỉ thuộc một trong các vai trò sau : HLV chính, HLV phụ, HLV thể lực, HLV thủ môn
ALTER TABLE HLV_CLB
ADD CHECK (VAITRO IN (N'HLV CHÍNH', N'HLV PHỤ', N'HLV THỂ LỰC', N'HLV THỦ MÔN'));

-- Câu 33: (QLBD) Khi thêm cầu thủ mới, kiểm tra cầu thủ đó có tuổi phải đủ 18 trở lên ( chỉ tính năm sinh ).
ALTER TABLE CAUTHU
ADD CHECK (DATEDIFF(YEAR, NGAYSINH, GETDATE()) >= 18)

-- Câu 34(QLBD): kiểm tra kết quả có dạng số_bàn_thắng-số_bàn_thua
SELECT
    TRANDAU.MATRAN,
    TRANDAU.NGAYTD,
    CONCAT(BANGXH.THANG, '-', BANGXH.THUA) AS KETQUA
FROM
    TRANDAU
INNER JOIN
    BANGXH ON TRANDAU.MACLB1 = BANGXH.MACLB AND TRANDAU.NAM = BANGXH.NAM AND TRANDAU.VONG = BANGXH.VONG