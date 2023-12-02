CREATE DATABASE ASMJAVA6
GO

USE ASMJAVA6
GO

CREATE TABLE HangMayAnh(
	MaHang INT IDENTITY(1,1) PRIMARY KEY NOT NULL 
	, TenHang VARCHAR(100) NOT NULL UNIQUE
	, MoTa NVARCHAR(200)
)
GO

CREATE TABLE LoaiMayAnh(
	MaLoai INT IDENTITY(1,1) PRIMARY KEY NOT NULL
	, TenLoai NVARCHAR(100) NOT NULL UNIQUE
    , MoTa NVARCHAR(200)
)
GO

CREATE TABLE MayAnh(
	MaMaMayAnh INT IDENTITY(1,1) PRIMARY KEY NOT NULL
	, MaLoai INT
	, MaHang INT
	, GiaBan INT
	, SoLuong INT CHECK (SoLuong >= 0)
	, GioiThieu NVARCHAR(2000)
	, MoTa1 NVARCHAR(2000)
	, MoTa2 NVARCHAR(2000)
	, ChieuRong VARCHAR(100)
	, ChieuCao VARCHAR(100)
	, ChieuSau VARCHAR(100)
	, CanNang VARCHAR(100)
	, HinhChinh NVARCHAR(100)
	, HinhPhu1 NVARCHAR(100)
	, HinhPhu2 NVARCHAR(100)
	, HinhPhu3 NVARCHAR(100)
	, CONSTRAINT FK_MayAnh_LoaiMayAnh FOREIGN KEY (MaLoai) REFERENCES LoaiMayAnh(MaLoai)
	, CONSTRAINT FK_MayAnh_HangMayAnh FOREIGN KEY (MaHang) REFERENCES HangMayAnh(MaHang)
)
GO

CREATE TABLE NguoiDung(
	MaNguoiDung INT IDENTITY(1,1) PRIMARY KEY NOT NULL
	, TenDangNhap VARCHAR(100) NOT NULL UNIQUE
	, MatKhau VARCHAR(100) NOT NULL
	, Email VARCHAR(100) NOT NULL UNIQUE
	, Ho NVARCHAR(100)
	, Ten NVARCHAR(100)
	, SoDienThoai VARCHAR(10)
	, Tinh NVARCHAR(100)
	, Huyen NVARCHAR(100)
	, Xa NVARCHAR(100)
	, DiaChiCuThe NVARCHAR(200)
)
GO


CREATE TABLE DonHang(
	MaDonHang INT IDENTITY(1,1) PRIMARY KEY NOT NULL
	, MaNguoiDung INT
	, Ngay DATE
	, TongTien INT
	, PhuongThucThanhToan BIT DEFAULT 0
	, Tinh NVARCHAR(100)
	, Huyen NVARCHAR(100)
	, Xa NVARCHAR(100)
	, DiaChiCuThe NVARCHAR(200)
	, Email VARCHAR(100)
	, Ho NVARCHAR(100)
	, Ten NVARCHAR(100)
	, SoDienThoai VARCHAR(10)
	, CONSTRAINT FK_DonHang_NguoiDung FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung)
)
GO

CREATE TABLE DonHangChiTiet(
	IDDonHangChiTiet INT IDENTITY(1,1) PRIMARY KEY
	, MaDonHang INT
	, MaMayAnh INT
	, SoLuong INT
	, GiaBan INT
    , CONSTRAINT FK_DonHangChiTiet_DonHang FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang)
	, CONSTRAINT FK_DonHangChiTiet_MayAnh FOREIGN KEY (MaMayAnh) REFERENCES MayAnh(MaMaMayAnh)
)
GO

INSERT INTO HangMayAnh (TenHang, MoTa)
VALUES ('Canon', 'Máy ảnh Canon chất lượng cao'),
       ('Nikon', 'Máy ảnh Nikon chuyên nghiệp'),
       ('Sony', 'Máy ảnh Sony công nghệ tiên tiến'),
       ('Fujifilm', 'Máy ảnh Fujifilm với thiết kế đẹp'),
       ('Panasonic', 'Máy ảnh Panasonic nhẹ nhàng và tiện lợi');

-- Thêm dữ liệu mẫu cho bảng LoaiMayAnh
INSERT INTO LoaiMayAnh (TenLoai, MoTa)
VALUES ('DSLR', 'Máy ảnh DSLR'),
       ('Mirrorless', 'Máy ảnh Mirrorless'),
       ('Compact', 'Máy ảnh Compact'),
       ('Bridge', 'Máy ảnh Bridge'),
       ('Action', 'Máy ảnh chụp hành động');

-- Thêm dữ liệu mẫu cho bảng NguoiDung
INSERT INTO NguoiDung (TenDangNhap, MatKhau, Email, Ho, Ten, SoDienThoai, Tinh, Huyen, Xa, DiaChiCuThe)
VALUES ('user1', 'password1', 'user1@example.com', 'Nguyen', 'Van A', '0123456789', 'Tinh 1', 'Huyen 1', 'Xa 1', 'Dia chi 1'),
       ('user2', 'password2', 'user2@example.com', 'Tran', 'Thi B', '0987654321', 'Tinh 2', 'Huyen 2', 'Xa 2', 'Dia chi 2'),
       ('user3', 'password3', 'user3@example.com', 'Le', 'Van C', '0369852147', 'Tinh 3', 'Huyen 3', 'Xa 3', 'Dia chi 3'),
       ('user4', 'password4', 'user4@example.com', 'Pham', 'Van D', '0754321896', 'Tinh 4', 'Huyen 4', 'Xa 4', 'Dia chi 4'),
       ('user5', 'password5', 'user5@example.com', 'Hoang', 'Thi E', '0321654987', 'Tinh 5', 'Huyen 5', 'Xa 5', 'Dia chi 5');

-- Thêm dữ liệu mẫu cho bảng DonHang
INSERT INTO DonHang (MaNguoiDung, Ngay, TongTien, Tinh, Huyen, Xa, DiaChiCuThe, Email, Ho, Ten, SoDienThoai)
VALUES (1, '2023-11-20', 5000000, 'Tinh DH1', 'Huyen DH1', 'Xa DH1', 'Dia chi DH1', 'dh1@example.com', 'Ho 1', 'Ten 1', '0123456789'),
       (2, '2023-11-21', 8000000, 'Tinh DH2', 'Huyen DH2', 'Xa DH2', 'Dia chi DH2', 'dh2@example.com', 'Ho 2', 'Ten 2', '0987654321'),
       (3, '2023-11-22', 3000000, 'Tinh DH3', 'Huyen DH3', 'Xa DH3', 'Dia chi DH3', 'dh3@example.com', 'Ho 3', 'Ten 3', '0369852147'),
       (4, '2023-11-23', 6500000, 'Tinh DH4', 'Huyen DH4', 'Xa DH4', 'Dia chi DH4', 'dh4@example.com', 'Ho 4', 'Ten 4', '0754321896'),
       (5, '2023-11-24', 4200000, 'Tinh DH5', 'Huyen DH5', 'Xa DH5', 'Dia chi DH5', 'dh5@example.com', 'Ho 5', 'Ten 5', '0321654987');

-- Thêm dữ liệu mẫu cho bảng MayAnh
INSERT INTO MayAnh (MaLoai, MaHang, GiaBan, SoLuong, GioiThieu, MoTa1, MoTa2, ChieuRong, ChieuCao, ChieuSau, CanNang, HinhChinh, HinhPhu1, HinhPhu2, HinhPhu3)
VALUES (1, 1, 15000000, 50, 'Máy ảnh DSLR Canon', 'Đây là mô tả 1', 'Đây là mô tả 2', '10cm', '20cm', '15cm', '1kg', 'image1.jpg', 'image2.jpg', 'image3.jpg', 'image4.jpg'),
       (2, 2, 12000000, 40, 'Máy ảnh Mirrorless Nikon', 'Đây là mô tả 1', 'Đây là mô tả 2', '8cm', '18cm', '12cm', '800g', 'image5.jpg', 'image6.jpg', 'image7.jpg', 'image8.jpg'),
       (3, 3, 8000000, 30, 'Máy ảnh Compact Sony', 'Đây là mô tả 1', 'Đây là mô tả 2', '6cm', '15cm', '10cm', '500g', 'image9.jpg', 'image10.jpg', 'image11.jpg', 'image12.jpg'),
       (4, 4, 5000000, 20, 'Máy ảnh Bridge Fujifilm', 'Đây là mô tả 1', 'Đây là mô tả 2', '7cm', '16cm', '11cm', '600g', 'image13.jpg', 'image14.jpg', 'image15.jpg', 'image16.jpg'),
       (5, 5, 3000000, 25, 'Máy ảnh chụp hành động Panasonic', 'Đây là mô tả 1', 'Đây là mô tả 2', '5cm', '12cm', '9cm', '400g', 'image17.jpg', 'image18.jpg', 'image19.jpg', 'image20.jpg');

-- Thêm dữ liệu mẫu cho bảng DonHangChiTiet
INSERT INTO DonHangChiTiet (MaDonHang, MaMayAnh, SoLuong, GiaBan)
VALUES (1, 1, 2, 30000000),
       (2, 2, 1, 12000000),
       (3, 3, 3, 24000000),
       (4, 4, 4, 20000000),
       (5, 5, 2, 6000000);