CREATE DATABASE AppQLHV
GO
USE AppQLHV
GO

CREATE TABLE HocVien(
	MaHV CHAR(11) PRIMARY KEY ,
	HoTen NVARCHAR(30) DEFAULT NULL,
	NgaySinh DATETIME DEFAULT NULL,
	GioiTinh bit NOT NULL,
	DienThoai VARCHAR(10) DEFAULT NULL,
	DiaChi NVARCHAR(30) DEFAULT NULL,
	TinhTrang BIT NOT NULL
)


CREATE TABLE KhoaHoc(
	MaKH CHAR(11) PRIMARY KEY ,
	TenKH NVARCHAR(30) DEFAULT NULL,
	MoTa NVARCHAR(30) DEFAULT NULL,
	NgayBD DATETIME DEFAULT NULL,
	NgayKT DATETIME DEFAULT NULL,
	TinhTrang BIT NOT NULL
)

CREATE TABLE LopHoc(
	MaLop CHAR(11) PRIMARY KEY,
	MaKH CHAR(11) REFERENCES dbo.KhoaHoc(MaKH),
	MaHV CHAR(11) REFERENCES dbo.HocVien(MaHV),
	NgayDK DATETIME DEFAULT NULL,
	TinhTrang BIT NOT NULL
)

-----------------------------
INSERT INTO dbo.HocVien
VALUES
(   '1914775',        -- MaHV - char(11)
    N'Đinh Trọng Đạt',       -- HoTen - nvarchar(30)
    '09/03/2001', -- NgaySinh - datetime
    1,      -- GioiTinh - bit
    '0865447141',        -- DienThoai - varchar(10)
    N'Đà Lạt',       -- DiaChi - nvarchar(30)
    1       -- TinhTrang - bit
    )
INSERT INTO dbo.HocVien
VALUES 
(   '1914899',        -- MaHV - char(11)
    N'Trần Minh Cảnh',       -- HoTen - nvarchar(30)
    '08/06/2001', -- NgaySinh - datetime
    1,      -- GioiTinh - bit
    '0868451257',        -- DienThoai - varchar(10)
    N'Đà Lạt',       -- DiaChi - nvarchar(30)
    1       -- TinhTrang - bit
    )

	SELECT * FROM dbo.HocVien 