CREATE DATABASE Lab04_QLDB
GO
USE Lab04_QLDB
GO
 
 CREATE TABLE BAO_TCHI
 (MaBaoTC CHAR(4) PRIMARY KEY,
 Ten NVARCHAR(20) NOT NULL,
 DinhKy NVARCHAR(20),
 SoLuong INT,
 GiaBan int 
 )
 go
 CREATE TABLE PHATHANH
 (MaBaoTC CHAR(4) REFERENCES dbo.Bao_TChi(MaBaoTC),
 SoBaoTC INT,
 NgayPH DATETIME,
 PRIMARY KEY(MaBaoTC,SoBaoTC)
 )
 go
 CREATE TABLE KHACHHANG
 (MaKH CHAR(5) PRIMARY KEY,
 TenKH NVARCHAR(10) NOT NULL,
 DiaChi VARCHAR(10)
 )
 go
 CREATE TABLE DATBAO
 (MaKH CHAR(5) REFERENCES dbo.KHACHHANG(MaKH),
 MaBaoTC CHAR(4) REFERENCES dbo.BAO_TCHI(MaBaoTC),
 SLMua INT NOT NULL,
 NgayDM DATETIME
 )
 GO
 --------------------------------
INSERT INTO dbo.BAO_TCHI
VALUES
 (   'TT01',  -- MaBaoTC - char(4)
     N'Tuổi trẻ', -- Ten - nvarchar(20)
     N'Nhật báo', -- DinhKy - nvarchar(20)
     1000,   -- SoLuong - int
     1500    -- GiaBan - int
     )
INSERT INTO dbo.BAO_TCHI
VALUES
 (   'KT01',  -- MaBaoTC - char(4)
     N'Kiến thức ngày nay', -- Ten - nvarchar(20)
     N'Bán nguyệt san', -- DinhKy - nvarchar(20)
     3000,   -- SoLuong - int
     6000    -- GiaBan - int
     )
INSERT INTO dbo.BAO_TCHI
VALUES
 (   'TN01',  -- MaBaoTC - char(4)
     N'Thanh niên', -- Ten - nvarchar(20)
     N'Nhật báo', -- DinhKy - nvarchar(20)
     1000,   -- SoLuong - int
     2000    -- GiaBan - int
     )
INSERT INTO dbo.BAO_TCHI
VALUES
 (   'PN01',  -- MaBaoTC - char(4)
     N'Phụ nữ', -- Ten - nvarchar(20)
     N'Tuần báo', -- DinhKy - nvarchar(20)
     2000,   -- SoLuong - int
     4000    -- GiaBan - int
     )
INSERT INTO dbo.BAO_TCHI
VALUES
 (   'PN02',  -- MaBaoTC - char(4)
     N'Phụ nữ', -- Ten - nvarchar(20)
     N'Nhật báo', -- DinhKy - nvarchar(20)
     1000,   -- SoLuong - int
     2000    -- GiaBan - int
     )

INSERT INTO dbo.PHATHANH
VALUES
(   'TT01',       -- MaBaoTC - char(4)
    123,        -- SoBaoTC - tinyint
    '12/15/2005' -- NgayPH - datetime
    )
INSERT INTO dbo.PHATHANH
VALUES
(   'KT01',       -- MaBaoTC - char(4)
    70,       -- SoBaoTC - tinyint
    '12/15/2005' -- NgayPH - datetime
    )
INSERT INTO dbo.PHATHANH
VALUES
(   'TT01',       -- MaBaoTC - char(4)
    124,        -- SoBaoTC - tinyint
    '12/16/2005' -- NgayPH - datetime
    )
INSERT INTO dbo.PHATHANH
VALUES
(   'TN01',       -- MaBaoTC - char(4)
    256,        -- SoBaoTC - tinyint
    '12/17/2005' -- NgayPH - datetime
    )
INSERT INTO dbo.PHATHANH
VALUES
(   'PN01',       -- MaBaoTC - char(4)
    45,        -- SoBaoTC - tinyint
    '12/23/2005' -- NgayPH - datetime
    )
INSERT INTO dbo.PHATHANH
VALUES
(   'PN02',       -- MaBaoTC - char(4)
    111,        -- SoBaoTC - tinyint
    '12/18/2005' -- NgayPH - datetime
    )
INSERT INTO dbo.PHATHANH
VALUES
(   'PN02',       -- MaBaoTC - char(4)
    112,        -- SoBaoTC - tinyint
    '12/19/2005' -- NgayPH - datetime
    )
INSERT INTO dbo.PHATHANH
VALUES
(   'TT01',       -- MaBaoTC - char(4)
    125,        -- SoBaoTC - tinyint
    '12/17/2005' -- NgayPH - datetime
    )
INSERT INTO dbo.PHATHANH
VALUES
(   'PN01',       -- MaBaoTC - char(4)
    46,        -- SoBaoTC - tinyint
    '12/30/2005' -- NgayPH - datetime
    )

INSERT INTO dbo.KHACHHANG
VALUES
(   'KH01',  -- MaKH - char(5)
    N'LAN', -- TenKH - nvarchar(10)
    '2 NCT'   -- DiaChi - varchar(10)
    )
INSERT INTO dbo.KHACHHANG
VALUES
(   'KH02',  -- MaKH - char(5)
    N'NAM', -- TenKH - nvarchar(10)
    '32 THĐ'   -- DiaChi - varchar(10)
    )
INSERT INTO dbo.KHACHHANG
VALUES
(   'KH03',  -- MaKH - char(5)
    N'NGỌC', -- TenKH - nvarchar(10)
    '16 LHP'   -- DiaChi - varchar(10)
    )

INSERT INTO dbo.DATBAO
VALUES
(   'KH01',       -- MaKH - char(5)
    'TT01',       -- MaBaoTC - char(4)
    100,        -- SLMua - int
    '01/12/2000' -- NgayDM - datetime
    )
INSERT INTO dbo.DATBAO
VALUES
(   'KH02',       -- MaKH - char(5)
    'TN01',       -- MaBaoTC - char(4)
    150,        -- SLMua - int
    '05/01/2001' -- NgayDM - datetime
    )
INSERT INTO dbo.DATBAO
VALUES
(   'KH01',       -- MaKH - char(5)
    'PN01',       -- MaBaoTC - char(4)
    200,        -- SLMua - int
    '06/25/2001' -- NgayDM - datetime
    )
INSERT INTO dbo.DATBAO
VALUES
(   'KH03',       -- MaKH - char(5)
    'KT01',       -- MaBaoTC - char(4)
    50,        -- SLMua - int
    '03/17/2002' -- NgayDM - datetime
    )
INSERT INTO dbo.DATBAO
VALUES
(   'KH03',       -- MaKH - char(5)
    'PN02',       -- MaBaoTC - char(4)
    200,        -- SLMua - int
    '08/26/2003' -- NgayDM - datetime
    )
INSERT INTO dbo.DATBAO
VALUES
(   'KH02',       -- MaKH - char(5)
    'TT01',       -- MaBaoTC - char(4)
    250,        -- SLMua - int
    '01/15/2004' -- NgayDM - datetime
    )
INSERT INTO dbo.DATBAO
VALUES
(   'KH01',       -- MaKH - char(5)
    'KT01',       -- MaBaoTC - char(4)
    300,        -- SLMua - int
    '10/14/2004' -- NgayDM - datetime
    )
