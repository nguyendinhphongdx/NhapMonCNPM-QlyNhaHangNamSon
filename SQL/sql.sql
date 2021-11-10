﻿create database db_nhapmon;
use db_nhapmon;

/*________========TẠO BẢNG========________*/

CREATE TABLE tbl_tai_khoan(
	id INT NOT NULL,
	email TEXT,
	mat_khau TEXT,
	status INT,
	id_nhan_vien INT,
	PRIMARY KEY (id)
);

ALTER TABLE tbl_tai_khoan ALTER COLUMN email NVARCHAR(50);
ALTER TABLE tbl_tai_khoan ALTER COLUMN mat_khau NVARCHAR(50);
ALTER TABLE tbl_tai_khoan ALTER COLUMN status NVARCHAR(50);

CREATE TABLE tbl_nhan_vien(
	id INT NOT NULL,
	chuc_vu TEXT,
	bo_phan TEXT,
	ten TEXT,
	PRIMARY KEY (id)
);

ALTER TABLE tbl_nhan_vien ALTER COLUMN bo_phan NVARCHAR(50);
ALTER TABLE tbl_nhan_vien ALTER COLUMN ten NVARCHAR(100);

CREATE TABLE tbl_nguyen_lieu(
	id INT IDENTITY(1, 1) NOT NULL,
	ten TEXT,
	so_luong INT,
	don_gia INT,
	don_vi VARCHAR(50),
	PRIMARY KEY (id)
);
ALTER TABLE tbl_nguyen_lieu ALTER COLUMN ten NVARCHAR(100);
ALTER TABLE tbl_nguyen_lieu ALTER COLUMN don_vi NVARCHAR(50);
ALTER TABLE tbl_nguyen_lieu ALTER COLUMN ten NVARCHAR(50);

CREATE TABLE tbl_mon_an(
	id INT NOT NULL,
	ten TEXT,
	gia INT,
	don_vi VARCHAR(50),
	hinh_anh TEXT,
	PRIMARY KEY (id)
);

CREATE TABLE tbl_khach_hang(
	id INT NOT NULL,
	name TEXT,
	ngay_sinh DATE,
	dia_chi TEXT,
	sdt INT,
	email TEXT,
	PRIMARY KEY (id)
);

ALTER TABLE tbl_khach_hang ALTER COLUMN sdt NVARCHAR(50);
ALTER TABLE tbl_khach_hang ALTER COLUMN name NVARCHAR(100);
ALTER TABLE tbl_khach_hang ALTER COLUMN dia_chi NVARCHAR(250);

CREATE TABLE tbl_hoa_don(
	id INT NOT NULL,
	number_table INT,
	ten_mon_an TEXT,
	ngay_gio DATE,
	so_luong INT,
	don_gia INT,
	chiet_khau INT,
	tien_dat_coc INT,
	id_khach_hang INT,
	id_nhan_vien INT,
	PRIMARY KEY (id)
);

CREATE TABLE tbl_nhap_nguyen_lieu(
	id INT NOT NULL,
	id_nhan_vien INT,
	ly_do TEXT,
	ten_nguyen_lieu TEXT,
	ngay_yeu_cau DATE,
	so_luong INT,
	don_vi VARCHAR,
	status INT,
	so_luong_thuc INT,
	PRIMARY KEY (id)
);

CREATE TABLE tbl_phieu_order(
	id INT NOT NULL,
	soban INT,
	ngay DATE,
	id_nhan_vien INT,
	id_khach_hang INT,
	ten_mon TEXT,
	so_luong INT,
	PRIMARY KEY (id)
);

CREATE TABLE tbl_phieu_order_mon(
	id INT NOT NULL,
	id_mon INT
);

CREATE TABLE tbl_nguyen_lieu_mon(
	id INT NOT NULL,
	id_mon INT
);

CREATE TABLE tbl_chi_tiet_nhap(
	id INT NOT NULL,
	id_nguyen_lieu INT
);

/*--______TẠO RÀNG BUỘC FOREGIN KEY______--*/

ALTER TABLE tbl_phieu_order ADD id_hoadon INT;

ALTER TABLE tbl_phieu_order ADD CONSTRAINT FK_hoadon_phieu FOREIGN KEY (id_hoadon) REFERENCES tbl_hoa_don (id);

ALTER TABLE tbl_nhap_nguyen_lieu ADD CONSTRAINT FK_nhapNL_nv FOREIGN KEY (id_nhan_vien) REFERENCES tbl_nhan_vien (id);

ALTER TABLE tbl_tai_khoan ADD CONSTRAINT FK_taikhoan_nv FOREIGN KEY (id_nhan_vien) REFERENCES tbl_nhan_vien (id);

ALTER TABLE tbl_hoa_don ADD CONSTRAINT FK_hoadon_nv FOREIGN KEY (id_nhan_vien) REFERENCES tbl_nhan_vien (id);

ALTER TABLE tbl_hoa_don ADD CONSTRAINT FK_hoadon_kh FOREIGN KEY (id_khach_hang) REFERENCES tbl_khach_hang (id);

ALTER TABLE tbl_phieu_order_mon ADD CONSTRAINT FK_phieu_order_mon FOREIGN KEY (id_mon) REFERENCES tbl_mon_an (id);
ALTER TABLE tbl_phieu_order_mon ADD CONSTRAINT FK_phieu_order FOREIGN KEY (id) REFERENCES tbl_phieu_order (id);

ALTER TABLE tbl_nguyen_lieu_mon ADD CONSTRAINT FK_nguyen_lieu FOREIGN KEY (id) REFERENCES tbl_nguyen_lieu (id);
ALTER TABLE tbl_nguyen_lieu_mon ADD CONSTRAINT FK_mon FOREIGN KEY (id_mon) REFERENCES tbl_mon_an (id);

ALTER TABLE tbl_chi_tiet_nhap ADD CONSTRAINT FK_chi_tiet_nhap FOREIGN KEY (id) REFERENCES tbl_nhap_nguyen_lieu (id);
ALTER TABLE tbl_chi_tiet_nhap ADD CONSTRAINT FK_nguyen_lieu_nhap FOREIGN KEY (id_nguyen_lieu) REFERENCES tbl_nguyen_lieu (id);


INSERT INTO tbl_nguyen_lieu(ten, so_luong, don_gia, don_vi) VALUES (N'Mực', '500', '150000', 'kg'),
								   (N'Trứng', '100', '3000', 'quả'),
								   (N'Thịt', '250', '80000', 'kg');

INSERT INTO tbl_nguyen_lieu(ten, so_luong, don_gia, don_vi) VALUES (N'Cá', '500', '250000', 'kg');


--Tạo procedure lấy ra tài khoản, mật khẩu
CREATE PROCEDURE get_login
	@Taikhoan NVARCHAR(50),
	@Matkhau NVARCHAR(50)
AS
	BEGIN
		SELECT * FROM tbl_tai_khoan
		WHERE email = @Taikhoan AND mat_khau = @Matkhau
	END
GO
	EXECUTE get_login 'phongnguyendx@gmail.com','123';

--Tạo procedure lấy ra danh sách nguyên liệu
CREATE PROCEDURE get_taikhoan
AS
	BEGIN
		SELECT *, tbl_nhan_vien.* FROM tbl_tai_khoan
		INNER JOIN tbl_nhan_vien ON tbl_nhan_vien.id = tbl_tai_khoan.id_nhan_vien
		ORDER BY email ASC
	END

--Tạo procedure lấy ra danh sách nguyên liệu
CREATE PROCEDURE get_dsnguyenlieu
AS
	BEGIN
		SELECT * FROM tbl_nguyen_lieu
		ORDER BY ten ASC
	END

--Tạo procedure thêm nguyên liệu
CREATE PROCEDURE insert_nguyenlieu
	@ten nvarchar(100),
	@soluong int,
	@dongia int,
	@donvi varchar(50)
AS
	BEGIN
		INSERT INTO tbl_nguyen_lieu(ten, so_luong, don_gia, don_vi) VALUES (@ten, @soluong, @dongia, @donvi)
	END

CREATE PROCEDURE get_nguyenlieu_theoid
	@id int
AS
	BEGIN
		SELECT * FROM tbl_nguyen_lieu WHERE id = @id
	END

--Tạo procedure update nguyên liệu
CREATE PROCEDURE update_nguyenlieu
	@ma INT,
	@ten nvarchar(100),
	@soluong int,
	@dongia int,
	@donvi nvarchar(50)
AS
	BEGIN
		UPDATE tbl_nguyen_lieu 
		SET ten = @ten, so_luong = @soluong, don_gia = @dongia, don_vi = @donvi
		WHERE id = @ma
	END

CREATE PROCEDURE check_password
	@email NVARCHAR(50),
	@mkcu NVARCHAR(50)
AS
	BEGIN
		SELECT * FROM tbl_tai_khoan WHERE email = @email AND mat_khau = @mkcu
	END

CREATE PROCEDURE update_pass
	@email NVARCHAR(50),
	@mkmoi NVARCHAR(50)
AS
	BEGIN
		UPDATE tbl_tai_khoan 
		SET mat_khau = @mkmoi
		WHERE email = @email
	END