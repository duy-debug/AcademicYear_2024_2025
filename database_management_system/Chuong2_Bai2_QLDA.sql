﻿-- 2.1. Tạo database QLDA
CREATE DATABASE QLDA;
-- 2.2. Tạo bảng
USE QLDA;
CREATE TABLE NHANVIEN
(
	MANV VARCHAR(5) NOT NULL,
	HONV NVARCHAR(20) NOT NULL,
	TENLOT NVARCHAR(20) NOT NULL,
	TENNV NVARCHAR(10) NOT NULL,
	NGAYSINH DATE NOT NULL,
	DIACHI NVARCHAR(100) NOT NULL,
	PHAI VARCHAR(5) NOT NULL,
	LUONG DECIMAL(10,2) NOT NULL,
	MAPB VARCHAR(5) NOT NULL,
	CONSTRAINT nhanvien_pk PRIMARY KEY (MANV)
);
CREATE TABLE THANNHAN
(
	MANV VARCHAR(5) NOT NULL,
	TENTN NVARCHAR(30) NOT NULL,
	PHAI VARCHAR(5) NOT NULL,
	NGAYSINH DATE NOT NULL,
	QUANHE NVARCHAR(20) NOT NULL,
	CONSTRAINT thannhan_pk PRIMARY KEY (MANV, TENTN)
);
CREATE TABLE DEAN
(
	MADA VARCHAR(5) NOT NULL,
	TENDA NVARCHAR(50) NOT NULL,
	DDIEM_DA NVARCHAR(100) NOT NULL,
	MAPB VARCHAR(5) NOT NULL,
	CONSTRAINT dean_pk PRIMARY KEY (MADA)
);
CREATE TABLE DDIEMPB
(
	MAPB VARCHAR(5) NOT NULL,
	DIADIEM NVARCHAR(100) NOT NULL,
	CONSTRAINT ddiempb_pk PRIMARY KEY (MAPB, DIADIEM)
);
CREATE TABLE PHANCONG
(
	MANV VARCHAR(5) NOT NULL,
	MADA VARCHAR(5) NOT NULL,
	THOIGIAN DECIMAL(5,1) NOT NULL,
	CONSTRAINT phancong_pk PRIMARY KEY (MANV, MADA)
);
CREATE TABLE PHONGBAN
(
	MAPB VARCHAR(5) NOT NULL,
	TENPB NVARCHAR(50) NOT NULL,
	TRUONGPHONG VARCHAR(5) NULL,
	NG_NHANCHUC DATE NULL,
	CONSTRAINT phongban_pk PRIMARY KEY (MAPB)
);
ALTER TABLE NHANVIEN
ADD CONSTRAINT nhanvien_mapb_fk FOREIGN KEY (MAPB) REFERENCES PHONGBAN (MAPB);

ALTER TABLE PHONGBAN
ADD CONSTRAINT phongban_truongphong_fk FOREIGN KEY (TRUONGPHONG) REFERENCES NHANVIEN (MANV);

ALTER TABLE DDIEMPB
ADD CONSTRAINT ddiempb_mapb_fk FOREIGN KEY (MAPB) REFERENCES PHONGBAN (MAPB);

ALTER TABLE DEAN
ADD CONSTRAINT dean_mapb_fk FOREIGN KEY (MAPB) REFERENCES PHONGBAN (MAPB);

ALTER TABLE THANNHAN
ADD CONSTRAINT thannhan_manv_fk FOREIGN KEY (MANV) REFERENCES NHANVIEN (MANV);

ALTER TABLE PHANCONG
ADD CONSTRAINT phancong_manv_fk FOREIGN KEY (MANV) REFERENCES NHANVIEN (MANV),
	CONSTRAINT phancong_mada_fk FOREIGN KEY (MADA) REFERENCES DEAN (MADA);
-- 2.4. Nhập dữ liệu
INSERT INTO PHONGBAN 
VALUES
    ('P1', N'QUANLY'),
    ('P2', N'DIEUHANH'),
    ('P3', N'NGHIENCUU');
INSERT INTO NHANVIEN 
VALUES
	('NV1',N'DINH',N'BA',N'TIEN','1985-01-09',N'731 Tran Hung Dao,q1,TPHCM','NAM',30000,'P3'),
	('NV2',N'VO',N'THANH',N'TUNG','1975-12-08',N'638 Tran Hung Dao','NAM',40000,'P3'),
	('NV3',N'TRAN',N'THANH',N'TAM','1982-07-31',N'853 Mai Thi Luu,Q1,TPHCM','NAM',25000,'P2'),
	('NV4',N'VO',N'MANH',N'HUNG','1972-09-15',N'975 Ba Ria,Vung Tau','NAM',38000,'P2'),
	('NV5',N'LE',N'NGOC',N'QUYEN','1987-10-10',N'450 Trung Vuong,Ha Noi','NU',55000,'P1'),
	('NV6',N'TRAN',N'MINH',N'KHANG','1982-06-24',N'Tran Binh Trong,TPHCM','NAM',58000,'P1'),
	('NV7',N'LE',N'THI',N'NHAN','1981-06-20',N'291 Ho Van Huc,QPN,TPHCM','NU',43000,'P3'),
	('NV8',N'TRAN',N'HONG',N'QUANG','1979-03-29',N'980 Le Hong Phong,Q10,TPHCM','NAM',25000,'P2'),
	('NV9',N'BUI',N'THUY',N'VU','1978-07-19',N'332 Nguyen Thai Hoc,Q1,TPHCM','NU',25000,'P1');
-- Update TRUONGPHONG and NG_NHANCHUC for specific records
UPDATE PHONGBAN 
SET TRUONGPHONG = 'NV5', NG_NHANCHUC = '2016-06-19'
WHERE MAPB = 'P1';
UPDATE PHONGBAN 
SET TRUONGPHONG = 'NV8', NG_NHANCHUC = '2018-01-01'
WHERE MAPB = 'P2';
UPDATE PHONGBAN 
SET TRUONGPHONG = 'NV2', NG_NHANCHUC = '2017-05-22'
WHERE MAPB = 'P3';

INSERT INTO DEAN 
VALUES
	('DA1',N'San Pham X',N'VUNG TAU','P3'),
	('DA2',N'San Pham Y',N'NHA TRANG','P3'),
	('DA3',N'San Pham Z',N'TPHCM','P3'),
	('DA4',N'Tin hoc hoa',N'HA NOI','P2'),
	('DA5',N'Cap quang',N'TPHCM','P1'),
	('DA6',N'Dao tao',N'HA NOI','P2');
INSERT INTO DDIEMPB
VALUES
	('P1',N'TPHCM'),
	('P2',N'HA NOI'),
	('P3',N'NHA TRANG'),
	('P3',N'TPHCM'),
	('P3',N'VUNG TAU');
INSERT INTO PHANCONG
VALUES
	('NV1','DA1',32.5),
	('NV1','DA2',7.5),
	('NV1','DA3',10),
	('NV2','DA3',40),
	('NV2','DA4',20),
	('NV2','DA5',20),
	('NV3','DA1',20),
	('NV3','DA2',20),
	('NV4','DA3',10),
	('NV5','DA4',10),
	('NV5','DA5',10),
	('NV7','DA6',30),
	('NV8','DA4',10),
	('NV8','DA6',20),
	('NV9','DA4',15);
INSERT INTO THANNHAN
VALUES
	('NV1',N'DINH BA KIEN','NAM','1995-07-15',N'CON TRAI'),
	('NV1',N'NGUYEN THANH THAO','NU','1988-04-08',N'VỢ'),
	('NV2',N'VO THANH SON','NAM','1950-09-23',N'CHA'),
	('NV3',N'LE THI HUONG','NU','1984-01-09',N'VỢ'),
	('NV3',N'TRAN LE NGOC HOA','NU','2017-09-12',N'CON GÁI'),
	('NV6',N'TRAN MINH AN','NAM','1980-08-05',N'ANH TRAI'),
	('NV7',N'LE THI NGAN','NU','1980-06-07',N'EM GÁI'),
	('NV9',N'TRAN QUOC VUONG','NAM','1975-05-05',N'CHỒNG')
--Chương3_Bai2_Query
--Phần cơ bản
-- Câu 1: Cho biết tên, tuổi của từng nhân viên
SELECT TENNV, 
       DATEDIFF(YEAR, NGAYSINH, GETDATE())- 
       CASE 
           WHEN (MONTH(NgaySinh) > MONTH(GETDATE())) OR 
		   (MONTH(NgaySinh) = MONTH(GETDATE()) AND 
		   DAY(NgaySinh) > DAY(GETDATE())) 
           THEN 1 ELSE 0 
		   END AS Tuoi
FROM NHANVIEN;
-- Câu 2: Cho biết thông tin về những người có phái là nam và địa chỉ trên đường "Tran Hung Dao"
-- Câu 3: Cho biết những người có họ là "Le" và tên bắt đầu bằng ký tự "N".
-- Câu 4: Cho biết những người có ngày sinh trong tháng 7  năm 1978
-- câu 5 : Hãy cho biết những người có ngày sinh trong quý 3
-- Câu 6: Cho biết số đề án được phân công của từng nhân viên (gồm mã số, tên, số lượng đề án được phân công)
-- Câu 7: Cho biết tên nhân viên có từ 2 thân nhân trơ lên.
-- Câu 8: Tên nhân viên >= 30 tuổi được phân công làm việc cho đề án ở TPHCM.
-- Câu 9: Cho biết bao nhieu de an o tphcm
-- Câu 10: (Quản lý đề án): Đối với mỗi thành phố, cho biết tên và số lượng đề án được thực hiện ở đó.
-- Câu 11: Cho biết số năm thâm niên (số năm làm việc) của từng trưởng phòng.
-- Câu 12: Cho biết số lượng địa điểm của từng phòng ban:
-- Câu 13: cho biết có bao nhiêu tên đề án là sản phẩm
-- Câu 14: Cho biết tên phòng, địa điểm phòng, tên đề án, địa điểm đề án của những đề án có địa điểm của đề án trùng với địa điểm của phòng.	
-- Câu 15: Ten truong phong co luong thap hon luong trung binh nhan vien trong phong do
-- Câu 16: Xóa các nhân viên có số thân nhân >=3.
-- Câu 17: Mã nhân viên "NV5" có mức lương cao nhất hay không? (Trả lời "có" hay "không).
-- câu 18: Tên nhân viên đã có gia đình(thân nhân) nhưng chưa có con
-- Câu 19: Đối với từng đề án, cho biết tên nhân viên, tên đề án, số giờ làm việc nhiều nhất
-- Câu 20: Ten nhan vien lam tat ca cac de an o Ha Noi
-- Câu 21: Ten phong ban co truong phong la nu
-- Câu 22: Đối với từng đề án, cho biết số lượng nhân viên tham gia đề án, tổng số giờ làm việc của đề án
-- Câu 23: Đối với từng phòng ban, cho biết tên phòng ban, tổng số nam, tổng số nữ
-- Câu 24: Ten phong ban co nhieu nv nu nhat
-- Câu 25: Viết query in ra Nhân viên có mã số là 'NV4' lớn tuổi nhất hay không? (Trả lời "Có"/"Không") thôi
-- Câu 26: Đối với từng phòng ban, cho biết tên phòng ban,
--lương trung bình của nữ nhân viên, lương trung bình của nam nhân viên.
SELECT PB.MAPB, TENPB, CASE WHEN [LUONG TB NU] IS NULL
THEN 0 ELSE [LUONG TB NU] END AS [LUONG TB NU],
CASE WHEN [LUONG TB NAM] IS NULL THEN 0
ELSE [LUONG TB NAM] END AS [LUONG TB NAM]
FROM PHONGBAN PB FULL JOIN (SELECT MAPB, AVG(LUONG)
AS [LUONG TB NU] FROM NHANVIEN WHERE PHAI = 'NU'
GROUP BY MAPB) NU ON PB.MAPB = NU.MAPB
FULL JOIN (SELECT MAPB, AVG(LUONG) AS [LUONG TB NAM] FROM NHANVIEN
WHERE PHAI = 'NAM' GROUP BY MAPB) NAM ON PB.MAPB = NAM.MAPB;

-- Câu 28: Tên và địa chỉ các nhân viên làm việc cho một đề án ở thành phố nhưng địa điểm phòng ban mà họ trực thuộc đều không ở trong thành phố đó
SELECT NHANVIEN.TENNV, NHANVIEN.DIACHI
FROM NHANVIEN
JOIN DEAN ON NHANVIEN.MAPB = DEAN.MAPB
JOIN DDIEMPB ON NHANVIEN.MAPB = DDIEMPB.MAPB
JOIN PHONGBAN ON NHANVIEN.MAPB = PHONGBAN.MAPB
WHERE DEAN.DDIEM_DA != DDIEMPB.DIADIEM;

-- Câu 29: Tên các đề án thuộc các phòng ban có địa điểm ở Hà Nội
SELECT DEAN.TENDA
FROM DEAN
JOIN DDIEMPB ON DEAN.MAPB = DDIEMPB.MAPB
JOIN PHONGBAN ON DDIEMPB.MAPB = PHONGBAN.MAPB
WHERE DDIEMPB.DIADIEM = 'HA NOI';

-- Câu 30: Tên nhân viên có chức vụ là trưởng phòng và cư ngụ ở thành phố Hồ Chí Minh
SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MANV = PB.TRUONGPHONG
JOIN DDIEMPB DPB ON PB.MAPB = DPB.MAPB
WHERE NV.DIACHI LIKE '%TPHCM%';

-- Câu 31: Tên nhân viên là trưởng phòng có ngày nhận chức sau cùng (mới nhất)
SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.MANV = PB.TRUONGPHONG
WHERE PB.NG_NHANCHUC = (SELECT MAX(NG_NHANCHUC) FROM PHONGBAN);

-- câu 32: (Quản lý đề án): Phòng ban nào chỉ phụ trách các đề án ở Hà Nội
SELECT DISTINCT pb.MaPB, pb.TENPB
FROM PHONGBAN pb
JOIN DEAN d ON pb.MAPB = d.MAPB
JOIN DDIEMPB dpb ON pb.MAPB = dpb.MAPB
WHERE dpb.DIADIEM LIKE N'%Ha Noi%';

-- Cau 33: Thêm vào quan hệ PHANCONG các bộ là các đề án mà nhân viên NV3 chưa được phân công--
insert into PHANCONG
select 'NV3', MADA, 0
from DEAN
where MADA not in (select MADA from PHANCONG where MANV = 'NV3');
-- Câu 34: Liệt kê tên phòng ban, tên trưởng phòng của các phòng ban có nhiều nhân viên nữ nhất.
SELECT PHONGBAN.TENPB, NHANVIEN.HONV, NHANVIEN.TENNV
FROM PHONGBAN
JOIN NHANVIEN ON PHONGBAN.TRUONGPHONG = NHANVIEN.MANV
WHERE PHONGBAN.MAPB IN (
    SELECT NHANVIEN.MAPB
    FROM NHANVIEN
    WHERE NHANVIEN.PHAI = 'NU'
    GROUP BY NHANVIEN.MAPB
    HAVING COUNT(NHANVIEN.MANV) = (
        SELECT MAX(COUNT_NU)
        FROM (
            SELECT COUNT(NHANVIEN.MANV) AS COUNT_NU
            FROM NHANVIEN
            WHERE NHANVIEN.PHAI = 'NU'
            GROUP BY NHANVIEN.MAPB
        ) AS SUBQUERY
    )
);

-- câu 35: Tên nhân viên được phân công làm việc cho tất cả đề án ở phòng P2
SELECT NV.HONV, NV.TENLOT, NV.TENNV
FROM NHANVIEN NV
WHERE NOT EXISTS (
    SELECT *
    FROM DEAN D
    WHERE NOT EXISTS (
        SELECT *
        FROM PHANCONG PC
        WHERE PC.MADA = D.MADA AND PC.MANV = NV.MANV
    )
    AND D.MAPB = 'P2'
);

-- Câu 36: Cho biết tên đề án, tên nhân viên, số giờ của từng để ăn được phân công và số giờ làm việc nhiều nhất
SELECT TENDA, HONV + ' ' + TENLOT + ' ' + TENNV AS [HO TEN NV], THOIGIAN
FROM NHANVIEN NV JOIN PHANCONG PC ON NV.MANV = PC.MANV
				 JOIN DEAN DA ON PC.MADA = DA.MADA
WHERE THOIGIAN >= ALL (SELECT MAX(THOIGIAN) FROM PHANCONG WHERE MADA = PC.MADA);

-- câu 37: Đối với từng nhân viên: cho biết tên nhân viên, mã phòng ban và tên của trưởng phòng
SELECT
    NV.TENNV AS 'Tên nhân viên',
    NV.MAPB AS 'Mã phòng ban',
    TP.TENNV AS 'Tên trưởng phòng'
FROM
    NHANVIEN NV
INNER JOIN
    PHONGBAN PB ON NV.MAPB = PB.MAPB
INNER JOIN
    NHANVIEN TP ON PB.TRUONGPHONG = TP.MANV;
