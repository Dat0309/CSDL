CREATE DATABASE Lab05_QLTDL
GO

USE Lab05_QLTDL
GO
CREATE TABLE Tour
(MaTour CHAR(5) PRIMARY KEY,
TongSoNgay TINYINT NOT NULL CHECK(TongSoNgay >0)
)
CREATE TABLE ThanhPho
(MaTP CHAR(2) PRIMARY KEY,
TenTP NVARCHAR(20)
)
CREATE TABLE TOUR_TP
(MaTour CHAR(5) REFERENCES dbo.Tour(MaTour),
MaTP CHAR(2) REFERENCES dbo.ThanhPho(MaTP),
SoNgay TINYINT NOT NULL CHECK(SoNgay >0),
PRIMARY KEY(MaTour,MaTP)
)
CREATE TABLE Lich_TourDL
(MaTour CHAR(5) REFERENCES dbo.Tour(MaTour),
NgayKH DATETIME NOT NULL,
TenHDV NVARCHAR(10) NOT NULL,
SoNguoi INT CHECK(SoNguoi >0),
TenKH NVARCHAR(20)
)

INSERT INTO dbo.Tour
VALUES
(   'T001', -- MaTour - char(5)
    3   -- TongSoNgay - tinyint
    )
INSERT INTO dbo.Tour
VALUES
(   'T002', -- MaTour - char(5)
    4   -- TongSoNgay - tinyint
    )
INSERT INTO dbo.Tour
VALUES
(   'T003', -- MaTour - char(5)
    5   -- TongSoNgay - tinyint
    )
INSERT INTO dbo.Tour
VALUES
(   'T004', -- MaTour - char(5)
    7   -- TongSoNgay - tinyint
    )

INSERT INTO dbo.ThanhPho
VALUES
(   '01', -- MaTP - char(2)
    N'Đà Lạt' -- TenTP - nvarchar(20)
    )
INSERT INTO dbo.ThanhPho
VALUES
(   '02', -- MaTP - char(2)
    N'Nha Trang' -- TenTP - nvarchar(20)
    )
INSERT INTO dbo.ThanhPho
VALUES
(   '03', -- MaTP - char(2)
    N'Phan Thiết' -- TenTP - nvarchar(20)
    )
INSERT INTO dbo.ThanhPho
VALUES
(   '04', -- MaTP - char(2)
    N'Huế' -- TenTP - nvarchar(20)
    )
INSERT INTO dbo.ThanhPho
VALUES
(   '05', -- MaTP - char(2)
    N'Đà Nẵng' -- TenTP - nvarchar(20)
    )

INSERT INTO dbo.TOUR_TP
VALUES
(   'T001', -- MaTour - char(5)
    '01', -- MaTP - char(2)
    2   -- SoNgay - tinyint
    )
INSERT INTO dbo.TOUR_TP
VALUES
(   'T001', -- MaTour - char(5)
    '03', -- MaTP - char(2)
    1   -- SoNgay - tinyint
    )
INSERT INTO dbo.TOUR_TP
VALUES
(   'T002', -- MaTour - char(5)
    '01', -- MaTP - char(2)
    2   -- SoNgay - tinyint
    )
INSERT INTO dbo.TOUR_TP
VALUES
(   'T002', -- MaTour - char(5)
    '02', -- MaTP - char(2)
    2   -- SoNgay - tinyint
    )
INSERT INTO dbo.TOUR_TP
VALUES
(   'T003', -- MaTour - char(5)
    '02', -- MaTP - char(2)
    2   -- SoNgay - tinyint
    )
INSERT INTO dbo.TOUR_TP
VALUES
(   'T003', -- MaTour - char(5)
    '01', -- MaTP - char(2)
    1   -- SoNgay - tinyint
    )
INSERT INTO dbo.TOUR_TP
VALUES
(   'T003', -- MaTour - char(5)
    '04', -- MaTP - char(2)
    2   -- SoNgay - tinyint
    )
INSERT INTO dbo.TOUR_TP
VALUES
(   'T004', -- MaTour - char(5)
    '02', -- MaTP - char(2)
    2   -- SoNgay - tinyint
    )
INSERT INTO dbo.TOUR_TP
VALUES
(   'T004', -- MaTour - char(5)
    '05', -- MaTP - char(2)
    2   -- SoNgay - tinyint
    )
INSERT INTO dbo.TOUR_TP
VALUES
(   'T004', -- MaTour - char(5)
    '04', -- MaTP - char(2)
    3   -- SoNgay - tinyint
    )

INSERT INTO dbo.Lich_TourDL
VALUES
(   'T001',        -- MaTour - char(5)
    '02/14/2017', -- NgayKH - datetime
    N'Vân',       -- TenHDV - nvarchar(10)
    20,         -- SoNguoi - int
    N'Nguyễn Hoàng'        -- TenKH - nvarchar(20)
    )
INSERT INTO dbo.Lich_TourDL
VALUES
(   'T002',        -- MaTour - char(5)
    '02/14/2017', -- NgayKH - datetime
    N'Nam',       -- TenHDV - nvarchar(10)
    30,         -- SoNguoi - int
    N'Lê Ngọc'        -- TenKH - nvarchar(20)
    )
INSERT INTO dbo.Lich_TourDL
VALUES
(   'T002',        -- MaTour - char(5)
    '03/06/2017', -- NgayKH - datetime
    N'Hùng',       -- TenHDV - nvarchar(10)
    20,         -- SoNguoi - int
    N'Lý Dũng'        -- TenKH - nvarchar(20)
    )
INSERT INTO dbo.Lich_TourDL
VALUES
(   'T003',        -- MaTour - char(5)
    '02/18/2017', -- NgayKH - datetime
    N'Dũng',       -- TenHDV - nvarchar(10)
    20,         -- SoNguoi - int
    N'Lý Dũng'        -- TenKH - nvarchar(20)
    )
INSERT INTO dbo.Lich_TourDL
VALUES
(   'T004',        -- MaTour - char(5)
    '02/18/2017', -- NgayKH - datetime
    N'Hùng',       -- TenHDV - nvarchar(10)
    30,         -- SoNguoi - int
    N'Dũng Nam'        -- TenKH - nvarchar(20)
    )
INSERT INTO dbo.Lich_TourDL
VALUES
(   'T003',        -- MaTour - char(5)
    '03/10/2017', -- NgayKH - datetime
    N'Nam',       -- TenHDV - nvarchar(10)
    45,         -- SoNguoi - int
    N'Nguyễn An'        -- TenKH - nvarchar(20)
    )
INSERT INTO dbo.Lich_TourDL
VALUES
(   'T002',        -- MaTour - char(5)
    '04/28/2017', -- NgayKH - datetime
    N'Vân',       -- TenHDV - nvarchar(10)
    25,         -- SoNguoi - int
    N'Ngọc Dung'        -- TenKH - nvarchar(20)
    )
INSERT INTO dbo.Lich_TourDL
VALUES
(   'T004',        -- MaTour - char(5)
    '04/29/2017', -- NgayKH - datetime
    N'Dũng',       -- TenHDV - nvarchar(10)
    35,         -- SoNguoi - int
    N'Lê Ngọc'        -- TenKH - nvarchar(20)
    )
INSERT INTO dbo.Lich_TourDL
VALUES
(   'T001',        -- MaTour - char(5)
    '04/30/2017', -- NgayKH - datetime
    N'Nam',       -- TenHDV - nvarchar(10)
    25,         -- SoNguoi - int
    N'Trần Nam'        -- TenKH - nvarchar(20)
    )
INSERT INTO dbo.Lich_TourDL
VALUES
(   'T003',        -- MaTour - char(5)
    '06/15/2017', -- NgayKH - datetime
    N'Vân',       -- TenHDV - nvarchar(10)
    20,         -- SoNguoi - int
    N'Trịnh bá'        -- TenKH - nvarchar(20)
    )

	