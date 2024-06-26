﻿--CREATE DATABASE DUAN1_SD
--USE DUAN1_SD
--GO

CREATE TABLE SANPHAM(
	ID VARCHAR(20) PRIMARY KEY,
	TenSanPham NVARCHAR(100) NOT NULL,
	MoTa NVARCHAR(255),
	NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	NgaySua DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	TrangThai NVARCHAR(100) NOT NULL
);
 -- DROP TABLE SANPHAM
GO
CREATE TABLE MAUSAC(
	ID VARCHAR(20) PRIMARY KEY,
	TenMau NVARCHAR(100) NOT NULL,
	MoTa NVARCHAR(255),
	NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	NgaySua DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	TrangThai NVARCHAR(100) NOT NULL
);
--DROP TABLE MAUSAC
GO
CREATE TABLE SIZE(
	ID VARCHAR(20) PRIMARY KEY,
	Ten NVARCHAR(100) NOT NULL,
	MoTa NVARCHAR(255),
	NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	NgaySua DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	TrangThai NVARCHAR(100) NOT NULL
);
--DROP TABLE SIZE

GO
CREATE TABLE CHATLIEU(
	ID VARCHAR(20) PRIMARY KEY,
	Ten NVARCHAR(100) NOT NULL,
	MoTa NVARCHAR(255),
	NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	NgaySua DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	TrangThai NVARCHAR(100) NOT NULL
);
--DROP TABLE CHATLIEU

GO
CREATE TABLE THUONGHIEU(
	ID VARCHAR(20) PRIMARY KEY,
	Ten NVARCHAR(100) NOT NULL,
	MoTa NVARCHAR(255),
	NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	NgaySua DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	TrangThai NVARCHAR(100) NOT NULL
);
--DROP TABLE THUONGHIEU

GO
CREATE TABLE SANPHAMCHITIET(
	ID VARCHAR(20) PRIMARY KEY,
	ID_SanPham VARCHAR(20) REFERENCES SANPHAM(ID),
	ID_MauSac VARCHAR(20) REFERENCES MAUSAC(ID),
	ID_Size VARCHAR(20) REFERENCES SIZE(ID),
	ID_ChatLieu VARCHAR(20) REFERENCES CHATLIEU(ID),
	ID_ThuongHieu VARCHAR(20) REFERENCES THUONGHIEU(ID),
	GiaBan DECIMAL(20,0) NOT NULL,
	SoLuongTon INT NOT NULL,
	MoTa NVARCHAR(255),
	NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	NgaySua DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	TrangThai NVARCHAR(100) NOT NULL
);
-- DROP TABLE SANPHAMCHITIET
GO
CREATE TABLE NHANVIEN(
	ID VARCHAR(20) PRIMARY KEY,
	HoTen NVARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	SoDienThoai VARCHAR(15) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	NamSinh INT NOT NULL,
	GioiTinh NVARCHAR(10) NOT NULL,
	ChucVu BIT NOT NULL,
	MatKhau VARCHAR(50) NOT NULL,
	NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	NgaySua DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	TrangThai NVARCHAR(100) NOT NULL
);
--DROP TABLE NHANVIEN
GO
CREATE TABLE KHACHHANG(
	ID VARCHAR(20) PRIMARY KEY,
	HoTen NVARCHAR(50) NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	SoDienThoai VARCHAR(15) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	GioiTinh NVARCHAR(10) NOT NULL,
	NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	NgaySua DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	TrangThai NVARCHAR(100) NOT NULL
);
-- DROP TABLE KHACHHANG
GO
CREATE TABLE VOUCHER(
	ID VARCHAR(20) PRIMARY KEY,
	TenVoucher NVARCHAR(50) NOT NULL,
	SoLuong INT NOT NULL,
	LoaiVoucher NVARCHAR(50) NOT NULL,
	MucGiamGia DECIMAL(20,3) NOT NULL,
	NgayBatDau DATETIME NOT NULL,
	NgayKetThuc DATETIME NOT NULL,
	MoTa NVARCHAR(255),
	NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	NgaySua DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	TrangThai NVARCHAR(100) NOT NULL
);
--DROP TABLE VOUCHER
GO
CREATE TABLE HOADON(
	ID VARCHAR(20) PRIMARY KEY,
	ID_NhanVien VARCHAR(20) REFERENCES NHANVIEN(ID),
	ID_KhachHang VARCHAR(20) REFERENCES KHACHHANG(ID),
	ID_Voucher VARCHAR(20) REFERENCES VOUCHER(ID),
	HinhThucThanhToan NVARCHAR(50),
	TongTien DECIMAL(20,0) NOT NULL,
	NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	NgaySua DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	TrangThai NVARCHAR(100) NOT NULL
);
-- DROP TABLE HOADON
GO
CREATE TABLE HOADONCHITIET(
	ID VARCHAR(20) PRIMARY KEY,
	ID_HoaDon VARCHAR(20) REFERENCES HOADON(ID),
	ID_SanPhamChiTiet VARCHAR(20) REFERENCES SANPHAMCHITIET(ID),
	SoLuong INT NOT NULL,
	ThanhTien DECIMAL(20,0) NOT NULL,
	NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	NgaySua DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
	TrangThai NVARCHAR(100) NOT NULL
);
--DROP TABLE HOADONCHITIET
GO
-------------
-------------
INSERT INTO SANPHAM(ID, TenSanPham, MoTa, NgayTao, NgaySua, TrangThai)
VALUES ('SP01', N'ICONDENIM Herringbone Collar', N'Họa tiết in logo nổi tinh tế', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Ngừng kinh doanh'),
       ('SP02', N'ICONDENIM Heritage Line', N'Họa tiết in logo nổi đơn giản nhỏ gọn, tạo điểm nhấn tinh tế', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Ngừng kinh doanh'),
       ('SP03', N'ICONDENIM Classic Urban', N'Họa tiết in nổi nhỏ nhắn tinh tế', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Ngừng kinh doanh'),
       ('SP04', N'ICONDENIM Basic With Logo', N'Thiết kế áo đơn giản, không họa tiết', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Ngừng kinh doanh'),
       ('SP05', N'ICONDENIM Border Raglan', N'Ứng dụng kiểu dáng Raglan theo xu hướng hiện tại', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đang kinh doanh')

SELECT * FROM SANPHAM WHERE TrangThai = N'Ngừng kinh doanh'
--
GO
INSERT INTO MAUSAC(ID, TenMau, NgayTao, NgaySua, TrangThai)
VALUES ('MS001', N'Trắng', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn màu'),
       ('MS002', N'Đen', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn màu'),
	   ('MS003', N'Xanh', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hết màu'),
	   ('MS004', N'Be', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn màu')

SELECT * FROM MAUSAC
--
GO
INSERT INTO SIZE(ID, Ten, MoTa, NgayTao, NgaySua, TrangThai)
VALUES ('S001', N'Size S', N'Cân nặng 53-60kg; Ngang vai: 44cm; Rộng ngực: 100cm; Dài áo: 69cm', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn size'),
       ('S002', N'Size M', N'Cân nặng 60-68kg; Ngang vai: 45cm; Rộng ngực: 104cm; Dài áo: 70cm', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn size'),
       ('S003', N'Size L', N'Cân nặng 68-78kg; Ngang vai: 46cm; Rộng ngực: 108cm; Dài áo: 71cm', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn size'),
       ('S004', N'Size XL', N'Cân nặng 78-88kg; Ngang vai: 48cm; Rộng ngực: 112cm; Dài áo: 72cm', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hết size')

SELECT * FROM SIZE
--
GO
INSERT INTO CHATLIEU(ID, Ten, MoTa, NgayTao, NgaySua, TrangThai)
VALUES ('CL001', N'Chất vải CVC', N'Chất vải CVC co giãn thoải mái, bề mặt vải thông thoáng', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn'),
       ('CL002', N'Chất liệu Cotton', N'Chất liệu Cotton mềm mại, co giãn, thông thoáng tối đa.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn'),
       ('CL003', N'Chất vải cá sấu', N'Chất vải cá sấu co giãn 2 chiều thoải mái, bề mặt vải thông thoáng.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn'),
       ('CL004', N'Chất vải nhung', N'Chất vải nhung gân mềm mịn, hỗ trợ giữ nhiệt nhẹ.', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hết')

SELECT * FROM CHATLIEU
--
GO
INSERT INTO THUONGHIEU(ID, Ten, NgayTao, NgaySua, TrangThai)
VALUES ('TH001', N'LACOSTE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn hoạt động'),
       ('TH002', N'GUCCI', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn hoạt động'),
       ('TH003', N'HUGO BOSS', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Không hoạt động'),
       ('TH004', N'RALPH LAUREN', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Không hoạt động')

SELECT * FROM THUONGHIEU
--
GO
INSERT INTO SANPHAMCHITIET(ID, ID_SanPham, ID_MauSac, ID_Size, ID_ChatLieu, ID_ThuongHieu, GiaBan, SoLuongTon, NgayTao, NgaySua, TrangThai)
VALUES ('SPCT01', 'SP01', 'MS001', 'S004',  'CL004', 'TH003', 1990000, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hết hàng'),
       ('SPCT02', 'SP01', 'MS002', 'S003',  'CL001', 'TH001', 1990000, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn hàng'),
       ('SPCT03', 'SP01', 'MS001', 'S002',  'CL002', 'TH002', 1890000, 15, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn hàng'),
       ('SPCT04', 'SP01', 'MS004', 'S001',  'CL003', 'TH001', 2090000, 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn hàng'),
       ('SPCT05', 'SP01', 'MS001', 'S002',  'CL004', 'TH002', 2090000, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hết hàng'),
       ('SPCT06', 'SP01', 'MS003', 'S003',  'CL001', 'TH004', 1790000, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hết hàng'),
       ('SPCT07', 'SP02', 'MS004', 'S002',  'CL002', 'TH002', 1790000, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn hàng'),
       ('SPCT08', 'SP03', 'MS001', 'S003',  'CL003', 'TH001', 1790000, 15, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn hàng'),
       ('SPCT09', 'SP05', 'MS002', 'S002',  'CL001', 'TH003', 1690000, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hết hàng'),
       ('SPCT10', 'SP04', 'MS004', 'S001',  'CL002', 'TH001', 1690000, 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Còn hàng')
SELECT * FROM SANPHAMCHITIET  ORDER BY NgayTao DESC
--
GO
INSERT INTO NHANVIEN(ID, HoTen, DiaChi, SoDienThoai, Email, NamSinh, GioiTinh, ChucVu, MatKhau, NgayTao, NgaySua, TrangThai)
VALUES ('NV01', N'Cấn Thị Mỹ Linh', N'Hà Nội', '03456255672', 'linhctm@gmail.com', 2002, N'Nữ', 1, '123456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0),
       ('NV02', N'Nguyễn Xuân Dũng', N'Nghệ An', '0914355252', 'dungnx@gmail.com', 2004, N'Nam', 1, '123456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0),
	   ('NV03', N'Nguyễn Việt Anh', N'Hà Nội', '0357273774', 'anhnv@gmail.com', 2003, N'Nam', 0, '123456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0),
	   ('NV04', N'Nguyễn Thế Thắng', N'Bắc Ninh', '0328842888', 'thangnt@gmail.com', 2004, N'Nam', 0, '123456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0),
	   ('NV05', N'Nguyễn Tường Vân', N'Hà Nội', '0975539951', 'vannt@gmail.com', 2004, N'Nữ', 0, '123456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 0)
SELECT * FROM NHANVIEN
--
GO
INSERT INTO KHACHHANG(ID, HoTen, DiaChi, SoDienThoai, Email, GioiTinh, NgayTao, NgaySua, TrangThai)
VALUES ('KH001', N'Nguyễn Hải Sơn', N'Hải Phòng', '0737657274', 'sonnh@gmail.com', N'Nam', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hoạt động'),
       ('KH002', N'Vũ Huy Hoàng', N'Hải Phòng', '0784775823', 'hoangvh@gmail.com', N'Nam', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hoạt động'),
	   ('KH003', N'Đàm Anh Tuấn', N'Phú Thọ', '0984829943', 'tuanda@gmail.com', N'Nam', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hoạt động'),
	   ('KH004', N'Nguyễn Khánh Huyền', N'Hà Nội', '0987377423', 'huyennk@gmail.com', N'Nữ', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hoạt động'),
	   ('KH005', N'Đinh Hải Yến', N'Nam Định', '0335223366', 'yendh@gmail.com', N'Nữ', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hoạt động')
SELECT * FROM KHACHHANG
--
GO
INSERT INTO KHACHHANG(ID, HoTen, DiaChi, SoDienThoai, Email, GioiTinh, NgayTao, NgaySua, TrangThai)Values
('KH00', N'Khách bán lẻ', N'Hà nội', '0123456789', 'khachbanle@gmail.com', N'Nam', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hoạt động');
GO
INSERT INTO VOUCHER(ID, TenVoucher, SoLuong, LoaiVoucher, MucGiamGia, NgayBatDau, NgayKetThuc, MoTa, NgayTao, NgaySua, TrangThai)
VALUES ('V001', 'Discount10%', 20, N'Giảm theo phần trăm', 10, '2024-03-18 00:00:00', '2024-04-30 00:00:00', N'Hóa đơn trên 1500K giảm 10%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hoạt động'),
       ('V002', 'Discount20%', 15, N'Giảm theo phần trăm', 20, '2024-03-18 00:00:00', '2024-04-30 00:00:00', N'Hóa đơn trên 4000K giảm 20%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hoạt động'),
	   ('V003', 'Discount300K', 15, N'Giảm theo giá tiền', 300000, '2024-03-18 00:00:00', '2024-04-30 00:00:00', N'Hóa đơn trên 2000K giảm 300K', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hoạt động'),
	   ('V004', 'Discount700K', 10, N'Giảm theo giá tiền', 700000, '2024-03-18 00:00:00', '2024-04-30 00:00:00', N'Hóa đơn trên 3000K giảm 700K', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hoạt động')
--
INSERT INTO VOUCHER(ID, TenVoucher, SoLuong, LoaiVoucher, MucGiamGia, NgayBatDau, NgayKetThuc, MoTa, NgayTao, NgaySua, TrangThai)
VALUES ('V00', 'Discount0%', 20, N'Giảm theo phần trăm', 0, '2024-03-18 00:00:00', '2024-06-30 00:00:00', N'Hóa đơn trên 1500K giảm 10%', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Hoạt động');

SELECT * FROM VOUCHER
SELECT ID, TenVoucher, SoLuong, LoaiVoucher, MucGiamGia,MoTa, NgayBatDau, NgayKetThuc , TrangThai FROM VOUCHER
delete VOUCHER WHERE ID = 'Voucher05'
--
GO
INSERT INTO HOADON(ID, ID_NhanVien, ID_KhachHang, ID_Voucher, HinhThucThanhToan, TongTien, NgayTao, NgaySua, TrangThai)
VALUES ('HD001', 'NV01', 'KH001', 'V002', N'Chuyển khoản', 4696000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã thanh toán'),
       ('HD002', 'NV02', 'KH002', 'V001', N'Tiền mặt', 1701000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã thanh toán'),
       ('HD003', 'NV03', 'KH003', 'V003', N'Tiền mặt',1790000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Chờ thanh toán'),
       ('HD004', 'NV04', 'KH004', 'V001', N'Kết hợp',1661000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Chờ thanh toán'),
       ('HD005', 'NV01', 'KH005', 'V004', N'Chuyển khoản',2680000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã hủy'),
       ('HD006', 'NV01', 'KH001', 'V001', N'Tiền mặt',1791000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã thanh toán'),
       ('HD007', 'NV02', 'KH002', 'V003', N'Chuyển khoản',3180000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Chờ thanh toán'),
       ('HD008', 'NV03', 'KH003', 'V004', N'Kết hợp',4776000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã thanh toán')   
SELECT * FROM HOADON
DELETE HOADON WHERE ID  = 'HD068'
--
GO
INSERT INTO HOADONCHITIET(ID, ID_HoaDon, ID_SanPhamChiTiet, SoLuong, ThanhTien, NgayTao, NgaySua, TrangThai)
VALUES ('HDCT01', 'HD001', 'SPCT02', 2, 3980000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã thanh toán'),
       ('HDCT02', 'HD001', 'SPCT03', 1, 1890000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã thanh toán'),
       ('HDCT03', 'HD002', 'SPCT04', 1, 2090000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã thanh toán'),
       ('HDCT04', 'HD003', 'SPCT07', 2, 3580000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Chờ thanh toán'),
       ('HDCT05', 'HD004', 'SPCT08', 1, 1790000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Chờ thanh toán'),
       ('HDCT06', 'HD005', 'SPCT10', 2, 3380000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Chờ thanh toán'),
       ('HDCT07', 'HD006', 'SPCT02', 1, 1990000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã hủy'),
       ('HDCT08', 'HD007', 'SPCT03', 2, 3880000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã hủy'),
       ('HDCT09', 'HD008', 'SPCT04', 2, 4180000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã thanh toán'),
       ('HDCT10', 'HD008', 'SPCT07', 1, 1790000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, N'Đã thanh toán')
SELECT * FROM HOADONCHITIET 
DELETE TOP (10) FROM HOADONCHITIET
ORDER BY NgayTao DESC;

DELETE HOADONCHITIET WHERE ID = 'HDCT79'

--Tinh tong tien hoa don theo thang
SELECT MONTH(NgayTao) AS Thang, SUM(TongTien) AS TongTienHoaDon
FROM HOADON
GROUP BY MONTH(NgayTao);
--Tinh theo ngay
SELECT NgayTao, SUM(TongTien) AS TongTienHoaDon
FROM HOADON
GROUP BY NgayTao;
--tinh theo 7 ngay gan nhat
SELECT NgayTao, SUM(TongTien) AS TongTienHoaDon, COUNT(*) AS SoLuongSanPhamBan
FROM HOADON
WHERE NgayTao >= DATEADD(DAY, -7, GETDATE())
GROUP BY NgayTao
ORDER BY NgayTao;
--số lượng sản phẩm đã bán
SELECT SUM(SoLuong) AS SoLuongSanPhamDaBan
FROM HOADONCHITIET;

--
SELECT        SANPHAMCHITIET.ID, SANPHAM.TenSanPham, MAUSAC.TenMau, SIZE.Ten, CHATLIEU.Ten , THUONGHIEU.Ten , SANPHAMCHITIET.SoLuongTon, SANPHAMCHITIET.GiaBan, SANPHAMCHITIET.MoTa
FROM            SANPHAMCHITIET INNER JOIN
                         SANPHAM ON SANPHAMCHITIET.ID_SanPham = SANPHAM.ID INNER JOIN
                         MAUSAC ON SANPHAMCHITIET.ID_MauSac = MAUSAC.ID INNER JOIN
                         SIZE ON SANPHAMCHITIET.ID_Size = SIZE.ID INNER JOIN
                         CHATLIEU ON SANPHAMCHITIET.ID_ChatLieu = CHATLIEU.ID INNER JOIN
                         THUONGHIEU ON SANPHAMCHITIET.ID_ThuongHieu = THUONGHIEU.ID

--
SELECT MAX(CAST(SUBSTRING(ID, 3, LEN(ID)) AS INT)) AS maxID FROM VOUCHER
--
-- UPDATE VOUCHER SET TenVoucher = ?, SoLuong = ?, LoaiVoucher = ?, MucGiamGia = ?, MoTa = ? WHERE ID = ?
SELECT ID, TenVoucher, SoLuong, LoaiVoucher, MucGiamGia,MoTa FROM VOUCHER
--
SELECT MAX(CAST(SUBSTRING(ID, 5, LEN(ID)) AS INT)) AS maxID FROM HOADONCHITIET
---

SELECT        HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen AS TenKhachHang, VOUCHER.TenVoucher, HOADON.TongTien, HOADON.HinhThucThanhToan
FROM            HOADON INNER JOIN
                         NHANVIEN ON HOADON.ID_NhanVien = NHANVIEN.ID INNER JOIN
                         KHACHHANG ON HOADON.ID_KhachHang = KHACHHANG.ID INNER JOIN
                         VOUCHER ON HOADON.ID_Voucher = VOUCHER.ID

---
SELECT MAX(CAST(SUBSTRING(ID, 5, LEN(ID)) AS INT)) AS maxID FROM HOADON
--
SELECT        HOADONCHITIET.ID, SANPHAM.TenSanPham AS TenSP, MAUSAC.TenMau AS TenMS, SIZE.Ten AS TenSize, THUONGHIEU.Ten AS TenTT, CHATLIEU.Ten AS TenCL, SANPHAMCHITIET.GiaBan AS DonGia, 
                         HOADONCHITIET.SoLuong, HOADONCHITIET.ThanhTien
FROM            HOADONCHITIET INNER JOIN
                          SANPHAMCHITIET ON HOADONCHITIET.ID_SanPhamChiTiet = SANPHAMCHITIET.ID INNER JOIN
                         SANPHAM ON SANPHAM.ID = SANPHAMCHITIET.ID_SanPham INNER JOIN
                         MAUSAC ON SANPHAMCHITIET.ID_MauSac = MAUSAC.ID INNER JOIN
                         SIZE ON SANPHAMCHITIET.ID_Size = SIZE.ID INNER JOIN
                         THUONGHIEU ON SANPHAMCHITIET.ID_ThuongHieu = THUONGHIEU.ID INNER JOIN
                         CHATLIEU ON SANPHAMCHITIET.ID_ChatLieu = CHATLIEU.ID
						 where HOADONCHITIET.ID = 'HDCT01'
--
--DELETE FROM HOADONCHITIET WHERE ID = ?
--
SELECT ID_KhachHang, COUNT(*) AS Total
FROM HOADON
GROUP BY ID_KhachHang
--
SELECT        SANPHAM.ID AS MaSanPham, SANPHAM.TenSanPham as TenSanPham, SANPHAMCHITIET.GiaBan as DonGia, HOADONCHITIET.SoLuong as SoLuong, HOADONCHITIET.ThanhTien as ThanhTien
FROM            HOADONCHITIET INNER JOIN
                         SANPHAMCHITIET ON HOADONCHITIET.ID_SanPhamChiTiet = SANPHAMCHITIET.ID INNER JOIN
                         SANPHAM ON SANPHAMCHITIET.ID_SanPham = SANPHAM.ID
--
SELECT ID, ID_SanPham, ID_MauSac, ID_Size, ID_ChatLieu, ID_ThuongHieu, GiaBan, SoLuongTon, MoTa 
FROM SANPHAMCHITIET WHERE ID_SanPham = 'SP03'
--
--SELECT 
--    SANPHAMCHITIET.ID,
--    SANPHAM.TenSanPham,
--    MAUSAC.TenMau AS MauSac,
--    SIZE.Ten AS Size,
--    CHATLIEU.Ten AS ChatLieu,
--    THUONGHIEU.Ten AS ThuongHieu,
--    SANPHAMCHITIET.GiaBan,
--    SANPHAMCHITIET.SoLuongTon,
--    SANPHAMCHITIET.MoTa
--FROM 
--    SANPHAMCHITIET
--INNER JOIN 
--    SANPHAM ON SANPHAMCHITIET.ID_SanPham = SANPHAM.ID
--INNER JOIN 
--    MAUSAC ON SANPHAMCHITIET.ID_MauSac = MAUSAC.ID
--INNER JOIN 
--    SIZE ON SANPHAMCHITIET.ID_Size = SIZE.ID
--INNER JOIN 
--    CHATLIEU ON SANPHAMCHITIET.ID_ChatLieu = CHATLIEU.ID
--INNER JOIN 
--    THUONGHIEU ON SANPHAMCHITIET.ID_ThuongHieu = THUONGHIEU.ID
--INNER JOIN 
--    SANPHAMCHITIET AS SANPHAMCHITIET_1 ON SANPHAM.ID = SANPHAMCHITIET_1.ID_SanPham 
--                                          AND MAUSAC.ID = SANPHAMCHITIET_1.ID_MauSac 
--                                          AND SIZE.ID = SANPHAMCHITIET_1.ID_Size 
--                                          AND CHATLIEU.ID = SANPHAMCHITIET_1.ID_ChatLieu 
--                                          AND THUONGHIEU.ID = SANPHAMCHITIET_1.ID_ThuongHieu
--WHERE 
--    SANPHAM.ID = ?;
--
--SELECT 
--    SANPHAMCHITIET.ID,
--    SANPHAM.TenSanPham,
--    MAUSAC.TenMau AS MauSac,
--    SIZE.Ten AS Size,
--    CHATLIEU.Ten AS ChatLieu,
--    THUONGHIEU.Ten AS ThuongHieu,
--    SANPHAMCHITIET.GiaBan,
--    SANPHAMCHITIET.SoLuongTon,
--    SANPHAMCHITIET.MoTa
--FROM 
--    SANPHAMCHITIET
--INNER JOIN 
--    SANPHAM ON SANPHAMCHITIET.ID_SanPham = SANPHAM.ID
--INNER JOIN 
--    MAUSAC ON SANPHAMCHITIET.ID_MauSac = MAUSAC.ID
--INNER JOIN 
--    SIZE ON SANPHAMCHITIET.ID_Size = SIZE.ID
--INNER JOIN 
--    CHATLIEU ON SANPHAMCHITIET.ID_ChatLieu = CHATLIEU.ID
--INNER JOIN 
--    THUONGHIEU ON SANPHAMCHITIET.ID_ThuongHieu = THUONGHIEU.ID
--INNER JOIN 
--    SANPHAMCHITIET AS SANPHAMCHITIET_1 ON SANPHAM.ID = SANPHAMCHITIET_1.ID_SanPham 
--                                          AND MAUSAC.ID = SANPHAMCHITIET_1.ID_MauSac 
--                                          AND SIZE.ID = SANPHAMCHITIET_1.ID_Size 
--                                          AND CHATLIEU.ID = SANPHAMCHITIET_1.ID_ChatLieu 
--                                          AND THUONGHIEU.ID = SANPHAMCHITIET_1.ID_ThuongHieu
--WHERE 
--   MAUSAC.ID = ?;
   --
   SELECT 
    SANPHAMCHITIET.ID,
    SANPHAM.TenSanPham,
    MAUSAC.TenMau AS MauSac,
    SIZE.Ten AS Size,
    CHATLIEU.Ten AS ChatLieu,
    THUONGHIEU.Ten AS ThuongHieu,
    SANPHAMCHITIET.GiaBan,
    SANPHAMCHITIET.SoLuongTon,
    SANPHAMCHITIET.MoTa
FROM 
    SANPHAMCHITIET
INNER JOIN 
    SANPHAM ON SANPHAMCHITIET.ID_SanPham = SANPHAM.ID
INNER JOIN 
    MAUSAC ON SANPHAMCHITIET.ID_MauSac = MAUSAC.ID
INNER JOIN 
    SIZE ON SANPHAMCHITIET.ID_Size = SIZE.ID
INNER JOIN 
    CHATLIEU ON SANPHAMCHITIET.ID_ChatLieu = CHATLIEU.ID
INNER JOIN 
    THUONGHIEU ON SANPHAMCHITIET.ID_ThuongHieu = THUONGHIEU.ID
WHERE 
    SANPHAMCHITIET.SoLuongTon = 0;
--
SELECT 
    SANPHAMCHITIET.ID,
    SANPHAM.TenSanPham,
    MAUSAC.TenMau AS MauSac,
    SIZE.Ten AS Size,
    CHATLIEU.Ten AS ChatLieu,
    THUONGHIEU.Ten AS ThuongHieu,
    SANPHAMCHITIET.GiaBan,
    SANPHAMCHITIET.SoLuongTon,
    SANPHAMCHITIET.MoTa
FROM 
    SANPHAMCHITIET
INNER JOIN 
    SANPHAM ON SANPHAMCHITIET.ID_SanPham = SANPHAM.ID
INNER JOIN 
    MAUSAC ON SANPHAMCHITIET.ID_MauSac = MAUSAC.ID
INNER JOIN 
    SIZE ON SANPHAMCHITIET.ID_Size = SIZE.ID
INNER JOIN 
    CHATLIEU ON SANPHAMCHITIET.ID_ChatLieu = CHATLIEU.ID
INNER JOIN 
    THUONGHIEU ON SANPHAMCHITIET.ID_ThuongHieu = THUONGHIEU.ID
WHERE 
    SANPHAMCHITIET.SoLuongTon > 0;
--
SELECT COUNT(*) AS SoLuongSanPhamChiTiet
FROM SANPHAMCHITIET
WHERE ID_SanPham = 'SP01';
--
SELECT ID, TenSanPham, MoTa
FROM SANPHAM
WHERE ID IN (
    SELECT ID_SanPham
    FROM SANPHAMCHITIET
    GROUP BY ID_SanPham
    HAVING COUNT(*) > 0
);
--
SELECT ID, TenSanPham, MoTa
FROM SANPHAM
WHERE ID NOT IN (
    SELECT ID_SanPham
    FROM SANPHAMCHITIET
    GROUP BY ID_SanPham
    HAVING COUNT(*) > 0
);

--
SELECT SANPHAM.ID, SANPHAM.TenSanPham, COALESCE(SUM(SANPHAMCHITIET.SoLuongTon), 0) AS TongSoLuongChiTiet
FROM SANPHAM
LEFT JOIN SANPHAMCHITIET ON SANPHAM.ID = SANPHAMCHITIET.ID_SanPham
GROUP BY SANPHAM.ID, SANPHAM.TenSanPham;
--
SELECT 
    HOADONCHITIET.ID,
    SANPHAM.TenSanPham AS TenSanPham,
    MAUSAC.TenMau AS MauSac,
    SIZE.Ten AS Size,
    CHATLIEU.Ten AS ChatLieu,
    THUONGHIEU.Ten AS ThuongHieu,
    SANPHAMCHITIET.GiaBan AS DonGia,
    HOADONCHITIET.SoLuong,
    HOADONCHITIET.ThanhTien
FROM HOADONCHITIET
INNER JOIN SANPHAMCHITIET ON HOADONCHITIET.ID_SanPhamChiTiet = SANPHAMCHITIET.ID
INNER JOIN SANPHAM ON SANPHAMCHITIET.ID_SanPham = SANPHAM.ID
INNER JOIN MAUSAC ON SANPHAMCHITIET.ID_MauSac = MAUSAC.ID
INNER JOIN SIZE ON SANPHAMCHITIET.ID_Size = SIZE.ID
INNER JOIN CHATLIEU ON SANPHAMCHITIET.ID_ChatLieu = CHATLIEU.ID
INNER JOIN THUONGHIEU ON SANPHAMCHITIET.ID_ThuongHieu = THUONGHIEU.ID
WHERE HOADONCHITIET.ID_HoaDon = 'HD016';
--
SELECT * FROM HOADONCHITIET WHERE ID_HoaDon = 'HD002';
--
SELECT HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen AS TenKhachHang, VOUCHER.TenVoucher, SUM(HOADONCHITIET.ThanhTien) AS TongTien, HOADON.HinhThucThanhToan, HOADON.TrangThai
FROM HOADON
INNER JOIN NHANVIEN ON HOADON.ID_NhanVien = NHANVIEN.ID
INNER JOIN KHACHHANG ON HOADON.ID_KhachHang = KHACHHANG.ID
LEFT JOIN VOUCHER ON HOADON.ID_Voucher = VOUCHER.ID
INNER JOIN HOADONCHITIET ON HOADON.ID = HOADONCHITIET.ID_HoaDon
GROUP BY HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen, VOUCHER.TenVoucher, HOADON.HinhThucThanhToan, HOADON.TrangThai;
--
SELECT ID, NgayTao, ID_NhanVien, ID_KhachHang, ID_Voucher, TongTien, HinhThucThanhToan, TrangThai FROM HOADON
--
SELECT HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen AS TenKhachHang, VOUCHER.TenVoucher, SUM(HOADONCHITIET.ThanhTien) AS TongTien, HOADON.HinhThucThanhToan, HOADON.TrangThai
FROM HOADON
INNER JOIN NHANVIEN ON HOADON.ID_NhanVien = NHANVIEN.ID
INNER JOIN KHACHHANG ON HOADON.ID_KhachHang = KHACHHANG.ID
LEFT JOIN VOUCHER ON HOADON.ID_Voucher = VOUCHER.ID
INNER JOIN HOADONCHITIET ON HOADON.ID = HOADONCHITIET.ID_HoaDon
WHERE HOADON.TrangThai = N'Chờ thanh toán'
GROUP BY HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen, VOUCHER.TenVoucher, HOADON.HinhThucThanhToan, HOADON.TrangThai;
--
SELECT HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen AS TenKhachHang, VOUCHER.TenVoucher, HOADONCHITIET.ThanhTien AS TongTien, HOADON.HinhThucThanhToan, HOADON.TrangThai
FROM HOADON
INNER JOIN NHANVIEN ON HOADON.ID_NhanVien = NHANVIEN.ID
INNER JOIN KHACHHANG ON HOADON.ID_KhachHang = KHACHHANG.ID
LEFT JOIN VOUCHER ON HOADON.ID_Voucher = VOUCHER.ID
INNER JOIN HOADONCHITIET ON HOADON.ID = HOADONCHITIET.ID_HoaDon
WHERE HOADON.TrangThai = N'Chờ thanh toán';
--
SELECT DISTINCT HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen AS TenKhachHang, VOUCHER.TenVoucher, HOADON.TongTien, HOADON.HinhThucThanhToan, HOADON.TrangThai
FROM HOADON
INNER JOIN NHANVIEN ON HOADON.ID_NhanVien = NHANVIEN.ID
INNER JOIN KHACHHANG ON HOADON.ID_KhachHang = KHACHHANG.ID
LEFT JOIN VOUCHER ON HOADON.ID_Voucher = VOUCHER.ID
WHERE HOADON.TrangThai = N'Chờ thanh toán';
--
SELECT 
    HD.ID AS 'ID hoá đơn',
    NV.HoTen AS 'Tên nhân viên',
    HD.NgayTao AS 'Ngày tạo hoá đơn',
    KH.HoTen AS 'Tên khách hàng',
    V.TenVoucher AS 'Tên voucher',
    HD.TongTien AS 'Tổng tiền',
    HD.TrangThai AS 'Trạng thái',
    HD.HinhThucThanhToan AS 'Hình thức thanh toán'
FROM 
    HOADON HD
INNER JOIN 
    NHANVIEN NV ON HD.ID_NhanVien = NV.ID
INNER JOIN 
    KHACHHANG KH ON HD.ID_KhachHang = KH.ID
LEFT JOIN 
    VOUCHER V ON HD.ID_Voucher = V.ID;
--
SELECT 
    HD.ID ,
    NV.HoTen ,
    HD.NgayTao ,
    KH.HoTen,
    V.TenVoucher,
    HD.TongTien ,
    HD.TrangThai ,
    HD.HinhThucThanhToan
FROM 
    HOADON HD
INNER JOIN 
    NHANVIEN NV ON HD.ID_NhanVien = NV.ID
INNER JOIN 
    KHACHHANG KH ON HD.ID_KhachHang = KH.ID
LEFT JOIN 
    VOUCHER V ON HD.ID_Voucher = V.ID
WHERE 
    HD.TrangThai = N'Chờ thanh toán';
--
SELECT 
    ID AS 'ID hoá đơn',
    ID_NhanVien AS 'ID nhân viên',
    ID_KhachHang AS 'ID khách hàng',
    HinhThucThanhToan AS 'Hình thức thanh toán',
    TrangThai AS 'Trạng thái'
FROM HOADON
ORDER BY NgayTao DESC;
--
SELECT TOP 1
    ID AS 'ID hoá đơn',
    ID_NhanVien AS 'ID nhân viên',
    ID_KhachHang AS 'ID khách hàng',
    HinhThucThanhToan AS 'Hình thức thanh toán',
    TrangThai AS 'Trạng thái'
FROM HOADON
ORDER BY NgayTao DESC;
--
SELECT HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen AS TenKhachHang, VOUCHER.TenVoucher, SUM(HOADONCHITIET.ThanhTien) AS TongTien, HOADON.HinhThucThanhToan, HOADON.TrangThai
FROM HOADON
INNER JOIN NHANVIEN ON HOADON.ID_NhanVien = NHANVIEN.ID
INNER JOIN KHACHHANG ON HOADON.ID_KhachHang = KHACHHANG.ID
INNER JOIN VOUCHER ON HOADON.ID_Voucher = VOUCHER.ID
INNER JOIN HOADONCHITIET ON HOADON.ID = HOADONCHITIET.ID_HoaDon
WHERE HOADON.TrangThai = N'Chờ thanh toán'
GROUP BY HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen, VOUCHER.TenVoucher, HOADON.HinhThucThanhToan, HOADON.TrangThai;

SELECT HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen AS TenKhachHang,
VOUCHER.TenVoucher,
HOADON.TongTien,
HOADON.HinhThucThanhToan, 
HOADON.TrangThai
                FROM HOADON
                INNER JOIN NHANVIEN ON HOADON.ID_NhanVien = NHANVIEN.ID
                INNER JOIN KHACHHANG ON HOADON.ID_KhachHang = KHACHHANG.ID
                LEFT JOIN VOUCHER ON HOADON.ID_Voucher = VOUCHER.ID
               
                WHERE HOADON.TrangThai = N'Chờ thanh toán'
                GROUP BY HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen, VOUCHER.TenVoucher, HOADON.HinhThucThanhToan, HOADON.TrangThai,HOADON.TongTien ORDER BY NgayTao DESC
--
SELECT COUNT(*) AS count FROM SANPHAMCHITIET 
--
SELECT ID, NgayTao, ID_NhanVien, ID_KhachHang, ID_Voucher, TongTien, HinhThucThanhToan, TrangThai FROM HOADON
WHERE HOADON.TrangThai = N'Chờ thanh toán'
--
SELECT * FROM HOADON
WHERE HOADON.TrangThai = N'Chờ thanh toán'
--
SELECT * FROM KHACHHANG
--
DELETE FROM HOADON
WHERE ID IN (
    SELECT TOP 2 ID
    FROM HOADON
    ORDER BY NgayTao DESC
);

--
DELETE KHACHHANG WHERE ID = 'SP006'
--
UPDATE HOADON SET TongTien = 0 WHERE ID = 'HD032'
--
SELECT SANPHAMCHITIET.ID, SANPHAM.TenSanPham, MAUSAC.TenMau AS MauSac, SIZE.Ten AS Size, CHATLIEU.Ten AS ChatLieu, THUONGHIEU.Ten AS ThuongHieu, SANPHAMCHITIET_1.GiaBan, SANPHAMCHITIET_1.SoLuongTon, SANPHAMCHITIET_1.MoTa
FROM SANPHAMCHITIET
INNER JOIN SANPHAM ON SANPHAMCHITIET.ID_SanPham = SANPHAM.ID
INNER JOIN MAUSAC ON SANPHAMCHITIET.ID_MauSac = MAUSAC.ID
INNER JOIN SIZE ON SANPHAMCHITIET.ID_Size = SIZE.ID
INNER JOIN CHATLIEU ON SANPHAMCHITIET.ID_ChatLieu = CHATLIEU.ID
INNER JOIN THUONGHIEU ON SANPHAMCHITIET.ID_ThuongHieu = THUONGHIEU.ID
INNER JOIN SANPHAMCHITIET AS SANPHAMCHITIET_1 ON SANPHAM.ID = SANPHAMCHITIET_1.ID_SanPham
AND MAUSAC.ID = SANPHAMCHITIET_1.ID_MauSac
AND SIZE.ID = SANPHAMCHITIET_1.ID_Size
AND CHATLIEU.ID = SANPHAMCHITIET_1.ID_ChatLieu
AND THUONGHIEU.ID = SANPHAMCHITIET_1.ID_ThuongHieu
ORDER BY SANPHAMCHITIET.NgayTao DESC;
--
SELECT * FROM SANPHAM
--
SELECT ID, TenSanPham, MoTa FROM SANPHAM WHERE TrangThai = N'Ngừng kinh doanh'
--
SELECT SANPHAMCHITIET.ID, SANPHAM.TenSanPham, MAUSAC.TenMau AS TenMau, SIZE.Ten AS TenKichCo, CHATLIEU.Ten AS TenChatLieu, THUONGHIEU.Ten AS TenThuongHieu, SANPHAMCHITIET.GiaBan, SANPHAMCHITIET.SoLuongTon, MAUSAC.MoTa
FROM SANPHAMCHITIET
INNER JOIN SANPHAM ON SANPHAMCHITIET.ID_SanPham = SANPHAM.ID
INNER JOIN MAUSAC ON SANPHAMCHITIET.ID_MauSac = MAUSAC.ID
INNER JOIN SIZE ON SANPHAMCHITIET.ID_Size = SIZE.ID
INNER JOIN CHATLIEU ON SANPHAMCHITIET.ID_ChatLieu = CHATLIEU.ID
INNER JOIN THUONGHIEU ON SANPHAMCHITIET.ID_ThuongHieu = THUONGHIEU.ID
WHERE SANPHAM.TrangThai <> N'Ngừng kinh doanh'
AND SANPHAMCHITIET.SoLuongTon > 0
--
SELECT HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen AS TenKhachHang, VOUCHER.TenVoucher, HOADON.TongTien AS TongTien, HOADON.HinhThucThanhToan, HOADON.TrangThai
FROM HOADON
INNER JOIN NHANVIEN ON HOADON.ID_NhanVien = NHANVIEN.ID
INNER JOIN KHACHHANG ON HOADON.ID_KhachHang = KHACHHANG.ID
LEFT JOIN VOUCHER ON HOADON.ID_Voucher = VOUCHER.ID
WHERE HOADON.TrangThai = N'Đã hủy'
--
-- Tạo một bảng tạm để chứa dữ liệu theo tháng
DECLARE @MonthlyData TABLE (
    Thang INT,
    SoLuongHoaDon INT
)
--
-- Lấy dữ liệu số lượng hóa đơn theo từng tháng trong năm hiện tại
INSERT INTO @MonthlyData (Thang, SoLuongHoaDon)
SELECT MONTH(NgayTao) AS Thang, COUNT(*) AS SoLuongHoaDon
FROM HOADON
WHERE YEAR(NgayTao) = YEAR(GETDATE()) -- Lọc hóa đơn trong năm hiện tại
GROUP BY MONTH(NgayTao)

-- Khởi tạo biến cho 12 tháng
DECLARE @Thang1 INT, @Thang2 INT, @Thang3 INT, @Thang4 INT, @Thang5 INT, @Thang6 INT,
        @Thang7 INT, @Thang8 INT, @Thang9 INT, @Thang10 INT, @Thang11 INT, @Thang12 INT

-- Lấy số lượng hóa đơn của từng tháng
SELECT @Thang1 = MAX(CASE WHEN Thang = 1 THEN SoLuongHoaDon ELSE 0 END),
       @Thang2 = MAX(CASE WHEN Thang = 2 THEN SoLuongHoaDon ELSE 0 END),
       @Thang3 = MAX(CASE WHEN Thang = 3 THEN SoLuongHoaDon ELSE 0 END),
       @Thang4 = MAX(CASE WHEN Thang = 4 THEN SoLuongHoaDon ELSE 0 END),
       @Thang5 = MAX(CASE WHEN Thang = 5 THEN SoLuongHoaDon ELSE 0 END),
       @Thang6 = MAX(CASE WHEN Thang = 6 THEN SoLuongHoaDon ELSE 0 END),
       @Thang7 = MAX(CASE WHEN Thang = 7 THEN SoLuongHoaDon ELSE 0 END),
       @Thang8 = MAX(CASE WHEN Thang = 8 THEN SoLuongHoaDon ELSE 0 END),
       @Thang9 = MAX(CASE WHEN Thang = 9 THEN SoLuongHoaDon ELSE 0 END),
       @Thang10 = MAX(CASE WHEN Thang = 10 THEN SoLuongHoaDon ELSE 0 END),
       @Thang11 = MAX(CASE WHEN Thang = 11 THEN SoLuongHoaDon ELSE 0 END),
       @Thang12 = MAX(CASE WHEN Thang = 12 THEN SoLuongHoaDon ELSE 0 END)
FROM @MonthlyData

-- Hiển thị kết quả dưới dạng 12 cột
SELECT @Thang1 AS Thang1, @Thang2 AS Thang2, @Thang3 AS Thang3, @Thang4 AS Thang4,
       @Thang5 AS Thang5, @Thang6 AS Thang6, @Thang7 AS Thang7, @Thang8 AS Thang8,
       @Thang9 AS Thang9, @Thang10 AS Thang10, @Thang11 AS Thang11, @Thang12 AS Thang12

--
SELECT        HOADON.ID, HOADON.NgayTao, NHANVIEN.HoTen, KHACHHANG.HoTen AS TenKhachHang, VOUCHER.TenVoucher, HOADON.TongTien, HOADON.HinhThucThanhToan
                FROM            HOADON INNER JOIN
                                   NHANVIEN ON HOADON.ID_NhanVien = NHANVIEN.ID INNER JOIN
                                     KHACHHANG ON HOADON.ID_KhachHang = KHACHHANG.ID INNER JOIN
                                       VOUCHER ON HOADON.ID_Voucher = VOUCHER.ID