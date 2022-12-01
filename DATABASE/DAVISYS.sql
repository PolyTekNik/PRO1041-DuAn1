﻿USE master

CREATE DATABASE DAVISYS
USE DAVISYS

CREATE TABLE LOAIHANG(
	MALH NVARCHAR(10) NOT NULL PRIMARY KEY,
	TENLH NVARCHAR(50) NOT NULL
)

CREATE TABLE HANG(
	MAHANG NVARCHAR(10) NOT NULL PRIMARY KEY,
	TENHANG NVARCHAR(50) NOT NULL,
)

CREATE TABLE SANPHAM(
	MASP NVARCHAR(10) NOT NULL PRIMARY KEY,
	TENSP NVARCHAR(50) NOT NULL,
	MALH NVARCHAR(10) NOT NULL,
	MAHANG NVARCHAR(10) NOT NULL,
	GIANHAP FLOAT NOT NULL,
	GIABAN FLOAT NOT NULL,
	NGAYNHAP DATE NOT NULL,
	HINH NVARCHAR(50) NOT NULL,
	MOTA NVARCHAR(100) NOT NULL
)

CREATE TABLE KHACHHANG(
	MAKH NVARCHAR(10) NOT NULL PRIMARY KEY,
	HOTEN NVARCHAR(50) NOT NULL,
	DIENTHOAI NVARCHAR(20) NOT NULL,
	DIACHI NVARCHAR(50) NOT NULL,
	TICHDIEM INT NOT NULL
)

CREATE TABLE HOADON(
	MAHD NVARCHAR(10) NOT NULL PRIMARY KEY,
	TENDN NVARCHAR(50) NOT NULL,
	MAKH NVARCHAR(10) NOT NULL,
	MAGH NVARCHAR(20) NOT NULL,
	NGAYLAP DATE NOT NULL,
	TONGTIEN FLOAT NOT NULL,
	PHANTRAMGG FLOAT NOT NULL,
	TRUTIENTICHDIEM FLOAT NOT NULL,
	THANHTIEN FLOAT NOT NULL
)

CREATE TABLE CHITIETHOADON(
	MACTHD NVARCHAR(10) NOT NULL PRIMARY KEY,
	MAHD NVARCHAR(10) NOT NULL,
	MASP NVARCHAR(10) NOT NULL,
	MAHANG NVARCHAR(10) NOT NULL,
	MALH NVARCHAR(10) NOT NULL,
	NGAYLAP DATE NOT NULL,
	TENSP NVARCHAR(50) NOT NULL,
	TENHANG NVARCHAR(50) NOT NULL,
	TENLH NVARCHAR(50) NOT NULL,
	NGAYNHAP DATE NOT NULL,
	GIANHAP FLOAT NOT NULL,
	GIABAN FLOAT NOT NULL,
	SOLUONG INT NOT NULL
)

CREATE TABLE GIOHANG(
	MAGH NVARCHAR(20) NOT NULL PRIMARY KEY,
	MAKH NVARCHAR(10) NOT NULL,
	TENDN NVARCHAR(50) NOT NULL,

) 

CREATE TABLE GIOHANGTAM(
	MAGH NVARCHAR (20) NOT NULL,
	MASP NVARCHAR(10) NOT NULL,
	SOLUONG INT,
	CONSTRAINT GIOHANGTAM_pk PRIMARY KEY (MAGH, MASP)
)

CREATE TABLE CHUCVU(
	MACV INT NOT NULL PRIMARY KEY,
	TENCV NVARCHAR(50) NOT NULL,
	MOTA NVARCHAR(100) NOT NULL
)

CREATE TABLE TAIKHOAN(
	TENDN NVARCHAR(50) NOT NULL PRIMARY KEY,
	MACV INT NOT NULL,
	TENNV NVARCHAR(50) NOT NULL,
	EMAIL NVARCHAR(50) NOT NULL,
	MATKHAU NVARCHAR(50) NOT NULL,
	DIACHI NVARCHAR(50) NOT NULL,
	DIENTHOAI NVARCHAR(50) NOT NULL,
	NGAYSINH DATE NOT NULL,
	GIOITINH BIT NOT NULL,
	TRANGTHAI BIT NOT NULL
)

ALTER TABLE SANPHAM ADD CONSTRAINT FK_SANPHAM_LOAIHANG FOREIGN KEY (MALH) REFERENCES LOAIHANG(MALH);
ALTER TABLE SANPHAM ADD CONSTRAINT FK_SANPHAM_HANG FOREIGN KEY (MAHANG) REFERENCES HANG(MAHANG);


ALTER TABLE CHITIETHOADON ADD CONSTRAINT FK_CTHD_SANPHAM FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP);
ALTER TABLE CHITIETHOADON ADD CONSTRAINT FK_HOADON_CHITIETHOADON FOREIGN KEY (MAHD) REFERENCES HOADON(MAHD);

ALTER TABLE GIOHANGTAM ADD CONSTRAINT FK_GIOHANG_GIOHANGTAM FOREIGN KEY (MAGH) REFERENCES GIOHANG(MAGH);
ALTER TABLE GIOHANG ADD CONSTRAINT FK_GIOHANG_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH);
ALTER TABLE GIOHANG ADD CONSTRAINT FK_GIOHANG_TAIKHOAN FOREIGN KEY (TENDN) REFERENCES TAIKHOAN(TENDN);

ALTER TABLE GIOHANGTAM ADD  CONSTRAINT FK_GIOHANG_SANPHAM FOREIGN KEY (MASP) REFERENCES SANPHAM (MASP);

ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_GIOHANG FOREIGN KEY (MAGH) REFERENCES GIOHANG(MAGH);
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_TAIKHOAN FOREIGN KEY (TENDN) REFERENCES TAIKHOAN(TENDN);
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH);

ALTER TABLE TAIKHOAN ADD CONSTRAINT FK_TAIKHOAN_CHUCVU FOREIGN KEY (MACV) REFERENCES CHUCVU(MACV);


INSERT INTO LOAIHANG VALUES
	(N'TN', N'Tai nghe'),
	(N'SDP', N'Sạc dự phòng'),
	(N'BP', N'Bàn phím'),
	(N'LC', N'Lót chuột'),
	(N'GDLT', N'Giá đỡ laptop')

INSERT INTO HANG VALUES 
	(N'SS', N'SAMSUNG'),
	(N'SN', N'SONY'),
	(N'AP', N'APPLE'),
	(N'TSB', N'TOSHIBA'),
	(N'RZ', N'RAZER')


INSERT INTO SANPHAM VALUES
	(N'SP01', N'Tai nghe AirPod pro', N'TN', N'AP', 1000000, 1200000, CAST('7-10-2022' AS DATE), 'SP01', ''),
	(N'SP02', N'Sạc dự phòng Sony', N'SDP', N'SN', 300000, 400000, CAST('7-11-2020' AS DATE), 'SP02', ''),
	(N'SP03', N'Bàn phím RAZER', N'BP', N'RZ', 800000, 1000000, CAST('12-1-2020' AS DATE), 'SP03', ''),
	(N'SP04', N'Lót chuột in hình tùy chọn', N'LC', N'TSB', 30000, 50000, CAST('7-7-2022' AS DATE), 'SP04', ''),
	(N'SP05', N'Giá đỡ laptop bằng nhôm', N'GDLT', N'SN', 100000, 120000, CAST('10-11-2022' AS DATE), 'SP05', '')

INSERT INTO CHUCVU VALUES 
	(0, N'Quản lí', ''),
	(1, N'Nhân viên', ''),
	(2, N'Admin', '')


INSERT INTO TAIKHOAN VALUES
	(N'DangTH', 0, N'Trần Hữu Đang', 'dangthpc04349@fpt.edu.vn', '123', N'Vĩnh Long', '0123654987', CAST('7-9-2003' AS DATE), 1, 0),
	(N'VinhPQ', 1, N'Phùng Quốc Vinh', 'vinhpqpc04338@fpt.edu.vn', '123', N'Cần Thơ', '0123654987', CAST('5-11-2002' AS DATE), 1, 0),
	(N'DanNK', 1, N'Nguyễn Khánh Đan', 'dannkpc04351@fpt.edu.vn', '123', N'Cần Thơ', '0123654987', CAST('7-11-2022' AS DATE), 0, 1),
	(N'SyDH', 1, N'Đoàn Hiệp Sỹ', 'sydhpc04388@fpt.edu.vn', '123', N'An Giang', '0123654987', CAST('7-4-2003' AS DATE), 1, 0),
	(N'ViLB', 1, N'Lê Bích Vi', 'vilbpc04354@fpt.edu.vn', '123', N'Cà Mau', '0123654987', CAST('2-6-2003' AS DATE), 0, 1)
	

INSERT INTO KHACHHANG VALUES
	(N'An', N'Nguyễn Văn An', '0123456781', N'Vĩnh Long', 0),
	(N'DinhPQ', N'Quốc Dinh', '0123456782', N'Cần Thơ', 0),
	(N'Quyen', N'Lâm Tố Quyên', '0123456783', N'Cần Thơ', 0),
	(N'Han', N'Đào Ngọc Hân', '0123456784', N'An Giang', 0),
	(N'Duyen', N'Trần Thị Mỹ Duyên', '0123456785', N'Cà Mau', 0)

INSERT INTO GIOHANG VALUES 
	(N'0123456781', N'An', N'VinhPQ'),
	(N'0123456782', N'DinhPQ', N'VinhPQ'),
	(N'0123456783', N'Quyen', N'DanNK'),
	(N'0123456784', N'Han', N'DanNK'),
	(N'0123456785', N'Duyen', N'SyDH')

INSERT INTO GIOHANGTAM VALUES 
	(N'0123456781', N'SP02',1),
	(N'0123456781', N'SP01',2),
	(N'0123456782', N'SP02',3),
	(N'0123456783', N'SP01',4),
	(N'0123456784', N'SP04',5),
	(N'0123456785', N'SP01',6)

INSERT INTO HOADON VALUES
	(N'HD01', N'VinhPQ', N'An', N'0123456781', CAST('6-10-2022' AS DATE), 1600000, 0, 0 ,1600000),
	(N'HD02', N'VinhPQ', N'DinhPQ', N'0123456782', CAST('7-11-2022' AS DATE), 400000, 0, 0 ,400000),
	(N'HD03', N'DanNK', N'Quyen', N'0123456783', CAST('7-11-2022' AS DATE), 1200000, 0, 0 ,1200000),
	(N'HD04', N'DanNK', N'Han', N'0123456784', CAST('8-11-2022' AS DATE), 50000, 0, 0 ,50000),
	(N'HD05', N'SyDH', N'Duyen',N'0123456785', CAST('9-11-2022' AS DATE), 1200000, 0, 0 ,1200000)

INSERT INTO CHITIETHOADON VALUES
	(N'CTHD01',N'HD01', N'SP02', 'SN', 'SDP', CAST('7-11-2022' AS DATE), N'Sạc dự phòng Sony', 'SONY', N'Sạc dự phòng', CAST('7-11-2022' AS DATE), 300000, 400000, 1),
	(N'CTHD02',N'HD01', N'SP01', 'AP', 'TN', CAST('6-10-2022' AS DATE), N'Tai nghe AirPod pro', 'APPLE', N'Tai nghe', CAST('7-10-2022' AS DATE), 1000000, 1200000, 1),
	(N'CTHD03',N'HD02', N'SP02', 'SN', 'SDP', CAST('7-11-2022' AS DATE), N'Sạc dự phòng Sony', 'SONY', N'Sạc dự phòng', CAST('7-11-2022' AS DATE), 300000, 400000, 1),
	(N'CTHD04',N'HD03', N'SP01', 'AP', 'TN', CAST('7-11-2022' AS DATE), N'Tai nghe AirPod pro', 'APPLE', N'Tai nghe', CAST('7-10-2022' AS DATE), 1000000, 1200000, 1),
	(N'CTHD05',N'HD04', N'SP04', 'LC', 'TSB', CAST('8-11-2022' AS DATE), N'Lót chuột in hình tùy chọn', 'TOSHIBA', N'Lót chuột', CAST('7-10-2022' AS DATE), 30000, 50000, 1),
	(N'CTHD06',N'HD05', N'SP01', 'AP', 'TN', CAST('9-11-2022' AS DATE), N'Tai nghe AirPod pro', 'APPLE', N'Tai nghe', CAST('7-10-2022' AS DATE), 1000000, 1200000, 2)


-- Thống kê nhân viên xuất sắc
CREATE PROC sp_NHANVIENXX
AS BEGIN
	SELECT 
		TK.TENNV,
		COUNT(HD.MAHD) SL
	FROM HOADON HD 
	JOIN TAIKHOAN TK ON TK.TENDN = HD.TENDN
	GROUP BY TK.TENNV
	ORDER BY SL DESC
END
GO


--Thống kê doanh thu theo ngày, tháng, năm
CREATE PROC sp_ThongKeDoanhThu_DMY (@Day INT, @Month INT, @Year INT)
AS BEGIN
	SELECT
		HD.NGAYLAP,
		SUM(HD.THANHTIEN) TONGTIENHOMNAY
	FROM HOADON HD
		WHERE DAY(NGAYLAP) = @Day AND MONTH(NGAYLAP) = @Month AND YEAR(NGAYLAP) = @Year
		GROUP BY HD.NGAYLAP
END
GO


--Thống kê doanh thu theo tháng, năm
CREATE PROC sp_ThongKeDoanhThu_MY (@Month INT, @Year INT)
AS BEGIN
	SELECT
		HD.NGAYLAP,
		SUM(HD.THANHTIEN) TONGTIENHOMNAY
	FROM HOADON HD
		WHERE MONTH(NGAYLAP) = @Month AND YEAR(NGAYLAP) = @Year
		GROUP BY HD.NGAYLAP
END
GO


--Thống kê doanh thu theo năm
CREATE PROC sp_ThongKeDoanhThu_Y (@Year INT)
AS BEGIN
	SELECT
		YEAR(NGAYLAP) NAM,
		SUM(HD.THANHTIEN) TONGTIENHOMNAY
	FROM HOADON HD
		WHERE YEAR(NGAYLAP) = @Year
		GROUP BY YEAR(NGAYLAP)
END
GO


--Thống kê sản phẩm bán chạy theo ngày, tháng, năm
CREATE PROC sp_ThongKeDoanhThu_SP_DMY (@Day int, @Month int, @Year int)
AS BEGIN
	SELECT
		SP.MASP,
		SP.TENSP,
		COUNT(HD.MAHD) LUOTBAN
		
	FROM HOADON HD
	JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
	JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
		WHERE DAY(HD.NGAYLAP) = @Day AND MONTH(HD.NGAYLAP) = @Month AND YEAR(HD.NGAYLAP) = @Year
		GROUP BY SP.MASP, SP.TENSP
		ORDER BY LUOTBAN DESC
END
GO


--Thống kê sản phẩm bán chạy theo tháng, năm
CREATE PROC sp_ThongKeDoanhThu_SP_MY (@Month int, @Year int)
AS BEGIN
	SELECT
		SP.MASP,
		SP.TENSP,
		COUNT(HD.MAHD) LUOTBAN
		
	FROM HOADON HD
	JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
	JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
		WHERE MONTH(HD.NGAYLAP) = @Month AND YEAR(HD.NGAYLAP) = @Year
		GROUP BY SP.MASP, SP.TENSP
		ORDER BY LUOTBAN DESC
END
GO
 

--Thống kê sản phẩm bán chạy theo năm
CREATE PROC sp_ThongKeDoanhThu_SP_Y (@Year int)
AS BEGIN
	SELECT
		SP.MASP,
		SP.TENSP,
		COUNT(HD.MAHD) LUOTBAN
		
	FROM HOADON HD
	JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
	JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
		WHERE YEAR(HD.NGAYLAP) = @Year
		GROUP BY SP.MASP, SP.TENSP
		ORDER BY LUOTBAN DESC
END
GO


--Thống kê sản phẩm theo loại
CREATE PROC sp_ThongKeDoanhThu_SPLOAI_Y (@Year int)
AS BEGIN
	SELECT
		LH.TENLH,
		COUNT(HD.MAHD) LUOTBAN
	FROM HOADON HD
	JOIN CHITIETHOADON CTHD ON HD.MAHD = CTHD.MAHD
	JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
	JOIN LOAIHANG LH ON LH.MALH = SP.MALH
		WHERE YEAR(HD.NGAYLAP) = @Year
		GROUP BY LH.TENLH
		ORDER BY LUOTBAN DESC
END
GO





