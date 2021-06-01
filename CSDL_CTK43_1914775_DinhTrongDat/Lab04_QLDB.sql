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

-----------------------------------------
--Truy vấn
-----------------------------------------
--1.Cho biết các tờ báo, tạp chí có định kỳ phát hành hàng tuần
SELECT MaBaoTC,Ten,GiaBan
FROM dbo.BAO_TCHI
WHERE DinhKy = N'Tuần báo'

--2.Cho biết thông tin về các tờ báo thuộc loại báo phụ nữ
SELECT * 
FROM dbo.BAO_TCHI
WHERE MaBaoTC LIKE 'PN%'

--3.Cho biết tên các khách hàng có đặt mua báo phụ
SELECT KH.TenKH
FROM dbo.BAO_TCHI BC, dbo.DATBAO DB,dbo.KHACHHANG KH
WHERE BC.MaBaoTC LIKE 'PN%' AND DB.MaKH=KH.MaKH AND BC.MaBaoTC=DB.MaBaoTC

--4.Cho biết tên các khách hàng có đặt mua tất cả các báo phụ nữ
SELECT DISTINCT DB.MaKH
FROM dbo.DATBAO	DB
WHERE NOT EXISTS (		SELECT *
						FROM dbo.BAO_TCHI BC
						WHERE BC.MaBaoTC LIKE 'PN%' AND 
						NOT EXISTS (		SELECT *
											FROM dbo.DATBAO DB2
											WHERE BC.MaBaoTC=DB2.MaBaoTC AND DB2.MaKH=DB.MaKH))

--5.Cho biết tên khách hàng không đặt mua báo thanh niên
SELECT KH.TenKH
FROM dbo.KHACHHANG KH
WHERE KH.MaKH NOT IN (		SELECT dbo.KHACHHANG.MaKH
							FROM dbo.DATBAO,dbo.KHACHHANG
							WHERE MaBaoTC LIKE 'TN%' AND DATBAO.MaKH=KHACHHANG.MaKH) 

--6.Cho biết số tờ báo mà mỗi khách hàng đãn mua
SELECT KH.TenKH,DB.MaKH,SUM(DB.SLMua)
FROM dbo.DATBAO DB, dbo.KHACHHANG KH
WHERE KH.MaKH=DB.MaKH
GROUP BY KH.TenKH,DB.MaKH

--7.Cho biết số khách hàng đặt mua báo trong năm 2004
SELECT DB.MaKH
FROM dbo.DATBAO DB
WHERE YEAR(DB.NgayDM) =2004

--8.Cho biết thông tin đặt mua báo của các khách hàng
SELECT KH.TenKH,BC.Ten,BC.DinhKy,DB.SLMua,DB.SLMua*BC.GiaBan AS SoTien
FROM dbo.BAO_TCHI BC, dbo.DATBAO DB, dbo.KHACHHANG KH
WHERE DB.MaKH=KH.MaKH AND BC.MaBaoTC=DB.MaBaoTC

--9.Cho biết cá tờ báo, tạp chí và tổng số lượng đặt mua của các khách hàng đối với tờ báo, tạp chí đó
SELECT BC.Ten,BC.DinhKy,SUM(DB.SLMua)
FROM dbo.BAO_TCHI BC,dbo.DATBAO DB
WHERE DB.MaBaoTC=BC.MaBaoTC
GROUP BY BC.MaBaoTC,BC.Ten,BC.DinhKy

--10.Cho biết tên các tờ báo dành cho học sinh, sinh viên
SELECT * 
FROM dbo.BAO_TCHI
WHERE MaBaoTC LIKE'HS%'

--11.Cho biết những tờ báo không có người đặt mua
SELECT MaBaoTC,Ten
FROM dbo.BAO_TCHI BC
WHERE MaBaoTC NOT IN(		SELECT MaBaoTC
							FROM dbo.DATBAO)

--12.Cho biết tên, định kỳ của những tờ báo có nhiều người đặt mua nhất
SELECT BC.Ten,BC.DinhKy,COUNT(DB.SLMua)
FROM dbo.DATBAO DB, dbo.BAO_TCHI BC
WHERE BC.MaBaoTC=DB.MaBaoTC
GROUP BY BC.Ten,BC.DinhKy
HAVING COUNT(DB.SLMua) in
		(	SELECT MAX(SL.SLM)
			FROM	(SELECT COUNT(SLMua) AS SLM
					FROM dbo.DATBAO
					GROUP BY MaBaoTC) AS SL)

--13.Cho biết khách hàng đặt mua nhiều báo, tạp chí nhất
SELECT KH.TenKH
FROM dbo.KHACHHANG KH,dbo.DATBAO DB
WHERE KH.MaKH=DB.MaKH 
GROUP BY DB.MaKH,KH.TenKH
HAVING SUM(DB.SLMua)>=ALL (	SELECT SUM(SLMua) 
								FROM dbo.DATBAO 
								GROUP BY MaKH)

--14.Cho biết các tờ báo phát hành định kỳ một tháng 2 lần
SELECT *
FROM dbo.BAO_TCHI
WHERE DinhKy = N'Nhật báo'

--15.Cho biết các tờ báo, tạp chí có từ 2 khách hàng đặt mua trở lên
SELECT BAO_TCHI.MaBaoTC,Ten
FROM dbo.BAO_TCHI,dbo.DATBAO
WHERE DATBAO.MaBaoTC=BAO_TCHI.MaBaoTC 
GROUP BY Ten,BAO_TCHI.MaBaoTC
HAVING COUNT(SLMua) >= 2

-------------------------------------
-- Hàm & thủ tục
-------------------------------------
--HÀM
--a.Tính tổng số tiền mua báo/tạp chí của một khách hàng cho trước
CREATE FUNCTION tongTienMuaBao(@maKH CHAR(5))
RETURNS INT
AS
BEGIN
    DECLARE @tongTien INT
	SELECT @tongTien=SUM(db.SLMua*bc.GiaBan)
	FROM dbo.DATBAO db,dbo.BAO_TCHI bc
	WHERE @maKH=db.MaKH AND db.MaBaoTC=bc.MaBaoTC
	RETURN @tongTien
END

PRINT  dbo.tongTienMuaBao('KH01')

--b.Tính tổng số tiền thu được của một tờ báo/tạp chí cho trước.
CREATE FUNCTION tongTienBaoTapChi(@maBao CHAR(5))
RETURNS int
AS
 BEGIN
     DECLARE @tongTien INT
	 SELECT @tongTien = SUM(db.SLMua*bc.GiaBan)
	 FROM dbo.BAO_TCHI bc, dbo.DATBAO db
	 WHERE @maBao=db.MaBaoTC AND db.MaBaoTC=bc.MaBaoTC
	 RETURN @tongTien
 END

 PRINT dbo.tongTienBaoTapChi('TT01')

 --THỦ TỤC
 --a.In danh mục báo, tạp chí phải giao cho một khách hàng cho trước
 CREATE PROC usp_DanhMucBTC @maKH CHAR(5)
 AS
	IF EXISTS (SELECT * FROM dbo.KHACHHANG WHERE MaKH=@maKH)
	BEGIN
	     SELECT db.MaKH,kh.TenKH,kh.DiaChi,db.MaBaoTC,db.SLMua
		 FROM dbo.DATBAO db,dbo.KHACHHANG kh
		 WHERE db.MaKH=kh.MaKH AND db.MaKH=@maKH
	END
	ELSE
	PRINT(N'Mã khách hàng không tồn tại')
	go
EXEC usp_DanhMucBTC 'KH01'

--b.In danh sách khách hàng đặt mua báo/tạp chí cho trước.
CREATE PROC usp_DanhSachKHMua @maBao CHAR(5)
AS 
	IF EXISTS (SELECT * FROM dbo.BAO_TCHI WHERE MaBaoTC = @maBao)
	BEGIN
	    SELECT kh.MaKH,kh.TenKH,db.SLMua,kh.DiaChi,db.NgayDM
		FROM dbo.KHACHHANG kh, dbo.DATBAO db
		WHERE db.MaKH=kh.MaKH AND db.MaBaoTC=@maBao
	END
	ELSE 
	PRINT(N'Không tồn tại mã báo/tạp chí')
	GO
    
	EXEC usp_DanhSachKHMua 'TT01'