/*
Học phần cơ sở dữ liệu
Người thực hiện: Đinh Trọng Đạt
MSSV: 1914775
Ngày: 27/03/2021
*/
CREATE DATABASE Lab02_QLSX
GO
USE Lab02_QLSX
GO
CREATE TABLE CongNhan
(MACN CHAR(5) PRIMARY KEY,
Ho NVARCHAR(20) NOT NULL UNIQUE,
Ten NVARCHAR(10) NOT NULL UNIQUE,
Phai NVARCHAR(5),
NgaySinh DATETIME,
MATSX CHAR(5) REFERENCES ToSanXuat(MATSX)
)
ALTER TABLE dbo.CongNhan
ALTER COLUMN NgaySinh DATETIME

CREATE TABLE ToSanXuat
(MATSX CHAR(5) PRIMARY KEY,
TenTSX NVARCHAR(10) NOT NULL
)
CREATE TABLE SanPham
(MASP CHAR(5) PRIMARY KEY,
TenSP NVARCHAR(20) NOT NULL,
DVT NVARCHAR(5),
TienCong INT NOT NULL
)
CREATE TABLE ThanhPham
(MACN CHAR(5) REFERENCES dbo.CongNhan(MACN),
MASP CHAR(5) REFERENCES dbo.SanPham(MASP),
Ngay DATETIME,
SoLuong TINYINT NOT NULL,
PRIMARY KEY(MACN,MASP,Ngay)
)

--Nhập dữ liệu vào bảng
INSERT INTO dbo.CongNhan VALUES('CN001',N'Nguyễn Trường',N'An',N'Nam','05/12/1981','TS01')
INSERT INTO dbo.CongNhan
VALUES
(   'CN002',        -- MACN - char(5)
    N'Lê Thị Hồng',       -- Ho - nvarchar(20)
    N'Gấm',       -- Ten - nvarchar(10)
    N'Nữ',       -- Phai - nvarchar(5)
    '06/04/1980', -- NgaySinh - datetime
    'TS01'         -- MATSX - char(5)
    )
INSERT INTO dbo.CongNhan
VALUES
(   'CN003',        -- MACN - char(5)
    N'Nguyễn Công',       -- Ho - nvarchar(20)
    N'Thành',       -- Ten - nvarchar(10)
    N'Nam',       -- Phai - nvarchar(5)
    '05/04/1981', -- NgaySinh - datetime
    'TS02'         -- MATSX - char(5)
    )
INSERT INTO dbo.CongNhan
VALUES
(   'CN004',        -- MACN - char(5)
    N'Võ Hữu',       -- Ho - nvarchar(20)
    N'Hạnh',       -- Ten - nvarchar(10)
    N'Nam',       -- Phai - nvarchar(5)
    '02/15/1980', -- NgaySinh - datetime
    'TS02'         -- MATSX - char(5)
    )
INSERT INTO dbo.CongNhan
VALUES
(   'CN005',        -- MACN - char(5)
    N'Lý Thanh',       -- Ho - nvarchar(20)
    N'Hân',       -- Ten - nvarchar(10)
    N'Nữ',       -- Phai - nvarchar(5)
    '12/03/1981', -- NgaySinh - datetime
    'TS01'         -- MATSX - char(5)
    )

INSERT INTO dbo.ToSanXuat
VALUES
(   'TS01', -- MATSX - char(5)
    N'Tổ 1' -- TenTSX - nvarchar(10)
    )
INSERT INTO dbo.ToSanXuat
VALUES
(   'TS02', -- MATSX - char(5)
    N'Tổ 2' -- TenTSX - nvarchar(10)
    )

INSERT INTO dbo.SanPham
VALUES
(   'SP001',  -- MASP - char(5)
    N'Nồi đất', -- TenSP - nvarchar(20)
    N'cái', -- DVT - nvarchar(5)
    10000    -- TienCong - int
    )
INSERT INTO dbo.SanPham
VALUES
(   'SP002',  -- MASP - char(5)
    N'Chén', -- TenSP - nvarchar(20)
    N'cái', -- DVT - nvarchar(5)
    2000    -- TienCong - int
    )
INSERT INTO dbo.SanPham
VALUES
(   'SP003',  -- MASP - char(5)
    N'Bình gốm nhỏ', -- TenSP - nvarchar(20)
    N'cái', -- DVT - nvarchar(5)
    20000    -- TienCong - int
    )
INSERT INTO dbo.SanPham
VALUES
(   'SP004',  -- MASP - char(5)
    N'Bình gốm lớn', -- TenSP - nvarchar(20)
    N'cái', -- DVT - nvarchar(5)
    25000    -- TienCong - int
    )

INSERT INTO dbo.ThanhPham
VALUES
(   'CN001',        -- MACN - char(5)
    'SP001',        -- MASP - char(5)
    '02/01/2007', -- Ngay - datetime
    10          -- SoLuong - tinyint
    )
INSERT INTO dbo.ThanhPham
VALUES
(   'CN002',        -- MACN - char(5)
    'SP001',        -- MASP - char(5)
    '02/01/2007', -- Ngay - datetime
    5          -- SoLuong - tinyint
    )
INSERT INTO dbo.ThanhPham
VALUES
(   'CN003',        -- MACN - char(5)
    'SP002',        -- MASP - char(5)
    '01/10/2007', -- Ngay - datetime
    50          -- SoLuong - tinyint
    )
INSERT INTO dbo.ThanhPham
VALUES
(   'CN004',        -- MACN - char(5)
    'SP003',        -- MASP - char(5)
    '01/12/2007', -- Ngay - datetime
    10          -- SoLuong - tinyint
    )
INSERT INTO dbo.ThanhPham
VALUES
(   'CN005',        -- MACN - char(5)
    'SP002',        -- MASP - char(5)
    '01/12/2007', -- Ngay - datetime
    100          -- SoLuong - tinyint
    )
INSERT INTO dbo.ThanhPham
VALUES
(   'CN002',        -- MACN - char(5)
    'SP004',        -- MASP - char(5)
    '02/13/2007', -- Ngay - datetime
    10          -- SoLuong - tinyint
    )
INSERT INTO dbo.ThanhPham
VALUES
(   'CN001',        -- MACN - char(5)
    'SP003',        -- MASP - char(5)
    '02/14/2007', -- Ngay - datetime
    15          -- SoLuong - tinyint
    )
INSERT INTO dbo.ThanhPham
VALUES
(   'CN003',        -- MACN - char(5)
    'SP001',        -- MASP - char(5)
    '01/15/2007', -- Ngay - datetime
    20          -- SoLuong - tinyint
    )
INSERT INTO dbo.ThanhPham
VALUES
(   'CN003',        -- MACN - char(5)
    'SP004',        -- MASP - char(5)
    '02/14/2007', -- Ngay - datetime
    15          -- SoLuong - tinyint
    )
INSERT INTO dbo.ThanhPham
VALUES
(   'CN004',        -- MACN - char(5)
    'SP002',        -- MASP - char(5)
    '01/30/2007', -- Ngay - datetime
    100          -- SoLuong - tinyint
    )
INSERT INTO dbo.ThanhPham
VALUES
(   'CN005',        -- MACN - char(5)
    'SP003',        -- MASP - char(5)
    '02/01/2007', -- Ngay - datetime
    50          -- SoLuong - tinyint
    )
INSERT INTO dbo.ThanhPham
VALUES
(   'CN001',        -- MACN - char(5)
    'SP001',        -- MASP - char(5)
    '02/20/2007', -- Ngay - datetime
    30          -- SoLuong - tinyint
    )



SELECT TenTSX, CN.Ho,CN.Ten,CN.NgaySinh,CN.Phai
FROM dbo.ToSanXuat AS TSX, dbo.CongNhan AS CN
WHERE TSX.MATSX=cn.MATSX
