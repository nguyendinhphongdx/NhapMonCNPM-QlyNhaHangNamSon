CREATE DATABASE db_nmcnpm;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `tbl_tai_khoan` (
	`id`	INTEGER NOT NULL UNIQUE,
	`email`	TEXT,
	`mat_khau`	TEXT,
	`status`	INTEGER,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `tbl_phieu_order_mon` (
	`id`	INTEGER,
	`id_mon`	INTEGER
);
CREATE TABLE IF NOT EXISTS `tbl_phieu_order` (
	`id`	INTEGER NOT NULL UNIQUE,
	`soban`	INTEGER,
	`ngay`	DATE,
	`id_nhan_vien`	INTEGER,
	`id_khach_hang`	INTEGER,
	`ten_mon`	TEXT,
	`so_luong`	INTEGER,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `tbl_nhap_nguyen_lieu` (
	`id`	INTEGER NOT NULL UNIQUE,
	`id_nhan_vien`	INTEGER,
	`ly_do`	TEXT,
	`ten_nguyen_lieu`	TEXT,
	`ngay_yeu_cau`	DATE,
	`so_luong`	INTEGER,
	`don_vi`	INTEGER,
	`status`	INTEGER,
	`so_luong_thuc`	INTEGER,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `tbl_nhan_vien` (
	`id`	INTEGER NOT NULL UNIQUE,
	`chuc_vu`	TEXT,
	`bo_phan`	TEXT,
	`ten`	TEXT,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `tbl_nguyen_lieu_mon` (
	`id`	INTEGER NOT NULL UNIQUE,
	`id_mon`	INTEGER,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `tbl_nguyen_lieu` (
	`id`	INTEGER NOT NULL UNIQUE,
	`ten`	TEXT,
	`so_luong`	INTEGER,
	`don_gia`	INTEGER,
	`don_vi`	INTEGER,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `tbl_mon_an` (
	`id`	INTEGER NOT NULL UNIQUE,
	`ten`	TEXT,
	`gia`	INTEGER,
	`don_vi`	INTEGER,
	`hinh_anh`	TEXT,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `tbl_khach_hang` (
	`id`	INTEGER NOT NULL UNIQUE,
	`name`	TEXT,
	`ngay_sinh`	Date,
	`dia_chi`	INTEGER,
	`sdt`	INTEGER,
	`email`	TEXT,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `tbl_hoa_don` (
	`id`	INTEGER NOT NULL UNIQUE,
	`number_table`	INTEGER,
	`ten_mon_an`	TEXT,
	`ngay_gio`	DATE,
	`so_luong`	INTEGER,
	`don_gia`	INTEGER,
	`chiet_khau`	INTEGER,
	`tien_dat_coc`	INTEGER,
	`id_khach_hang`	INTEGER,
	`id_nhan_vien`	INTEGER,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `tbl_chi_tiet_nhap` (
	`id`	INTEGER NOT NULL UNIQUE,
	`id_nguyen_lieu`	INTEGER,
	PRIMARY KEY(`id`)
);
COMMIT;
