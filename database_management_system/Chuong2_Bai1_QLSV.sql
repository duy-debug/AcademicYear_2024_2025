--1.1 TẠO CSDL QLSV
--CÂU 34
CREATE DATABASE QLSV;
USE QLSV;
--1.2 Tạo 6 bảng
CREATE TABLE KHOA
(
	MaKhoa VARCHAR(10) NOT NULL PRIMARY KEY,
	TenKhoa NVARCHAR(50) NOT NULL,
	SL_CBGD SMALLINT NOT NULL
);
CREATE TABLE GIAOVIEN
(
	MaGV VARCHAR(5) NOT NULL PRIMARY KEY,
	TenGV NVARCHAR(50) NOT NULL,
	MaKhoa VARCHAR(10) FOREIGN KEY REFERENCES KHOA(MaKhoa)
);
CREATE TABLE MONHOC
(
	MaMH VARCHAR(5) NOT NULL PRIMARY KEY,
	TenMH NVARCHAR(50) NOT NULL,
	SoTC smallint NOT NULL
);
CREATE TABLE SINHVIEN
(
	MSSV VARCHAR(5) NOT NULL PRIMARY KEY,
	Ten NVARCHAR(50) NOT NULL,
	GioiTinh VARCHAR(5) NOT NULL,
	DiaChi NVARCHAR(50) NOT NULL,
	DienThoai VARCHAR(20),
	MaKhoa VARCHAR(10) FOREIGN KEY REFERENCES KHOA(MaKhoa)
);
CREATE TABLE GIANGDAY
(
	MaKhoaHoc VARCHAR(5) NOT NULL PRIMARY KEY,
	MaGV VARCHAR(5) FOREIGN KEY REFERENCES GIAOVIEN(MaGV),
	MaMH VARCHAR(5) FOREIGN KEY REFERENCES MONHOC(MaMH),
	HocKy SMALLINT NOT NULL,
	Nam INT NOT NULL,
);
CREATE TABLE KETQUA
(
	MaSV VARCHAR(5) FOREIGN KEY REFERENCES SINHVIEN(MSSV),
	MaKhoaHoc VARCHAR(5) FOREIGN KEY REFERENCES GIANGDAY(MaKhoaHoc),
	Diem DECIMAL(3,1) NOT NULL,
	CONSTRAINT pk_ketqua PRIMARY KEY (MaSV, MaKhoaHoc)
);
INSERT INTO KHOA VALUES
	('CNTT', N'Công nghệ thông tin', 15),
	('TOAN', N'Toán', 20),
	('SINH', N'Sinh học', 7);
INSERT INTO SINHVIEN VALUES
	('SV001', 'BUI THUY AN', N'Nữ', '223 TRAN HUNG DAO .HCM', '0843132202', 'CNTT'),
	('SV002', 'NGUYEN THANH TUNG', N'Nam', '140 CONG QUYNH .HCM', '0581525678', 'CNTT'),
	('SV003', 'NGUYEN THANH LONG', N'Nam', '112/4 CONG QUYNH .HCM', '0918345623', 'TOAN'),
	('SV004', 'HOANG THI HOA', N'Nữ', '90 NG VAN CU .HCM', '0988320123', 'CNTT'),
	('SV005', 'TRAN HONG SON', N'Nam', '54 CAO THANG .HANOI', '0928345987', 'CNTT');
INSERT INTO MONHOC
VALUES
	('CSDL', 'CO SO DU LIEU', 3),
	('CTDL', 'CAU TRUC DU LIEU', 4),
	('KTLT', 'KY THUAT LAP TRINH', 5),
	('CWIN', 'LAP TRINH C TREN WINDOWS', 4);
INSERT INTO GIAOVIEN VALUES
	('GV01', 'PHAM THI THAO', 'CNTT'),
	('GV02', 'LAM HOANG VU', 'TOAN'),
	('GV03', 'TRAN HOANG TIEN', 'CNTT'),
	('GV04', 'HOANG VUONG', 'CNTT');
INSERT INTO GIANGDAY VALUES
	('K1', 'GV01', 'CSDL', 1, 2021),
	('K2', 'GV04', 'KTLT', 2, 2020),
	('K3', 'GV03', 'CTDL', 1, 2020),
	('K4', 'GV04', 'CWIN', 1, 2020),
	('K5', 'GV01', 'CSDL', 1, 2021);
INSERT INTO KETQUA VALUES
	('SV001', 'K1', 8.5),
	('SV002', 'K3', 7.0),
	('SV003', 'K4', 7.5),
	('SV001', 'K2', 9.0),
	('SV004', 'K3', 6.0),
	('SV005', 'K3', 7.0),
	('SV002', 'K1', 7.0),
	('SV003', 'K2', 8.5),
	('SV005', 'K5', 7.0),
	('SV004', 'K4', 2.0);

--Chương3_Bai1_Query
--Phần cơ bản
-- Câu 1. Cho biết tên, địa chỉ, điện thoại của tất cả các sinh viên?
SELECT Ten, DiaChi, DienThoai
FROM SINHVIEN SV;
-- Câu 2: Cho biết tên các môn học và số tín chỉ của từng môn học ?
SELECT TenMH, SoTC
FROM dbo.MONHOC;
-- Câu 3: Cho biết kết quả học tập của sinh viên có Mã số “SV003”
SELECT sv.MSSV, sv.Ten, kq.Diem
FROM SINHVIEN sv
JOIN KETQUA kq on kq.MaSV = sv.MSSV
WHERE sv.MSSV = 'SV003';
-- Câu 4: Cho biết tên các môn học và số tín chỉ của những môn học có cấu trúc của mã môn học như sau: kí tự thứ 1 là C, kí tự thứ 3 là D
SELECT TenMH, SoTC
FROM MONHOC
WHERE MaMH LIKE 'C_D%';
-- Câu 5: Cho biết tên giáo viên có kí tự thứ 3 là ' A '.
SELECT TenGV
FROM GIAOVIEN
WHERE TenGV LIKE '__A%';
-- Câu 6: Cho biết tên những môn học có chứa chữ “DU” (Ví dụ như các môn Cơ sở dữ liệu, Cấu trúc dữ liệu)
SELECT TenMH
FROM MONHOC
WHERE TenMH LIKE '%DU%';
-- Câu 7: cho biết tên các giáo viên có ký tự đầu tiên của họ và tên là các kí tự "P" hoặc "L".
SELECT TenGV
FROM GIAOVIEN
WHERE TenGV LIKE 'P%' OR TenGV LIKE 'L%';
-- Cách 2: Tối ưu hơn vì nó chỉ lấy kí tự đầu tiên để so sánh  
SELECT TenGV
FROM GIAOVIEN
WHERE LEFT(TenGV, 1) IN ('P', 'L'); 
-- Câu 8. Cho biết tên, địa chỉ của những sinh viên có địa chỉ trên đường "Cống Quỳnh".
SELECT Ten, DiaChi
FROM SINHVIEN
WHERE DiaChi LIKE '%CONG QUYNH%';
--  Câu 9: Cho biết danh sách các môn học được dạy trong năm 2020.
SELECT MH.TenMH
FROM MONHOC MH
JOIN GIANGDAY GD ON GD.MaMH = MH.MaMH
WHERE GD.Nam = 2020;
-- Câu 10. Cho biết mã, tên, địa chỉ của các sinh viên theo từng Khoa sắp theo thứ tự A-Z của tên sinh viên.
SELECT SV.MSSV, SV.Ten, SV.DiaChi 
FROM SINHVIEN SV
JOIN KHOA K ON K.MaKhoa = SV.MaKhoa
ORDER BY SV.Ten
-- Câu 11: Cho biết điểm của các sinh viên theo từng môn học
SELECT SV.MSSV, SV.Ten, MH.TenMH, KQ.Diem
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
-- Câu 12: Cho biết các sinh viên học môn 'CSDL' có điểm từ 8 đến 10
SELECT SV.MSSV, SV.Ten, KQ.Diem
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
WHERE MH.TenMH = 'CO SO DU LIEU' AND KQ.Diem BETWEEN 8 AND 10;
-- Câu 13: Cho biết bảng điểm của sinh viên có tên là 'TUNG'.
SELECT KQ.Diem
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
WHERE SV.Ten LIKE '%TUNG%';
-- Câu 14: Cho biết tên khoa, tên môn học mà những sinh viên trong khoa đã học
SELECT DISTINCT K.TenKhoa, MH.TenMH
FROM GIANGDAY GD
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
JOIN KETQUA KQ ON KQ.MaKhoaHoc = GD.MaKhoaHoc
JOIN SINHVIEN SV ON SV.MSSV = KQ.MaSV
JOIN KHOA K ON K.MaKhoa = SV.MaKhoa;
-- Câu 15: Cho biết tên khoa, mã khóa học mà giảng viên tham gia giảng dạy
SELECT K.TenKhoa, GD.MaKhoaHoc
FROM GIANGDAY GD
JOIN GIAOVIEN GV ON GV.MaGV = GD.MaGV
JOIN KHOA K ON K.MaKhoa = GV.MaKhoa;
-- Câu 16: Cho biết những sinh viên đã học môn CSDL HOẶC CTDL
SELECT DISTINCT SV.MSSV, SV.Ten
FROM KETQUA KQ
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
JOIN SINHVIEN SV ON SV.MSSV = KQ.MaSV
WHERE MH.TenMH = 'CO SO DU LIEU' OR MH.TenMH = 'CAU TRUC DU LIEU';
-- Câu 17: Cho biết tên những GV giảng dạy môn 'KTLT'
SELECT GV.TenGV
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GV.MaGV = GD.MaGV
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
WHERE MH.TenMH = 'KY THUAT LAP TRINH';
-- Câu 18: Cho biết tên môn học mà giáo viên "Tran Hoang Tien" tham gia giảng dạy trong học kỳ 1 năm học 2020.
SELECT MH.TenMH
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GD.MaGV = GV.MaGV
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
WHERE GV.TenGV = 'TRAN HOANG TIEN' AND GD.Nam = 2020 AND GD.HocKy = 1;
-- Câu 19: Cho biết mã, tên các sv có kết quả 1 môn học nào đó trên 8 điểm ( kq các môn khác CÓ THỂ <=8)
SELECT DISTINCT SV.MSSV, SV.Ten
FROM KETQUA KQ
JOIN SINHVIEN SV ON SV.MSSV = KQ.MaSV
WHERE KQ.Diem > 8;
-- Câu 20: Cho biết mã, tên các sv có kết quả các môn học đều trên 8 điểm
SELECT SV.MSSV, SV.Ten
FROM SINHVIEN SV
WHERE NOT EXISTS(
	SELECT *
	FROM KETQUA KQ
	WHERE KQ.MaSV = SV.MSSV AND KQ.Diem <= 8
);
-- Aggregate Functions
-- câu 21: Có bao nhiêu sinh viên.
SELECT COUNT(MSSV) AS 'SO LUONG SINH VIEN'
FROM SINHVIEN;
-- Câu 22: Có bao nhiêu giáo viên.
SELECT COUNT(MaGV) AS 'SO LUONG GIAO VIEN'
FROM GIAOVIEN;
-- Câu 23: Có bao nhiêu sinh viên giới tính nữ và thuộc khoa "CNTT"
SELECT COUNT(*) AS 'SO LUONG NU CNNT'
FROM SINHVIEN SV
JOIN KHOA K ON K.MaKhoa = SV.MaKhoa
WHERE SV.GioiTinh = 'Nữ' AND K.TenKhoa = 'CNTT';
-- Câu 24: Có bao nhiêu giáo viên khoa CNTT
SELECT COUNT(MaGV) AS 'SO LUONG GIAO VIEN CNTT'
FROM GIAOVIEN 
WHERE MaKhoa = 'CNTT';
-- Câu 25: Có bao nhiêu sinh viên học môn CSDL
SELECT COUNT(KQ.MaSV) AS 'SO LUONG SINH VIEN HOC MON CSDL'
FROM KETQUA KQ
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
WHERE MH.TenMH = 'CO SO DU LIEU';
-- Câu 26: Có bao nhiêu môn học được giảng dạy trong học kỳ 1 năm 2021
SELECT COUNT(DISTINCT MaMH) AS 'SO LUONG MON HOC GIANG DAY'
FROM GIANGDAY 
WHERE Nam = 2021 AND HocKy = 1;
-- Câu 27: Cho biết điểm trung bình của sinh viên có mã số 'SV004'
SELECT SUM(KQ.Diem * MH.SoTC) / SUM(MH.SoTC) AS 'DIEM TRUNG BINH'
FROM KETQUA KQ
JOIN SINHVIEN SV ON SV.MSSV = KQ.MaSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
WHERE SV.MSSV = 'SV004';
-- Câu 28 : Cho biết mã, tên, địa chỉ và điểm trung bình của từng sinh viên
SELECT SV.MSSV, SV.Ten, SV.DiaChi, SUM(KQ.Diem * MH.SoTC) / SUM(MH.SoTC) AS 'DIEM TRUNG BINH'
FROM KETQUA KQ
JOIN SINHVIEN SV ON SV.MSSV = KQ.MaSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
GROUP BY SV.MSSV, SV.Ten, SV.DiaChi;
-- Câu 29: Cho biết số lượng điểm >= 8 của từng sinh viên.
SELECT SV.MSSV, SV.Ten, COUNT(KQ.Diem) AS 'SO LUONG DIEM >= 8'
FROM SINHVIEN SV
JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
WHERE KQ.Diem >= 8
GROUP BY SV.MSSV, SV.Ten;
-- Câu 30: cho biết tên khoa, số lượng sinh viên có trong từng khoa.
SELECT K.TenKhoa, COUNT(SV.MSSV) AS 'SO LUONG SV TUNG KHOA'
FROM SINHVIEN SV
RIGHT JOIN KHOA K ON K.MaKhoa = SV.MaKhoa
GROUP BY K.TenKhoa;
-- Câu 31: Cho biết tên khoa, số lượng khóa học mà giáo viên của khoa có tham gia giảng dạy.
SELECT K.TenKhoa, COUNT(GD.MaKhoaHoc) AS 'SO LUONG KHOA HOA GVDG'
FROM KHOA K
JOIN GIAOVIEN GV ON GV.MaKhoa = K.MaKhoa
JOIN GIANGDAY GD ON GD.MaGV	= GV.MaGV
GROUP BY K.TenKhoa;
-- Câu 32 : Cho biet ten tat ca cac sv,dtb, SL khoa hoc da tham gia hoc tap
SELECT SV.Ten, SUM(KQ.Diem * MH.SoTC) / SUM(MH.SoTC) AS 'DIEM TRUNG BINH', COUNT(GD.MaKhoaHoc) AS 'SO LUONG KHOA HOC'
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
GROUP BY SV.Ten;
-- Câu 33: Cho biết số lượng tín chỉ mà từng sinh viên đã tham gia (gồm MSSV, tên SV, Số lượng tín chỉ).
SELECT SV.MSSV, SV.Ten, SUM(MH.SoTC) AS 'SO LUONG TC DA TUNG THAM GIA'
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV. MSSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
GROUP BY SV.MSSV, SV.Ten;
--HAVING
-- Câu 34: Cho biết tên những sinh viên chỉ mới thi đúng một môn
SELECT SV.Ten, COUNT(KQ.MaSV) 'SO LAN THI'
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
GROUP BY SV.Ten
HAVING COUNT(KQ.MaSV) = 1;
-- Câu 35: Cho biết mã, tên, địa chỉ và điểm của các sinh viên có điểm trung bình > 8.5
SELECT SV.MSSV, SV.Ten, SV.DiaChi, SUM(KQ.Diem * MH.SoTC)/SUM(MH.SoTC) AS 'DIEM TRUNG BINH'
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV 
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
GROUP BY SV.MSSV, SV.Ten, SV.DiaChi
HAVING SUM(KQ.Diem * MH.SoTC)/SUM(MH.SoTC) > 8.5;
-- Câu 36: Cho biết mã khóa học, học kỳ, năm, số lượng sinh viên tham gia của những khóa học có số lượng sinh viên tham gia (đã có điểm) từ 2 đến 4 sinh viên
SELECT GD.MaKhoaHoc, GD.HocKy, GD.Nam, COUNT(KQ.MaSV) AS 'SO LUONG SV'
FROM GIANGDAY GD
JOIN KETQUA KQ ON KQ.MaKhoaHoc = GD.MaKhoaHoc
GROUP BY GD.MaKhoaHoc, GD.HocKy, GD.Nam
HAVING COUNT(KQ.MaSV) BETWEEN 2 AND 4;
-- Câu 37: Cho biet cac sv hoc ca 2 mon CSDL,CTDL co diem 1 trong 2 mon >=8
SELECT SV.MSSV, SV.Ten
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
WHERE GD.MaMH IN ('CSDL','CTDL')
GROUP BY SV.MSSV, SV.Ten
HAVING COUNT(DISTINCT GD.MaMH) = 2 AND MAX(KQ.Diem) >= 8;
--LỚN NHẤT/ NHỎ NHẤT
-- Câu 38: Điểm cao nhất mà sinh viên đã đạt được trong các khóa học
SELECT MAX(Diem) AS 'DIEM CAO NHAT'
FROM KETQUA;
-- Câu 39: Trong các môn học, số tín chỉ nhỏ nhất là bao nhiêu?
SELECT MIN(SoTC) AS 'SO TC NHO NHAT'
FROM MONHOC;
-- Câu 40: Cho biết tên môn học có số tín chỉ nhiều nhất
SELECT TenMH, SoTC
FROM MONHOC
WHERE SoTC = (SELECT MAX(SoTC) FROM MONHOC);
-- Câu 41: Cho biết tên khoa có số lượng CBGD ít nhất.
SELECT K.TenKhoa
FROM KHOA K
WHERE K.SL_CBGD = (SELECT MIN(SL_CBGD) FROM KHOA);
-- Câu 42: Tên các sinh viên có điểm cao nhất trong môn 'Kỹ Thuật Lập Trình'
SELECT SV.Ten
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
JOIN GIANGDAY GD ON GD.MaKhoaHoC = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
WHERE MH.TenMH = 'KY THUAT LAP TRINH' AND KQ.Diem = (
	SELECT MAX(KQ1.Diem) 
	FROM KETQUA KQ1
	JOIN GIANGDAY GD1 ON GD1.MaKhoaHoc = KQ1.MaKhoaHoc
	JOIN MONHOC MH1 ON MH1.MaMH = GD1.MaMH
	WHERE MH1.TenMH = 'KY THUAT LAP TRINH'
	);
-- Cau 43: Cho biet thong tin sv co diem thi mon CSDL lon nhat
SELECT TOP 1 SV.MSSV, SV.Ten, KQ.Diem
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
WHERE GD.MaMH = 'CSDL'
ORDER BY KQ.Diem DESC;
-- Cau 44: Cho biet ten cac mon hoc co nhieu sv tham gia nhat
SELECT MH.TenMH, COUNT(KQ.MaSV) AS 'SO LUONG THAM GIA'
FROM KETQUA KQ
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
GROUP BY MH.TenMH
HAVING COUNT(KQ.MaSV) >= ALL(
	SELECT COUNT(KQ1.MaSV)
	FROM KETQUA KQ1
	JOIN GIANGDAY GD1 ON GD1.MaKhoaHoc = KQ1.MaKhoaHoc
	JOIN MONHOC MH1 ON MH1.MaMH = GD1.MaMH
	GROUP BY MH1.TenMH
);
-- Câu 45: Đối với mỗi môn học, cho biết tên và điểm của các sinh viên có điểm cao nhất
SELECT MH.TenMH, SV.Ten, KQ.Diem
FROM SINHVIEN SV
JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
WHERE KQ.Diem = (
    SELECT MAX(KQ1.Diem)
    FROM KETQUA KQ1
    JOIN GIANGDAY GD1 ON GD1.MaKhoaHoc = KQ1.MaKhoaHoc
    WHERE GD1.MaMH = MH.MaMH
);
	-- Cau 46: hk nao co nhieu mon giang day nhat
SELECT GD.HocKy, COUNT(MH.MaMH) AS 'SO LUONG MON HOC'
FROM GIANGDAY GD
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
GROUP BY GD.HocKy
HAVING COUNT(MH.MaMH) >= ALL(
	SELECT COUNT(MH1.MaMH)
	FROM GIANGDAY GD1
	JOIN MONHOC MH1 ON MH1.MaMH = GD1.MaMH
	GROUP BY GD1.HocKy
);
-- Cau 47: Cho biet ten sv co nhieu diem 7
SELECT SV.Ten, COUNT(KQ.Diem) AS 'SO LUONG DIEM 7'
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
WHERE KQ.Diem = 7
GROUP BY SV.Ten
HAVING COUNT(KQ.Diem) >= ALL(
	SELECT COUNT(KQ1.Diem)
	FROM SINHVIEN SV1
	JOIN KETQUA KQ1 ON KQ1.MaSV = SV1.MSSV
	WHERE KQ1.Diem = 7
	GROUP BY SV1.Ten
);
-- Cau 48: Cho biet ten sv co so luong tin chi nhieu nhat
WITH TongSoTinChi AS (
    SELECT 
        SV.MSSV, 
        SV.Ten, 
        SUM(MH.SoTC) AS TongTinChi
    FROM SINHVIEN SV
    JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
    JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
    JOIN MONHOC MH ON MH.MaMH = GD.MaMH
    GROUP BY SV.MSSV, SV.Ten
)

SELECT Ten, TongTinChi
FROM TongSoTinChi
WHERE TongTinChi = (SELECT MAX(TongTinChi) FROM TongSoTinChi);

-- Câu 49: Cho biết Tên Môn Học, Tên Sinh Viên, Điểm Của Các Sinh Viên Học Những Môn Học Có Số Tín Chỉ Là Thấp Nhất
SELECT MH.TenMH, SV.Ten, KQ.Diem
FROM MONHOC MH
JOIN GIANGDAY GD ON MH.MaMH = GD.MaMH
JOIN KETQUA KQ ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN SINHVIEN SV ON KQ.MaSV = SV.MSSV
WHERE MH.SoTC = (
    SELECT MIN(SoTC)
    FROM MONHOC
)
ORDER BY MH.TenMH, SV.Ten;
-- Cau 50: Cho biet ten gv tg day nhieu nhat
SELECT GV.TenGV, COUNT(GD.MaKhoaHoc) AS 'SO LUONG KHOA HOC DA DAY'
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GD.MaGV = GV.MaGV
GROUP BY GV.TenGV
HAVING COUNT(GD.MaKhoaHoc) >= ALL(
	SELECT COUNT(GD.MaKhoaHoc)
	FROM GIANGDAY GD	
	GROUP BY GD.MaGV
);
--KHÔNG/CHƯA CÓ: (NOT IN VÀ LEFT/RIGHT JOIN)
-- Cau 51: Ten cac gv khong tham gia gd trong nam 2021
SELECT GV.TenGV
FROM GIANGDAY GD
JOIN GIAOVIEN GV ON GV.MaGV = GD.MaGV
WHERE GD.MaGV NOT IN(
	SELECT GD.MaGV
	FROM GIANGDAY GD
	WHERE GD.Nam = 2021
);
-- Câu 52: Cho biết tên các môn học không được tổ chức trong năm 2021
SELECT TenMH
FROM MONHOC
WHERE MaMH NOT IN(
	SELECT MaMH
	FROM GIANGDAY
	WHERE Nam = 2021
);
-- Cau 53: Ten nhung khoa chua co sv theo hoc
SELECT TenKhoa
FROM KHOA K
JOIN SINHVIEN SV ON SV.MaKhoa = K.MaKhoa
WHERE K.MaKhoa NOT IN(
	SELECT DISTINCT SV.MaKhoa
	FROM SINHVIEN SV
);
-- Câu 54. Cho biết tên những môn học chưa được tổ chức cho các khóa học.
SELECT MH.TenMH
FROM GIANGDAY GD
LEFT JOIN MONHOC MH ON MH.MaMH = GD.MaMH
WHERE GD.MaMH IS NULL
-- Câu 55: Cho biết tên những sinh viên chưa có điểm kiểm tra
SELECT SV.Ten
FROM SINHVIEN SV
LEFT JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
WHERE KQ.MaSV IS NULL
-- Câu 56: Cho biết những tên khóa không có sinh viên theo học
SELECT K.TenKhoa 
FROM KHOA K 
LEFT JOIN SINHVIEN SV ON SV.MaKhoa = K.MaKhoa
WHERE SV.MaKhoa IS NULL
-- Câu 57: Cho biết tên sinh viên, số lượng môn mà Sinh viên chưa học.
SELECT SV.Ten, (SELECT COUNT(*) FROM MONHOC) - COUNT(DISTINCT GD.MaMH) AS 'SO LUONG MON CHUA HOC'
FROM SINHVIEN SV
LEFT JOIN KETQUA KQ ON SV.MSSV = KQ.MaSV
LEFT JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
GROUP BY SV.Ten;
-- Câu 58: Cho biết các sinh viên chưa học "môn LTC trên windows"
SELECT SV.Ten
FROM SINHVIEN SV
WHERE SV.MSSV NOT IN(
	SELECT KQ.MaSV
	FROM KETQUA KQ
	JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ. MaKhoaHoc
	JOIN MONHOC MH ON MH.MaMH = GD.MaMH
	WHERE MH.TenMH = 'LAP TRINH C TREN WINDOWS'
);
-- Câu 59: Cho biết tên tất cả các GV cùng với số lượng khóa học mà từng GV đã tham gia giảng dạy
SELECT GV.TenGV, COUNT(GD.MaKhoaHoc) AS 'SOLUONGKHOAHOC'
FROM GIAOVIEN GV
LEFT JOIN GIANGDAY GD ON GD.MaGV = GV.MaGV
GROUP BY GV.TenGV;
--HỢP/GIAO/TRỪ
-- Cau 60: Ten sv, ten mon ma sv chua hoc
SELECT SV.Ten, MH.TenMH AS 'MON HOC CHUA HOC'
FROM SINHVIEN SV, MONHOC MH
EXCEPT
SELECT SV.Ten, MH.TenMH
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH	
-- Cau 61: Cho biet ten nhung gv tham gia day du tat ca cac mon
SELECT GV.MaGV, GV.TenGV
FROM GIAOVIEN GV
WHERE NOT EXISTS (
    SELECT MH.MaMH
    FROM MONHOC MH
    WHERE MH.MaMH NOT IN (
        SELECT GD.MaMH
        FROM GIANGDAY GD
        WHERE GD.MaGV = GV.MaGV
    )
);
-- Cau 62: Ten mon hoc tat ca giao vien deu day
SELECT MH.TenMH
FROM MONHOC MH
WHERE NOT EXISTS (
    SELECT GV.MaGV
    FROM GIAOVIEN GV
    WHERE GV.MaGV NOT IN (
        SELECT GD.MaGV
        FROM GIANGDAY GD
        WHERE GD.MaMH = MH.MaMH
    )
);
-- Cau 63: Khoa hoc ma tat ca sv deu tham gia
SELECT kq.MaKhoaHoc
FROM KETQUA kq
WHERE NOT EXISTS (
    SELECT sv.MSSV
    FROM SINHVIEN sv
    WHERE sv.MSSV NOT IN (
        SELECT kq1.MaSV
        FROM KETQUA kq1
        WHERE kq1.MaKhoaHoc = kq.MaKhoaHoc
    )
)
GROUP BY kq.MaKhoaHoc;
-- Câu 64. Cho biết tên những sinh viên tham gia đủ tất cả các khóa học.
SELECT SV.Ten
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
GROUP BY SV.Ten
HAVING COUNT(DISTINCT GD.MaKhoaHoc) = (
	SELECT COUNT(DISTINCT GD.MaKhoaHoc)
	FROM GIANGDAY GD
);
-- Cau 65: Ten mon hoc ma tat ca cac sv deu hoc
SELECT DISTINCT MH.TENMH
FROM KETQUA KQ1, GIANGDAY GD, MONHOC MH
WHERE KQ1.MAKHOAHOC = GD.MAKHOAHOC 
AND GD.MAMH = MH.MAMH 
AND NOT EXISTS (
    SELECT *
    FROM GIANGDAY GD
    WHERE NOT EXISTS (
        SELECT *
        FROM KETQUA KQ2
        WHERE KQ1.MASV = KQ2.MASV 
        AND KQ2.MAKHOAHOC = GD.MAKHOAHOC
    )
);

-- câu 66:Cho biết tên sinh viên đã học đủ tất cả các môn học
SELECT SV.Ten
FROM SINHVIEN SV
JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
JOIN MONHOC MH ON MH.MaMH = GD.MaMH
GROUP BY SV.Ten
HAVING COUNT(DISTINCT MH.MaMH) = (
	SELECT COUNT(DISTINCT MH1.MaMH)
	FROM MONHOC MH1
);
-- Câu 67: Cho biết tên các giáo viên dạy tất cả những môn mà giáo viên 'GV03' đã dạy
SELECT DISTINCT GV.TenGV
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GV.MaGV = GD.MaGV
WHERE NOT EXISTS (
    SELECT MaMH
    FROM GIANGDAY
    WHERE MaGV = 'GV03'
    EXCEPT
    SELECT MaMH
    FROM GIANGDAY
    WHERE GV.MaGV = GD.MaGV
);	
-- Câu 68: Cho biết các giáo viên dạy tất cả những môn học mà giáo viên 'GV03' đã dạy
SELECT DISTINCT GV.TenGV
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GV.MaGV = GD.MaGV
WHERE NOT EXISTS (
    SELECT MaMH
    FROM GIANGDAY
    WHERE MaGV = 'GV03'
    EXCEPT
    SELECT MaMH
    FROM GIANGDAY
    WHERE GD.MaGV = 'GV03' AND GV.MaGV = GD.MaGV
);
--UPDATE
-- Câu 69: Thêm các field SLMon (số lượng môn), DTB (điểm trung bình), XL (xếp loại) vào bảng SinhVien
ALTER TABLE SINHVIEN
ADD SLMon INT,
	DTB FLOAT,
	XL NVARCHAR(20);
-- Câu 70: Cập nhật thông tin cho các field vừa tạo theo yêu cầu
UPDATE SINHVIEN
SET [SLMon] = (
		SELECT COUNT(DISTINCT KQ.MaKhoaHoc)
		FROM KETQUA KQ
		JOIN SINHVIEN SV ON SV.MSSV = KQ.MaSV
),
	[DTB] = (
		SELECT SUM(MH.SoTC * KQ.Diem) / SUM(MH.SoTC)
		FROM SINHVIEN SV
		JOIN KETQUA KQ ON KQ.MaSV = SV.MSSV
		JOIN GIANGDAY GD ON GD.MaKhoaHoc = KQ.MaKhoaHoc
		JOIN MONHOC MH ON MH.MaMH = GD.MaMH
);
UPDATE SINHVIEN
SET XL = CASE 
    WHEN DTB >= 9 THEN N'Xuất sắc'
    WHEN DTB >= 8 THEN N'Giỏi'
    WHEN DTB >= 7 THEN N'Khá'
    WHEN DTB >= 5 THEN N'Trung bình'
    ELSE N'Yếu'
END;
	
--DELETE
-- Câu 71: Xóa tất cả kết quả học tập của sinh viên 'SV002'
DELETE FROM KETQUA
WHERE MaSV = 'SV002';
-- Câu 72: Xoá tên những sinh viên có điểm trung bình dưới 5.
DELETE FROM KETQUA
WHERE MaSV IN (
    SELECT MaSV FROM (
        SELECT MaSV, AVG(Diem) AS DiemTrungBinh
        FROM KETQUA
        GROUP BY MaSV
    ) AS DiemTB_SV
    WHERE DiemTrungBinh < 5
);

DELETE FROM SINHVIEN
WHERE MSSV IN (
    SELECT MaSV FROM (
        SELECT MaSV, AVG(Diem) AS DiemTrungBinh
        FROM KETQUA
        GROUP BY MaSV
    ) AS DiemTB_SV
    WHERE DiemTrungBinh < 5
);
-- Câu 73: Xóa những khoa không có sinh viên theo học
DELETE FROM KHOA
WHERE MaKhoa NOT IN (
    SELECT DISTINCT MaKhoa
    FROM SINHVIEN
);