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

--------------------------------------
--Hàm & thủ tục thêm dữ liệu vào bảng
--------------------------------------
CREATE PROC usp_ThemTour @matour CHAR(5), @tongsongay tinyint
AS 
	IF EXISTS (	SELECT * FROM dbo.Tour
				WHERE MaTour=@matour)
				PRINT N'Đã tồn tại tour trong danh sách tour!'
	ELSE
		BEGIN
		    INSERT INTO dbo.Tour
		    VALUES
		    (   @matour, -- MaTour - char(5)
		        @tongsongay   -- TongSoNgay - tinyint
		        )
				PRINT N'Thêm tour thành công!'
		END

EXEC usp_ThemTour 'T001',3

CREATE PROC usp_ThemTP @matp CHAR(2),@tentp nvarchar(20)
AS
	IF EXISTS(	SELECT * FROM dbo.ThanhPho
				WHERE MaTP=@matp)
				PRINT N'Đã tồn tại thành phố !'
	ELSE
		BEGIN
		    INSERT INTO dbo.ThanhPho
		    VALUES
		    (   @matp, -- MaTP - char(2)
		        @tentp -- TenTP - nvarchar(20)
		        )
				PRINT N'Đã nhập thành công thành phố'+@matp
		END
EXEC usp_ThemTP '01',N'Đà Lạt'

CREATE PROC usp_ThemTourTP @matour CHAR(5),@matp CHAR(2),@songay tinyint
AS
	IF EXISTS (SELECT * FROM dbo.Tour WHERE MaTour=@matour) AND EXISTS(SELECT * FROM dbo.ThanhPho WHERE MaTP=@matp)
		BEGIN
		    INSERT INTO dbo.TOUR_TP
		    VALUES
		    (   @matour, -- MaTour - char(5)
		        @matp, -- MaTP - char(2)
		        @songay   -- SoNgay - tinyint
		        )
				PRINT N'Đã thêm thành công thông tin tour thành phố!'
		END
	ELSE
		BEGIN
		    IF NOT EXISTS (SELECT * FROM dbo.Tour WHERE MaTour=@matour)
				PRINT N'Không tồn tại tour trong cơ sở dữ liệu!'
			ELSE
				PRINT N'Không tồn tại thành phố trong cơ sở dữ liệu!'
		END

EXEC usp_ThemTourTP 'T005',N'Bình Phước',3

CREATE PROC usp_ThemLichTour @matour CHAR(5),@ngaykh datetime,@tenhdv nvarchar(10),@songuoi int,@tenkh nvarchar(20)
AS
	IF EXISTS (SELECT * FROM dbo.Tour WHERE MaTour=@matour)
		BEGIN
		    INSERT INTO dbo.Lich_TourDL
		    VALUES
		    (   @matour,        -- MaTour - char(5)
		        @ngaykh, -- NgayKH - datetime
		        @tenhdv,       -- TenHDV - nvarchar(10)
		        @songuoi,         -- SoNguoi - int
		        @tenkh        -- TenKH - nvarchar(20)
		        )
				PRINT N'Đã nhập nhành công dữ liệu của lịch tour vào bảng!'
		END
	ELSE 
		BEGIN
		    IF NOT EXISTS (SELECT * FROM dbo.Tour WHERE MaTour=@matour)
			PRINT N'Mã tour không tồn tại!'
		END

EXEC usp_ThemLichTour 'T001','02/14/2017',N'Vân',20,N'Nguyễn Hoàng'
SELECT * FROM dbo.Lich_TourDL
		
-------------------------------------
--Truy vấn dữ liệu
-------------------------------------
--a.Cho biết các tour du lịch có tổng số ngày của tour từ 3 đến 5 ngày
SELECT MaTour
FROM dbo.TOUR_TP
GROUP BY MaTour
HAVING SUM(SoNgay) BETWEEN 3 AND 5

--b.Cho biết thông tin các tour được tổ chức trong tháng 2 năm 2017
SELECT *
FROM dbo.Lich_TourDL
WHERE MONTH(NgayKH)=02 AND YEAR(NgayKH)=2017

--c.Cho biết các tour không đi qua thành phố 'Nha Trang'
SELECT MaTour 
FROM dbo.Tour
WHERE MaTour NOT IN
	(	SELECT MaTour
		FROM dbo.TOUR_TP JOIN dbo.ThanhPho ON ThanhPho.MaTP = TOUR_TP.MaTP
		WHERE TenTP ='Nha Trang')

--d.Cho biết số lượng thành phố mà mỗi tour du lịch đi qua
SELECT MaTour,COUNT(MaTP) AS SLTP
FROM dbo.TOUR_TP
GROUP BY MaTour

--e.Cho biết số lượn tour du lịch mà mỗi hướng dẫn viên hướng dẫn
SELECT TenHDV,COUNT(MaTour) AS SLTour
FROM dbo.Lich_TourDL
GROUP BY TenHDV

--f.Cho biết tên thành phố có nhiều tour du lịch đi qua nhất
SELECT TTP1.MaTP,TP.TenTP
FROM dbo.TOUR_TP TTP1, dbo.ThanhPho TP
WHERE TP.MaTP=TTP1.MaTP
GROUP BY TTP1.MaTP,TP.TenTP
HAVING COUNT(TTP1.MaTour)>=ALL
(	SELECT COUNT(TTP.MaTour)
	FROM dbo.TOUR_TP TTP
	GROUP BY TTP.MaTP)

--g,Cho biết thong tin của tour du lịch đi qua tất cả thành phố
SELECT *
FROM dbo.Tour T
WHERE NOT EXISTS (	SELECT *
					FROM dbo.ThanhPho TP
					WHERE NOT EXISTS (	SELECT *
										FROM dbo.TOUR_TP TTP
										WHERE TTP.MaTour=T.MaTour AND TTP.MaTP=TP.MaTP ))

--h.Lập danh sách các tour đi qua thành phố Đà Lạt
SELECT TTP.MaTour,TTP.SoNgay
FROM dbo.TOUR_TP TTP, dbo.ThanhPho TP
WHERE TTP.MaTP=TP.MaTP AND TP.TenTP=N'Đà Lạt'

--i.Cho biết thông tin của tour du lịch có tổng số lượng khách tham gia nhiều nhất
SELECT Tour.MaTour,TongSoNgay
FROM dbo.Lich_TourDL,dbo.Tour
WHERE Lich_TourDL.MaTour=Tour.MaTour
GROUP BY Tour.MaTour,TongSoNgay
HAVING SUM(SoNguoi) >=ALL
	(	SELECT SUM(SoNguoi)
		FROM dbo.Lich_TourDL
		GROUP BY MaTour)

--j.Cho biết tên thành phố mà tất cả các tour du lịch đều đi qua
SELECT *
FROM dbo.ThanhPho TP
WHERE NOT EXISTS (	SELECT *
					FROM dbo.Tour T
					WHERE NOT EXISTS (	SELECT *
										FROM dbo.TOUR_TP TTP
										WHERE TTP.MaTP=TP.MaTP AND TTP.MaTour=T.MaTour))