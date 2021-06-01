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

	
-----------------------------
--Hàm và thủ tục
-----------------------------
--1.Liệt kê các mặt hàng thuộc loại đĩa cứng
SELECT *
FROM dbo.HangHoa 
WHERE MaHH LIKE 'CPU%' or MaHH like 'HDD%'

--2.liệt kê các mặt hàng có số lượng tồn trên 10
SELECT MaHH,TenHH,SoLuongTon 
FROM dbo.HangHoa
WHERE SoLuongTon >10

--3.Cho biết thông tin về các nhà cung cấp ở TPHCM
SELECT * 
FROM dbo.DoiTac
WHERE MaDT LIKE 'CC%' AND DiaChi LIKE '%TP.HCM'

--4.Liệt kê các hóa đơn nhập hàng trong tháng 5/2006
SELECT SoHD,NgayLapHD,TenDT,DiaChi,DienThoai,COUNT(MAHH) AS SoMatHang
FROM dbo.HoaDon,dbo.DoiTac,dbo.KhaNangCC
WHERE MONTH(NgayLapHD)='5' AND YEAR(NgayLapHD)='2006' AND SoHD LIKE('N%') AND DoiTac.MaDT=HoaDon.MaDT AND HoaDon.MaDT=KhaNangCC.MaDT
GROUP BY SoHD,NgayLapHD,TenDT,DiaChi,DienThoai

--5.Cho biết tên các nhà cung cấp có cung cấp đĩa cứng
SELECT DISTINCT DoiTac.MaDT,TenDT
FROM dbo.DoiTac,dbo.KhaNangCC
WHERE KhaNangCC.MaDT=DoiTac.MaDT AND MAHH LIKE 'CPU%' or MAHH LIKE 'HDD%' AND DoiTac.MaDT LIKE 'CC%'

--6.Cho biết tên các nhà cung cấp có thể cung cấp tất cả các loại đĩa cứng
--Hướng giải: Tìm tên các đối tác cung cấp/ mà không có hàng hóa thuộc loại đĩa cứng nào/ mà các đối tác đó không làm
SELECT DT.TenDT 
FROM dbo.DoiTac DT
WHERE  DT.MaDT IN(
	SELECT DISTINCT KN.MaDT
	FROM  dbo.KhaNangCC KN  
	WHERE KN.MaDT LIKE 'CC%' 
	AND NOT EXISTS (	SELECT *
						FROM dbo.HangHoa HH
						WHERE HH.MaHH LIKE 'CPU%' --OR HH.MaHH LIKE 'HDD%'
						AND NOT EXISTS (	SELECT *
											FROM dbo.KhaNangCC KN2
											WHERE KN2.MAHH=HH.MAHH AND KN2.MaDT=KN.MaDT)))

--7.Cho biết tên các nhà cung cấp không cung cấp đĩa cứng
SELECT DT.TenDT 
FROM dbo.DoiTac DT
WHERE  DT.MaDT in(
	SELECT DISTINCT KN.MaDT
	FROM  dbo.KhaNangCC KN  
	WHERE KN.MaDT LIKE 'CC%' 
	AND not EXISTS (	SELECT *
						FROM dbo.HangHoa HH
						WHERE HH.MaHH LIKE 'CPU%' --OR HH.MaHH LIKE 'HDD%'
						AND  EXISTS (	SELECT *
										FROM dbo.KhaNangCC KN2
										WHERE KN2.MAHH=HH.MAHH AND KN2.MaDT=KN.MaDT)))

--8.Cho biết thông tin của mặt hàng chưa bán được
SELECT HH1.MaHH,HH1.TenHH
FROM dbo.HangHoa HH1
WHERE HH1.MaHH NOT in
					(	SELECT HH.MaHH
						FROM dbo.CT_HoaDon CT,dbo.HangHoa HH
						WHERE CT.MaHH =HH.MaHH AND CT.SoHD LIKE 'X%')

--9.Cho biết tên và tổng số lượng bán của mặt hàng bán chạy nhất
--11.Cho biết hóa đơn nhập nhiều mặt hàng nhất
SELECT HD.SoHD 
FROM dbo.HoaDon HD,dbo.CT_HoaDon CT1
WHERE CT1.SoHD=HD.SoHD AND HD.SoHD LIKE 'N%'
GROUP BY HD.SoHD
HAVING COUNT(CT1.MaHH) IN 
(		SELECT MAX(SHD.SoMH) AS MaxHD
		FROM (					SELECT COUNT(CT.MaHH) AS SoMH
								FROM  dbo.CT_HoaDon CT
								WHERE  CT.SoHD LIKE 'N%'
								GROUP BY CT.SoHD) AS SHD)

--12.Cho biết các mặt hàng không được nhập hàng trong tháng 1/2006
SELECT HH1.TenHH 
FROM dbo.HangHoa AS HH1
WHERE HH1.MaHH NOT in
(		SELECT CT.MaHH 
		FROM dbo.HoaDon HD, dbo.CT_HoaDon CT
		WHERE HD.SoHD = CT.SoHD AND MONTH(HD.NgayLapHD)=01 AND YEAR(HD.NgayLapHD)=2006 AND CT.SoHD LIKE 'N%')

--13.Cho biết tên các mặt hàng không bán được trong tháng 6/2006
SELECT TenHH
FROM dbo.HangHoa
WHERE MaHH NOT IN
(		SELECT CT.MaHH
		FROM dbo.HoaDon HD,dbo.CT_HoaDon CT
		WHERE CT.SoHD=HD.SoHD AND MONTH(HD.NgayLapHD) =06 AND YEAR(HD.NgayLapHD)=2006 AND CT.SoHD LIKE 'X%')

--14.Cho biết cửa hàng bán bao nhiêu mặt hàng
SELECT COUNT(MaHH) AS SoLuongMH
FROM dbo.HangHoa

--15.Cho biết số mặt hàng mà từng nhà cung cấp có khả năng cung cấp
SELECT MaDT,COUNT(MAHH) AS SoMHCC
FROM dbo.KhaNangCC
GROUP BY MaDT

--16.Cho biết thông tin của khách hàng có giao dịch với cửa hàng nhiều nhất
SELECT HoaDon.MaDT,TenDT,DiaChi,DienThoai
FROM dbo.DoiTac,dbo.CT_HoaDon,dbo.HoaDon
WHERE CT_HoaDon.SoHD=HoaDon.SoHD AND DoiTac.MaDT=HoaDon.MaDT and DoiTac.MaDT LIKE 'K%'
GROUP BY HoaDon.MaDT,TenDT,DiaChi,DienThoai
HAVING COUNT(HoaDon.MaDT) in
					(	SELECT MAX(SL.SLMua)
						FROM dbo.DoiTac,
										(	SELECT COUNT(HD.MaDT) AS SLMua
											FROM dbo.HoaDon HD,dbo.CT_HoaDon CT
											WHERE CT.SoHD=HD.SoHD AND HD.SoHD LIKE 'X%'
											GROUP BY HD.MaDT) AS SL)
--17.Tính tổng doanh thu năm 2006
SELECT SUM(CT.DonGia*CT.SoLuong) AS TongDoanhThu
FROM dbo.HoaDon HD, dbo.CT_HoaDon CT
WHERE CT.SoHD LIKE 'X%' AND CT.SoHD=HD.SoHD AND YEAR(HD.NgayLapHD)=2006

--18.Cho biết loại mặt hàng bán chạy nhất
SELECT HH.TenHH
FROM dbo.HangHoa HH,dbo.CT_HoaDon CT
WHERE HH.MaHH=CT.MaHH
GROUP BY CT.MaHH,HH.TenHH
HAVING COUNT(CT.MaHH) in
(	SELECT MAX(sl.SLMua)
	FROM (	SELECT COUNT(MaHH) SLMua
			FROM dbo.CT_HoaDon
			GROUP BY MaHH) AS SL )

--19.Liệt kê thông tin bán hàng của tháng 5/2006
SELECT HH.MaHH,HH.TenHH,HH.DVT,SUM(CT.SoLuong) AS TongSL,CT.DonGia*CT.SoLuong AS TongTT
FROM dbo.HangHoa HH,dbo.CT_HoaDon CT,dbo.HoaDon HD
WHERE CT.MaHH=HH.MaHH AND HD.SoHD=CT.SoHD AND CT.SoHD LIKE 'X%' AND MONTH(HD.NgayLapHD)=05 AND YEAR(HD.NgayLapHD)=2006
GROUP BY HH.MaHH,HH.TenHH,HH.DVT,CT.DonGia,CT.SoLuong

--20.Liệt kê thông tin của mặt hàng có nhiều người mua nhất
SELECT CT.MaHH 
FROM dbo.CT_HoaDon CT,dbo.HangHoa HH
WHERE CT.MaHH=HH.MaHH AND CT.SoHD LIKE 'X%'
GROUP BY CT.MaHH
HAVING COUNT(CT.SoHD)>=ALL
			(	SELECT COUNT(MaHH)
				FROM dbo.CT_HoaDon CT1
				WHERE CT1.SoHD LIKE 'X%' 
				GROUP BY CT1.MaHH)

--21.Tính và cập nhật tổng trị giá của cá hóa đơn
UPDATE dbo.HoaDon SET TongTG = (		SELECT SUM(DonGia*SoLuong) 
										FROM dbo.CT_HoaDon 
										WHERE CT_HoaDon.SoHD=HoaDon.SoHD ) 
								
SELECT * FROM dbo.HoaDon

------------------------------------
--hàm & thủ tục
------------------------------------
--a.Tính tổng số lượng nhập trong một khoảng thời gian của một mặt hàng cho trước
 CREATE FUNCTION tongNhap(@maHH CHAR(5))
 RETURNS INT
 AS
 BEGIN
     DECLARE @soLuong INT
	 SELECT @soLuong= SUM(CT.SoLuong)
	 FROM dbo.CT_HoaDon CT
	 WHERE @maHH=CT.MaHH AND CT.SoHD LIKE 'N%'
	 RETURN @soLuong
 END
 --DROP FUNCTION dbo.tongNhap
 ----------------
 PRINT(N'Số lượng Nhập trong một khoảng thồi gian của một mặt hàng cho trước là:')
 PRINT dbo.tongNhap('CPU01')
 --b.Tính tổng số lượng xuất trong một khoảng thơi gian của một mặt hàng cho trước
 CREATE FUNCTION tongXuat(@maHH CHAR(5))
 RETURNS int
 AS
 BEGIN
     DECLARE @soLuong INT
	 SELECT @soLuong=SUM(ct.SoLuong)
	 FROM dbo.CT_HoaDon ct
	 WHERE @maHH=ct.MaHH AND ct.SoHD LIKE 'X%'
	 RETURN @soLuong
 END
 -------------------
 PRINT(N'Số lượng hàng hóa xuất là:')
 PRINT dbo.tongXuat('CPU01')

 --c.Tính tổng doanh thu trong một tháng cho trước
 CREATE FUNCTION tongDoanhThu(@thang int)
 RETURNS int
 AS
 BEGIN
     DECLARE @doanhThu INT
	 SELECT @doanhThu=SUM(ct.DonGia*ct.SoLuong) 
	 FROM dbo.HoaDon,dbo.CT_HoaDon ct
	 WHERE @thang = MONTH(NgayLapHD) AND ct.SoHD LIKE 'X%' AND HoaDon.SoHD=ct.SoHD
	 RETURN @doanhThu
 END
 -------------
 PRINT dbo.tongDoanhThu(06)
 ----------------------------------

 --d.Tính tổng doanh tu của một mặt hàng trong một khoảng thời gian cho trước
 CREATE FUNCTION tongDTHH(@maHH CHAR(5),@thang datetime)
 RETURNS int
 AS
 BEGIN
     DECLARE @doanhThu INT
	 SELECT @doanhThu=SUM(ct.DonGia*ct.SoLuong) 
	 FROM dbo.HoaDon,dbo.CT_HoaDon ct
	 WHERE @thang = NgayLapHD AND ct.SoHD LIKE 'X%' AND HoaDon.SoHD=ct.SoHD AND @maHH=ct.MaHH
	 RETURN @doanhThu
 END

 DROP FUNCTION tongDTHH
 ---------------------------
 PRINT dbo.tongDTHH('CPU01','05/12/2006')

 --e.Tính tổng số tiền nhập hàng trong một khoảng thời gian cho trước
 CREATE FUNCTION tongNhapHang(@time datetime)
 RETURNS int
 AS
 BEGIN
     DECLARE @tongTien INT
	 SELECT @tongTien=SUM(ct.DonGia*ct.SoLuong)
	 FROM dbo.HoaDon hd, dbo.CT_HoaDon ct
	 WHERE @time = hd.NgayLapHD AND ct.SoHD LIKE 'N%' AND ct.SoHD=hd.SoHD
	 RETURN @tongTien
 END
-------------------------
--DROP FUNCTION tongNhapHang
PRINT dbo.tongNhapHang('05/01/2006')

--f.Tính tổng số tiền của một hóa đơn cho trước
CREATE FUNCTION tongTienHD(@soHD CHAR(5))
RETURNS int
AS
BEGIN
    DECLARE @tongTien INT
	SELECT @tongTien=SUM(DonGia*SoLuong) 
	FROM dbo.CT_HoaDon
	WHERE @soHD=SoHD
	RETURN @tongTien
END

PRINT dbo.tongTienHD('N0001')
---------------------------------------
--Thủ tục
--a.Cập nhật số lượng tồn của một mặt hàng khi nhập hàng hoặc xuất hàng
CREATE PROC usp_CapNhatTon @maHH CHAR(5)
AS
	IF EXISTS(SELECT * FROM dbo.HangHoa WHERE MaHH= @maHH)
	BEGIN
			    UPDATE dbo.HangHoa SET SoLuongTon =(	SELECT ct.SoLuong+SoLuongTon 
														FROM dbo.CT_HoaDon ct
														WHERE ct.SoHD LIKE 'N%' AND MaHH=ct.MaHH AND @maHH=ct.MaHH
														) WHERE HangHoa.MaHH=@maHH
	END
	ELSE
		PRINT(N'Không tồn tại hàng hóa!')
	GO
	-----

    --DROP PROC usp_CapNhatTon
	-----------------------------------
	EXEC usp_CapNhatTon 'CPU01'
	SELECT * FROM dbo.HangHoa

--b.Cập nhật tổng trị giá của một hóa đơn
CREATE PROC usp_TongTriGia @soHD CHAR(5)
AS
	IF EXISTS(	SELECT *
				FROM dbo.HoaDon
				WHERE SoHD=@soHD)
				BEGIN
					UPDATE dbo.HoaDon SET TongTG = (	SELECT SUM(ct.DonGia*ct.SoLuong)
														FROM dbo.CT_HoaDon ct
														WHERE ct.SoHD=SoHD AND @soHD=ct.SoHD)
														WHERE HoaDon.SoHD=@soHD
				END
	ELSE 
		PRINT(N'Không tồn tại hóa đơn')
	GO
	DROP proc usp_TongTriGia
    ------------------------
EXEC usp_TongTriGia 'N0001'
SELECT * FROM dbo.HoaDon

UPDATE dbo.HoaDon SET TongTG = NULL

--c.In đầy đủ thông tin của một hóa đơn
CREATE PROC usp_InHD @soHD CHAR(5)
AS
	IF EXISTS(	SELECT *
				FROM dbo.HoaDon 
				WHERE SoHD=@soHD)
				BEGIN
				    SELECT ct.SoHD,hd.NgayLapHD,hd.MaDT,SUM(ct.SoLuong*ct.DonGia) AS TONGTG, COUNT(ct.SoHD) AS SLHD
					FROM dbo.HoaDon hd,dbo.CT_HoaDon ct
					WHERE hd.SoHD=@soHD AND hd.SoHD=ct.SoHD
					GROUP BY ct.SoHD,hd.NgayLapHD,hd.MaDT
				END
	ELSE
		PRINT(N'Hóa đơn không tồn tại')
GO
---------------
EXEC usp_InHD 'N0002'