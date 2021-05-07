CREATE DATABASE Lab06_QLHV
GO
USE Lab06_QLHV
GO


CREATE TABLE CaHoc
(Ca TINYINT PRIMARY KEY,
GioBatDau TIME ,
GioKetThuc TIME  
)
--ALTER TABLE dbo.CaHoc ALTER COLUMN GioKetThuc TIME

GO
CREATE TABLE GiaoVien
(MSGV CHAR(4) PRIMARY KEY,
HoGV NVARCHAR(20)NOT NULL,
TenGV NVARCHAR(10) NOT NULL,
DienThoai VARCHAR(6)
)
GO
CREATE TABLE Lop
(MaLop CHAR(4) PRIMARY KEY,
TenLop VARCHAR(15) NOT NULL,
NgayKG DATETIME,
HocPhi INT CHECK(HocPhi>0),
Ca TINYINT REFERENCES dbo.CaHoc(Ca),
SoTiet TINYINT,
SoHV TINYINT CHECK(SoHV<=30),
MSGV CHAR(4) REFERENCES dbo.GiaoVien(MSGV)
)
GO
CREATE TABLE HocVien
(
MSHV CHAR(10) PRIMARY KEY,
Ho NVARCHAR(20),
Ten NVARCHAR(10),
NgaySinh DATETIME,
Phai CHAR(3),
MaLop CHAR(4) REFERENCES dbo.Lop(MaLop)
)
GO
CREATE TABLE HocPhi
(SoBL CHAR(4) PRIMARY KEY,
MSHV CHAR(10) REFERENCES dbo.HocVien(MSHV),
NgayThu DATETIME,
SoTien INT NOT NULL,
NoiDung VARCHAR(20),
NguoiThu NVARCHAR(10) NOT NULL
)
GO

--Chèn dữ liệu vào bảng
INSERT dbo.CaHoc
(
    Ca,
    GioBatDau,
    GioKetThuc
)
VALUES
(   1,         -- Ca - tinyint
    '7:30', -- GioBatDau - datetime
    '10:45'  -- GioKetThuc - datetime
    )

SELECT * FROM dbo.CaHoc

INSERT dbo.Lop
	(
	    MaLop,
	    TenLop,
	    NgayKG,
	    HocPhi,
	    Ca,
	    SoTiet,
	    SoHV,
	    MSGV
	)
	VALUES
	(   'E114',        -- MaLop - char(4)
	    'Excel 3-5-7',        -- TenLop - varchar(15)
	    '01/02/2008', -- NgayKG - datetime
	    120000,         -- HocPhi - int
	    1,         -- Ca - tinyint
	    45,         -- SoTiet - tinyint
	    3,         -- SoHV - tinyint
	    'G003'         -- MSGV - char(4)
	    )
DELETE FROM dbo.Lop WHERE MaLop='E114'
SELECT * FROM dbo.Lop

--Chèn vào giáo viên
INSERT dbo.GiaoVien
		(
		    MSGV,
		    HoGV,
		    TenGV,
		    DienThoai
		)
		VALUES
		(   'G003',  -- MSGV - char(4)
		    N'Trần Minh', -- HoGV - nvarchar(20)
		    N'Hùng', -- TenGV - nvarchar(10)
		    '823456'   -- DienThoai - varchar(6)
		    )
--Chèn học viên
INSERT dbo.HocVien
		(
		    MSHV,
		    Ho,
		    Ten,
		    NgaySinh,
		    Phai,
		    MaLop
		)
		VALUES
		(   'W12301',        -- MSHV - char(10)
		    N'Nguyễn Ngọc',       -- Ho - nvarchar(20)
		    N'Tuyết',       -- Ten - nvarchar(10)
		    '05/12/1996', -- NgaySinh - datetime
		    'Nữ',        -- Phai - char(3)
		    'W123'         -- MaLop - char(4)
		    )
--Chèn vào Học phí
INSERT dbo.HocPhi
(
    SoBL,
    MSHV,
    NgayThu,
    SoTien,
    NoiDung,
    NguoiThu
)
VALUES
(   '0001',        -- SoBL - char(4)
    'E11401',        -- MSHV - char(10)
    '01/02/2008', -- NgayThu - datetime
    120000,         -- SoTien - int
    'HP Excel 3-5-7',        -- NoiDung - varchar(20)
    N'Vân'        -- NguoiThu - nvarchar(10)
    )

	--DELETE FROM dbo.HocPhi WHERE MSHV='E11401'
--Cài đặt ràng buộc toàn vẹn
--a.giờ kết thúc của một ca học không được trước giờ bắt đầu ca học đó (giờ bắt đầu - giờ kết thúc <0)
CREATE TRIGGER UTG_CaHoc
ON dbo.CaHoc
FOR INSERT
AS
BEGIN
    DECLARE @Count INT = 0;
	SELECT @Count= COUNT(*) FROM Inserted
	WHERE DATEPART(HOUR,Inserted.GioBatDau)-DATEPART(HOUR,Inserted.GioKetThuc)>0

	IF(@Count >0)
	BEGIN
	    PRINT N'giờ kết thúc của một ca hoc không được trước giờ bắt đầu của ca học đó'
		ROLLBACK TRAN
	END
END

--DROP TRIGGER UTG_CaHoc
--b.Sĩ số của một lớp học không quá 30 học viên và đúng bằng số học viên của lớp đó
CREATE TRIGGER UTG_siSo
ON dbo.Lop
FOR INSERT 
AS
BEGIN
    DECLARE @Count INT=0;
	SELECT @Count = COUNT(*) FROM Inserted
	WHERE Inserted.SoHV>30 AND  Inserted.SoHV>(SELECT COUNT(MaLop)
												FROM dbo.HocVien
												WHERE MaLop=Inserted.MaLop)

	IF (@Count >0)
	BEGIN
		PRINT N'Sĩ số của một lớp học không quá 30 học viên và đúng bằng số học viên'
	    ROLLBACK TRAN
	END
END

--DROP TRIGGER UTG_siSo

--c.Tổng số tiền thu của một học viên không vượt quá học phí của lớp mà học viên đó đăng ký học
CREATE TRIGGER UTG_hocPhi
ON dbo.HocPhi
FOR INSERT 
AS
BEGIN
    DECLARE @Count INT=0;
	SELECT @Count= COUNT(*) FROM Inserted
	WHERE Inserted.SoTien>(SELECT HocPhi
							FROM dbo.Lop,dbo.HocVien
							WHERE MSHV=Inserted.MSHV)

	IF(@Count>0)
	BEGIN
		PRINT N'Tổng số tiền thu của một học viên không vượt quá học phí của lớp mà học viên đó đăng ký học'
	    ROLLBACK TRAN
	END
END

--DROP TRIGGER UTG_hocPhi