CREATE DATABASE Lab03_QLNXHH
GO
USE Lab03_QLNXHH
GO
CREATE TABLE HangHoa
(MaHH CHAR(5) PRIMARY KEY,
TenHH VARCHAR(25) NOT NULL UNIQUE,
DVT NVARCHAR(10) NOT NULL,
SoLuongTon TINYINT
)
go
CREATE TABLE DoiTac
(MaDT CHAR(5) PRIMARY KEY,
TenDT NVARCHAR(30) NOT NULL UNIQUE,
DiaChi NVARCHAR(40),
DienThoai CHAR(10)
)
go
CREATE TABLE KhaNangCC
(MaDT CHAR(5) REFERENCES dbo.DoiTac(MaDT),
MAHH CHAR(5) REFERENCES dbo.HangHoa(MaHH),
PRIMARY KEY(MaDT,MAHH)
)
go
CREATE TABLE HoaDon
(SoHD CHAR(5) PRIMARY KEY,
NgayLapHD DATETIME NOT NULL,
MaDT CHAR(5) REFERENCES dbo.DoiTac(MaDT),
TongTG INT
)
go
CREATE TABLE CT_HoaDon
(SoHD CHAR(5) REFERENCES dbo.HoaDon(SoHD),
MaHH CHAR(5) REFERENCES dbo.HangHoa(MaHH),
PRIMARY KEY(SoHD,MaHH)
)
ALTER TABLE dbo.CT_HoaDon
ADD DonGia INT NOT NULL,
	SoLuong TINYINT NOT NULL

--Nhap Hàng hóa
INSERT INTO dbo.HangHoa
VALUES
(   'CPU01',  -- MaHH - char(5)
    'CPU INTEL,CELERON 600 BOX',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    5    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'CPU02',  -- MaHH - char(5)
    'CPU INTEL,PIII 700',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    10    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'CPU03',  -- MaHH - char(5)
    'CPU AMD K7 ATHL,ON 600',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    8    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'HDD01',  -- MaHH - char(5)
    'HDD 10.2 GB QUANTUM',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    10    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'HDD02',  -- MaHH - char(5)
    'HDD',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    15    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'HDD03',  -- MaHH - char(5)
    'HDD 20 GB QUANTUM',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    6    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'KB01',  -- MaHH - char(5)
    'KB GENIUS',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    12    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'KB02',  -- MaHH - char(5)
    'KB MITSUMIMI',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    5    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'MB01',  -- MaHH - char(5)
    'GIGABYTE CHIPSET INTEL',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    10    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'MB02',  -- MaHH - char(5)
    'ACOPR BX CHIPSET VIA',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    10    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'MB03',  -- MaHH - char(5)
    'INTEL PHI CHIPSET INTEL',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    10    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'MB04',  -- MaHH - char(5)
    'ECS CHIPSET SIS',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    10    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'MB05',  -- MaHH - char(5)
    'ECS CHIPSET VIA',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    10    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'MNT01',  -- MaHH - char(5)
    'SAMSUNG 14"SYNCMASTER',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    5    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'MNT02',  -- MaHH - char(5)
    'LG14"',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    5    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'MNT03',  -- MaHH - char(5)
    'ACER 14"',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    8    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'MNT04',  -- MaHH - char(5)
    'PHILIPS 14"',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    6    -- SoLuongTon - tinyint
    )
INSERT INTO dbo.HangHoa
VALUES
(   'MNT05',  -- MaHH - char(5)
    'VIEWSONIC 14"',  -- TenHH - varchar(25)
    N'CÁI', -- DVT - nvarchar(10)
    7    -- SoLuongTon - tinyint
    )

--Nhập đối tác
INSERT INTO dbo.DoiTac
VALUES
(   'CC001',  -- MaDT - char(5)
    N'Cty TNC', -- TenDT - nvarchar(30)
    N'176 BTX Q1 - TP.HCM', -- DiaChi - nvarchar(40)
    '08.8250259'   -- DienThoai - char(10)
    )
INSERT INTO dbo.DoiTac
VALUES
(   'CC002',  -- MaDT - char(5)
    N'Cty Hoàng Long', -- TenDT - nvarchar(30)
    N'15A TTT Q1 - TP.HCM', -- DiaChi - nvarchar(40)
    '08.0250898'   -- DienThoai - char(10)
    )
INSERT INTO dbo.DoiTac
VALUES
(   'CC003',  -- MaDT - char(5)
    N'Cty Hợp Nhất', -- TenDT - nvarchar(30)
    N'152 BTX Q1 - TP.HCM', -- DiaChi - nvarchar(40)
    '08.8252376'   -- DienThoai - char(10)
    )
INSERT INTO dbo.DoiTac
VALUES
(   'K0001',  -- MaDT - char(5)
    N'Nguyễn Minh Hải', -- TenDT - nvarchar(30)
    N'91 Nguyễn Văn Trỗi - TP.Đà Lạt', -- DiaChi - nvarchar(40)
    '063.831129'   -- DienThoai - char(10)
    )
INSERT INTO dbo.DoiTac
VALUES
(   'K0002',  -- MaDT - char(5)
    N'Như Quỳnh', -- TenDT - nvarchar(30)
    N'21 Điện Biên Phủ N.Trang', -- DiaChi - nvarchar(40)
    '058590270'   -- DienThoai - char(10)
    )
INSERT INTO dbo.DoiTac
VALUES
(   'K0003',  -- MaDT - char(5)
    N'Trần Nhật Dật', -- TenDT - nvarchar(30)
    N'Lê Lợi - TP.Huế', -- DiaChi - nvarchar(40)
    '054.848376'   -- DienThoai - char(10)
    )
INSERT INTO dbo.DoiTac
VALUES
(   'K0004',  -- MaDT - char(5)
    N'Phan Nguyễn Hùng Anh', -- TenDT - nvarchar(30)
    N'11 Nam Kỳ Khởi Nghĩa - TP.Đà Lạt', -- DiaChi - nvarchar(40)
    '063.823409'   -- DienThoai - char(10)
    )

--Nhập Hóa đơn
INSERT INTO dbo.HoaDon
VALUES
(   'N0001',        -- SoHD - char(5)
    '01/25/2006', -- NgayLapHD - datetime
    'CC001',        -- MaDT - char(5)
     NULL         -- TongTG - int
    )
INSERT INTO dbo.HoaDon
VALUES
(   'N0002',        -- SoHD - char(5)
    '05/01/2006', -- NgayLapHD - datetime
    'CC002',        -- MaDT - char(5)
    NULL          -- TongTG - int
    )
INSERT INTO dbo.HoaDon
VALUES
(   'X0001',        -- SoHD - char(5)
    '05/12/2006', -- NgayLapHD - datetime
    'K0001',        -- MaDT - char(5)
    NULL          -- TongTG - int
    )
INSERT INTO dbo.HoaDon
VALUES
(   'X0002',        -- SoHD - char(5)
    '06/16/2006', -- NgayLapHD - datetime
    'K0002',        -- MaDT - char(5)
    NULL          -- TongTG - int
    )
INSERT INTO dbo.HoaDon
VALUES
(   'X0003',        -- SoHD - char(5)
    '04/20/2006', -- NgayLapHD - datetime
    'K0001',        -- MaDT - char(5)
    NULL          -- TongTG - int
    )

--Nhập khả năng cung cấp
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC001', -- MaDT - char(5)
    'CPU01'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC001', -- MaDT - char(5)
    'HDD03'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC001', -- MaDT - char(5)
    'KB01'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC001', -- MaDT - char(5)
    'MB02'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC001', -- MaDT - char(5)
    'MB04'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC001', -- MaDT - char(5)
    'MNT01'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC002', -- MaDT - char(5)
    'CPU01'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC002', -- MaDT - char(5)
    'CPU02'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC002', -- MaDT - char(5)
    'CPU03'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC002', -- MaDT - char(5)
    'KB02'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC002', -- MaDT - char(5)
    'MB01'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC002', -- MaDT - char(5)
    'MB05'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC002', -- MaDT - char(5)
    'MNT03'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC003', -- MaDT - char(5)
    'HDD01'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC003', -- MaDT - char(5)
    'HDD02'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC003', -- MaDT - char(5)
    'HDD03'  -- MAHH - char(5)
    )
INSERT INTO dbo.KhaNangCC
VALUES
(   'CC003', -- MaDT - char(5)
    'MB03'  -- MAHH - char(5)
    )

--Nhập CT Hóa đơn
INSERT INTO dbo.CT_HoaDon
VALUES
(   'N0001', -- SoHD - char(5)
    'CPU01',  -- MaHH - char(5)
	 63,
	 10
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'N0001', -- SoHD - char(5)
    'HDD03',  -- MaHH - char(5)
	 97,
	 7
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'N0001', -- SoHD - char(5)
    'KB01',  -- MaHH - char(5)
	 3,
	 5
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'N0001', -- SoHD - char(5)
    'MB02',  -- MaHH - char(5)
	 57,
	 5
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'N0001', -- SoHD - char(5)
    'MNT01',  -- MaHH - char(5)
	 112,
	 3
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'N0002', -- SoHD - char(5)
    'CPU02',  -- MaHH - char(5)
	 115,
	 3
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'N0002', -- SoHD - char(5)
    'KB02',  -- MaHH - char(5)
	 5,
	 7
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'N0002', -- SoHD - char(5)
    'MNT03',  -- MaHH - char(5)
	 111,
	 5
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'X0001', -- SoHD - char(5)
    'CPU01',  -- MaHH - char(5)
	 67,
	 2
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'X0001', -- SoHD - char(5)
    'KB01',  -- MaHH - char(5)
	 5,
	 2
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'X0001', -- SoHD - char(5)
    'MB02',  -- MaHH - char(5)
	 62,
	 1
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'X0002', -- SoHD - char(5)
    'CPU01',  -- MaHH - char(5)
	 67,
	 1
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'X0002', -- SoHD - char(5)
    'KB02',  -- MaHH - char(5)
	 7,
	 3
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'X0002', -- SoHD - char(5)
    'MNT01',  -- MaHH - char(5)
	 115,
	 2
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'X0003', -- SoHD - char(5)
    'CPU01',  -- MaHH - char(5)
	 67,
	 1
    )
INSERT INTO dbo.CT_HoaDon
VALUES
(   'X0003', -- SoHD - char(5)
    'MNT03',  -- MaHH - char(5)
	 115,
	 2
    )
	DELETE FROM dbo.CT_HoaDon
	DELETE FROM dbo.HangHoa
	DELETE FROM dbo.KhaNangCC
