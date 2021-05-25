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
--------------------------------------------------
--Truy xuất
--------------------------------------------------

--1.Liệt kê các công nhân theo tổ sẳn xuất gồm các thông tin: TenTSX, HoTen
SELECT tsx.TenTSX,cn.Ho+' '+cn.Ten AS HoTen 
FROM dbo.CongNhan cn,dbo.ToSanXuat tsx
WHERE cn.MATSX=tsx.MATSX

--2.Liệt kê các thành phẩm mà công nhân 'Nguyễn Trường An' đã làm được'
SELECT sp.TenSP,tp.Ngay,tp.SoLuong,sp.TienCong * tp.SoLuong AS ThanhTien 
FROM dbo.ThanhPham tp,dbo.SanPham sp
WHERE tp.MACN='CN001' AND sp.MASP=tp.MASP
ORDER BY tp.Ngay

--3.Liệt kê các nhân viên không sản xuất sản phẩm 'Bình gốm lớn'
SELECT Ho+' '+Ten AS NhanVienKSX
FROM dbo.CongNhan
WHERE MACN NOT IN(
					SELECT cn.MACN
					FROM dbo.CongNhan cn,dbo.SanPham sp,dbo.ThanhPham tp
					WHERE cn.MACN=tp.MACN AND sp.MASP=tp.MASP AND sp.TenSP = N'Bình gốm lớn')

--4.Liệt kê thông tin các công nhân có sản xuất cả nồi đất và bình gốm nhỏ
SELECT cn.Ho+' '+cn.Ten AS HoTen
FROM dbo.CongNhan cn,dbo.SanPham sp, dbo.ThanhPham tp
WHERE cn.MACN=tp.MACN AND tp.MASP=sp.MASP and sp.TenSP =N'Nồi đất' AND tp.MACN IN (	SELECT tp.MACN
																					FROM dbo.CongNhan cn,dbo.SanPham sp, dbo.ThanhPham tp
																					WHERE cn.MACN=tp.MACN AND tp.MASP=sp.MASP ANd sp.TenSP = N'Bình gốm nhỏ')
--5.Thống kê sô lượng công nhân theo từng tổ sản xuất
SELECT TenTSX,COUNT(MACN) 
FROM dbo.ToSanXuat,dbo.CongNhan
WHERE CongNhan.MATSX=ToSanXuat.MATSX
GROUP BY TenTSX

--6.Tổng số lượng thành phẩm theo từng loại mà mỗi nhân viên làm được
SELECT Ten,TenSP,SoLuong,TienCong*SoLuong AS TongThanhTien
FROM dbo.CongNhan,dbo.SanPham,dbo.ThanhPham
WHERE ThanhPham.MASP=SanPham.MASP AND CongNhan.MACN=ThanhPham.MACN
GROUP BY TenSP,Ten,SoLuong,TienCong*SoLuong

--7.Tổng số tiền công đã trả cho công nhân trong tháng 1 năm 2007
SELECT SUM(TongL.TienCong) AS N'Tổng số tiền lương'
FROM (	SELECT sp.TienCong*tp.SoLuong as TienCong
		FROM dbo.SanPham sp,dbo.ThanhPham tp
		WHERE sp.MASP=tp.MASP AND YEAR(tp.Ngay)=2007 AND MONTH(tp.Ngay)=01) AS TongL

--8.Cho biết sản phẩm được sản xuất nhiều nhất trong tháng 2/2007
SELECT TenSP
FROM dbo.SanPham,dbo.ThanhPham
WHERE SanPham.MASP=ThanhPham.MASP AND MONTH(Ngay) ='02' AND YEAR(Ngay)='2007' AND SoLuong IN(	SELECT MAX(SoLuong)
																								FROM dbo.SanPham,dbo.ThanhPham
																								WHERE SanPham.MASP=ThanhPham.MASP AND MONTH(Ngay) ='02' AND YEAR(Ngay)='2007')

--9.Cho biết công nhân sản xuất được nhiều chén nhất
SELECT cn.MACN,cn.Ho+' '+cn.Ten AS HoTen
FROM dbo.CongNhan cn,dbo.ThanhPham tp
WHERE cn.MACN=tp.MACN AND tp.MASP='SP002' AND tp.SoLuong IN (	SELECT MAX(SoLuong) AS maxSl	
																FROM dbo.CongNhan,dbo.ThanhPham
																WHERE CongNhan.MACN=ThanhPham.MACN AND MASP='SP002')



--10.Tiền công tháng 2/2006 của công nhân viên có mã số 'CN002'
SELECT L.HoTen,SUM(l.TongTienCong) AS TienCongThang2
FROM 
(SELECT Ho+' '+Ten AS HoTen, TienCong*SoLuong AS TongTienCong
FROM dbo.ThanhPham,dbo.SanPham,dbo.CongNhan
WHERE ThanhPham.MASP=SanPham.MASP AND ThanhPham.MACN=CongNhan.MACN AND CongNhan.MACN='CN002' AND MONTH(Ngay) ='02' AND YEAR(Ngay)='2007') AS L
GROUP BY l.HoTen

--11.Liệt kê các công nhân có sản xuất từ 3 loại sản phẩm trở lên
SELECT Ho+' '+Ten AS HoTen,COUNT(MASP) AS SoLuongSP
FROM dbo.CongNhan,dbo.ThanhPham
WHERE CongNhan.MACN=ThanhPham.MACN
GROUP BY Ho+' '+Ten
HAVING COUNT(MASP) >=3

--12.Cập nhật giá tiền công của các loại bình gốm thêm 1000
UPDATE dbo.SanPham SET TienCong = TienCong+1000
WHERE MASP IN('SP003','SP004')
SELECT * FROM dbo.SanPham

--13.Thêm bộ <'CN006'> vào bảng CongNhan
INSERT INTO dbo.CongNhan
VALUES
(   'CN006',        -- MACN - char(5)
    N'Lê Thị',       -- Ho - nvarchar(20)
    N'Lan',       -- Ten - nvarchar(10)
    N'Nữ',       -- Phai - nvarchar(5)
    GETDATE(), -- NgaySinh - datetime
    'TS02'         -- MATSX - char(5)
    )

	SELECT * FROM dbo.CongNhan

--------------------------------------
--Hàm & thủ tục
--------------------------------------
--Hàm
--a.Tính tổng số công nhân của một tổ sản xuất cho trước
CREATE FUNCTION sumNV(@maTSX CHAR(5))
RETURNS INT
AS
BEGIN
    DECLARE @soCN INT
	SELECT @soCN =COUNT(MACN)
	FROM dbo.CongNhan
	WHERE @maTSX = MATSX
	RETURN @soCN
END
-----------------------
PRINT(N'Số công nhân của chi nhánh là: ')
PRINT dbo.sumNV('TS01')
-----------------------
--b.Tính tổng sản lượng sản xuất trong một tháng của một loại sản phẩm cho trước

CREATE FUNCTION sumSLng(@maSP CHAR(5))
RETURNs int
AS
BEGIN
    DECLARE @soSL INT 
	SELECT @soSL=SUM(SoLuong)
	FROM dbo.ThanhPham
	WHERE @maSP=MASP
	RETURN @soSL
END

PRINT(N'Sản lượng sản xuất trong một tháng của sản phẩm là:')
PRINT dbo.sumSLng('SP001')

--c.Tính tổng tiền công tháng của một công nhân cho trước
CREATE FUNCTION TongCongThang(@maCN CHAR(5))
RETURNS int
AS
BEGIN
    DECLARE @tongCong INT
	SELECT @tongCong = SUM(sp.TienCong*tp.SoLuong)
	FROM dbo.SanPham sp, dbo.ThanhPham tp
	WHERE @maCN=tp.MACN AND sp.MASP=tp.MASP
	RETURN @tongCong
END

select dbo.TongCongThang('CN001')

--d.Tính tổng thu nhập trong năm của một tổ sản xuất cho trước
--Tìm số nhân viên thuộc tổ sản xuất cho trước

CREATE FUNCTION tong_Luong(@maTSX CHAR(5))
RETURNS INT
AS
BEGIN
    DECLARE @tongL INT
	SELECT @tongL= SUM(dbo.TongCongThang(tp.MACN))
	FROM dbo.SanPham sp,dbo.ThanhPham tp,dbo.CongNhan cn
	WHERE tp.MASP=sp.MASP AND tp.MACN=cn.MACN AND @maTSX=cn.MATSX
		RETURN @tongL
END

print dbo.tong_Luong('TS01')

--e.Tính tổng sản lượng sản xuất của một loại sản phẩm trong một khoảng thời gian cho trước
CREATE FUNCTION TongSL_Time_Cho_Truoc(@time datetime,@loaiSP CHAR(5))
RETURNS int
AS
BEGIN
    DECLARE @tong INT
	SELECT @tong=SUM(tp.SoLuong)
	FROM dbo.SanPham sp,dbo.ThanhPham tp
	WHERE sp.MASP=@loaiSP AND tp.Ngay=@time AND sp.MASP=tp.MASP
	RETURN @tong
END

SELECT dbo.TongSL_Time_Cho_Truoc('02/01/2007','SP001')

--B.viết các thủ tục sau
--a.In danh sách các công nhân của một tổ sản xuất cho trước
CREATE PROC usp_InDS @maTSX CHAR(5)
AS
IF EXISTS(	SELECT * 
			FROM dbo.CongNhan
			WHERE MATSX=@maTSX)
			BEGIN
				SELECT * 
				FROM dbo.CongNhan
				WHERE MATSX=@maTSX
			END
GO

EXEC usp_InDS 'TS01'

--b.In bảng chấm công sản xuất trong tháng của một công nhân cho trước(bao gồm tên sản phẩm, đơn vị tính, số lượng sản xuất trong tháng, đơn giá, thành tiền)
CREATE PROC usp_BangChamCong @maCN CHAR(5)
AS
IF EXISTS(	SELECT * 
			FROM dbo.ThanhPham
			WHERE MACN=@maCN)
			BEGIN
			    SELECT sp.TenSP,sp.DVT,tp.SoLuong AS SLSXThang,sp.TienCong,sp.TienCong * tp.SoLuong AS ThanhTien
				FROM dbo.SanPham sp, dbo.ThanhPham tp
				WHERE tp.MASP=sp.MASP AND tp.MACN= @maCN
			END
GO

EXEC usp_BangChamCong 'CN001'
-----------------
--DROP PROC usp_BangChamCong
