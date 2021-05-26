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
Phai nvarCHAR(3),
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
IF UPDATE(MaLop) Or UPDATE(SoHV)
BEGIN
    DECLARE @Count INT=0;
	SELECT @Count = COUNT(*) FROM Inserted
	WHERE Inserted.SoHV>30 AND  Inserted.SoHV<>(SELECT COUNT(MSHV)
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

--4.Tạo các hàm thủ tục sau:
--a.Thêm dữ liệu vào các bảng
CREATE PROC usp_ThemCaHoc @ca tinyint, @giobd TIME, @giokt TIME 
AS
	IF EXISTS(	SELECT * FROM dbo.CaHoc
				WHERE Ca=@ca)
				PRINT N'Đã có ca học trong CSDL'
	ELSE 
		BEGIN
		    INSERT INTO dbo.CaHoc
		    VALUES
		    (   @ca,          -- Ca - tinyint
		        @giobd, -- GioBatDau - time(7)
		        @giokt  -- GioKetThuc - time(7)
		        )
			PRINT N'Thêm ca thành công!'
		END
---------------
EXEC usp_ThemCaHoc 1,'7:30','10:45'
---------------------------

CREATE PROC usp_ThemGiaoVien @msgv CHAR(4),@hogv nvarchar(20),@ten nvarchar(10),@dt varchar(6)
AS
	IF EXISTS (	SELECT * FROM dbo.GiaoVien WHERE MSGV=@msgv)
		PRINT N'Đã có giáo viên trong CSDL'
	ELSE
		BEGIN
		    INSERT INTO dbo.GiaoVien
		    VALUES
		    (   @msgv,  -- MSGV - char(4)
		        @hogv, -- HoGV - nvarchar(20)
		        @ten, -- TenGV - nvarchar(10)
		        @dt -- DienThoai - varchar(6)
		        )
				PRINT N'Thêm giáo viên thành công'
		END

------------------------------------
exec usp_ThemGiaoVien 'G001',N'Lê Hoàng',N'Anh', '858936'
exec usp_ThemGiaoVien 'G002',N'Nguyễn Ngọc',N'Lan', '845623'
exec usp_ThemGiaoVien 'G003',N'Trần Minh',N'Hùng', '823456'
exec usp_ThemGiaoVien 'G004',N'Võ Thanh',N'Trung', '841256'

------------------------------------
CREATE PROC usp_ThemLop @malop CHAR(4),@tenlop varchar(15),@ngaykg datetime,@hocphi int,@ca tinyint,@sotiet tinyint,@sohv tinyint,@magv CHAR(4)
AS
	IF EXISTS(	SELECT * FROM dbo.CaHoc WHERE Ca=@ca) AND EXISTS(	SELECT * FROM dbo.GiaoVien WHERE MSGV=@magv)
		BEGIN
		    IF EXISTS (	SELECT * FROM dbo.Lop WHERE MaLop=@malop)
				PRINT N'Đã có lớp trong CSDL'
			ELSE
				BEGIN
				    INSERT INTO dbo.Lop
				    VALUES
				    (   @malop,        -- MaLop - char(4)
				        @tenlop,        -- TenLop - varchar(15)
				        @ngaykg, -- NgayKG - datetime
				        @hocphi,         -- HocPhi - int
				        @ca,         -- Ca - tinyint
				        @sotiet,         -- SoTiet - tinyint
				        @sohv,         -- SoHV - tinyint
				        @magv         -- MSGV - char(4)
				        )
				END
		END
	ELSE
		BEGIN
		    IF NOT EXISTS (SELECT * FROM dbo.CaHoc WHERE Ca=@ca)
				PRINT N'Không tồn tại ca học trong CSDL'
			ELSE
				PRINT N'Không tồn tại giáo viên trong CSDL'
		END

------------------------------------------
set dateformat dmy
go
exec usp_ThemLop 'A075',N'Access 2-4-6','18/12/2008', 150000,3,60,3,'G003'
exec usp_ThemLop 'E114',N'Excel 3-5-7','02/01/2008', 120000,1,45,3,'G003'
exec usp_ThemLop 'A115',N'Excel 2-4-6','22/01/2008', 120000,3,45,0,'G001'
exec usp_ThemLop 'W123',N'Word 2-4-6','18/02/2008', 100000,3,30,1,'G001'
exec usp_ThemLop 'W124',N'Word 3-5-7','01/03/2008', 100000,1,30,0,'G002'

------------------------------------------
CREATE PROC usp_ThemHocVien @mshv CHAR(10),@ho nvarchar(20),@ten nvarchar(10),@ns datetime,@phai nvarchar(3),@malop CHAR(4)
AS
	IF EXISTS (SELECT * FROM dbo.Lop WHERE MaLop=@malop)
		BEGIN
		    IF EXISTS (SELECT * FROM dbo.HocVien WHERE MSHV=@mshv)
				PRINT N'Đã tồn tại học viên trong CSDL'
			ELSE 
				BEGIN
				    INSERT INTO dbo.HocVien
				    VALUES
				    (   @mshv,        -- MSHV - char(10)
				        @ho,       -- Ho - nvarchar(20)
				        @ten,       -- Ten - nvarchar(10)
				        @ns, -- NgaySinh - datetime
				        @phai,        -- Phai - char(3)
				        @malop         -- MaLop - char(4)
				        )
						PRINT N'Đã thêm dữ liệu vào bảng thành công'
				END
		END
	ELSE
		PRINT N'Không tồn tại lớp trong CSDL'

-------------------------
set dateformat dmy
go
exec usp_ThemHocVien 'A07501',N'Lê Văn', N'Minh', '10/06/1988',N'Nam', 'A075'
exec usp_ThemHocVien 'A07502',N'Nguyễn Thị', N'Mai', '20/04/1988',N'Nữ', 'A075'
exec usp_ThemHocVien 'A07503',N'Lê Ngọc', N'Tuấn', '10/06/1984',N'Nam', 'A075'
exec usp_ThemHocVien 'E11401',N'Vương Tuấn', N'Vũ', '25/03/1979',N'Nam', 'E114'
exec usp_ThemHocVien 'E11402',N'Lý Ngọc', N'Hân', '01/12/1985',N'Nữ', 'E114'
exec usp_ThemHocVien 'E11403',N'Trần Mai', N'Linh', '04/06/1980',N'Nữ', 'E114'
exec usp_ThemHocVien 'W12301',N'Nguyễn Ngọc', N'Tuyết', '12/05/1986',N'Nữ', 'W123'


--------------------------------------
create PROC usp_ThemHocPhi
@SoBL char(4),
@MSHV char(10),
@NgayThu Datetime,
@SoTien	int,
@NoiDung nvarchar(20),
@NguoiThu nvarchar(10)
As
	If exists(select * from HocVien where MSHV = @MSHV) --kiểm tra có RBTV khóa ngoại
	  Begin
		if exists(select * from HocPhi where SoBL = @SoBL) --kiểm tra có trùng khóa(SoBL) 
			print N'Đã có số biên lai học phí này trong CSDL!'
		else
		 begin
			insert into HocPhi values(@SoBL,@MSHV,@NgayThu, @SoTien, @NoiDung,@NguoiThu)
			print N'Thêm biên lai học phí thành công.'
		 end
	  End
	Else
		print N'Học viên '+ @MSHV + N' không tồn tại trong CSDL nên không thể thêm biên lai học phí của học viên này!'
GO
--------------------------
set dateformat dmy
go
exec usp_ThemHocPhi '0001','E11401','02/01/2008',120000,'HP Excel 3-5-7', N'Vân'
exec usp_ThemHocPhi '0002','E11402','02/01/2008',120000,'HP Excel 3-5-7', N'Vân'
exec usp_ThemHocPhi '0003','E11403','02/01/2008',80000,'HP Excel 3-5-7', N'Vân'
 
exec usp_ThemHocPhi '0005','A07501','16/12/2008',150000,'HP Access 2-4-6', N'Lan'
exec usp_ThemHocPhi '0006','A07502','16/12/2008',100000,'HP Access 2-4-6', N'Lan'
exec usp_ThemHocPhi '0007','A07503','18/12/2008',150000,'HP Access 2-4-6', N'Vân'
exec usp_ThemHocPhi '0008','A07502','15/01/2009',50000,'HP Access 2-4-6', N'Vân'

DELETE FROM dbo.HocPhi

--b.Cập nhật thông tin của một học viên cho trước
CREATE PROC usp_UpdateHocVien @mshv CHAR(10),@ho nvarchar(20),@ten nvarchar(10)
AS
	IF EXISTS (SELECT * FROM dbo.HocVien WHERE MSHV=@mshv)
		BEGIN
		    UPDATE dbo.HocVien SET Ho=@ho,Ten=@ten WHERE MSHV=@mshv
			PRINT N'Cập nhật dữ liệu của học viên '+@mshv+N' thành công'
			SELECT * FROM dbo.HocVien WHERE MSHV=@mshv
		END
	ELSE 
		PRINT N'Không tìm thấy thông tin của học viên có mã số '+@mshv+N' trong CSDL'


---------------------------
exec usp_UpdateHocVien 'A07501',N'Lê Văn', N'Minh'
exec usp_UpdateHocVien 'A07502',N'Nguyễn Thị', N'Mai'
exec usp_UpdateHocVien 'A07503',N'Lê Ngọc', N'Tuấn'
exec usp_UpdateHocVien 'E11401',N'Vương Tuấn', N'Vũ'
exec usp_UpdateHocVien 'E11402',N'Lý Ngọc', N'Hân'
exec usp_UpdateHocVien 'E11403',N'Trần Mai', N'Linh'
exec usp_UpdateHocVien 'W12301',N'Nguyễn Ngọc', N'Tuyết'


--c.Xóa một học viên cho trước
CREATE PROC usp_DeleteHocVien @mshv CHAR(10)
AS
	IF EXISTS(SELECT * FROM dbo.HocVien WHERE MSHV=@mshv)
		BEGIN
			DELETE FROM dbo.HocPhi WHERE MSHV=@mshv
		    DELETE FROM dbo.HocVien WHERE MSHV=@mshv
			PRINT N'Đã xóa thành công học viên '+@mshv+N' ra khỏi CSDL'
		END
	ELSE 
		PRINT N'Không tồn tại học viên '+@mshv+N' Trong CSDL'
	
--------------------------
EXEC usp_DeleteHocVien 'W12301'

SELECT * FROM dbo.HocVien

--d.Cập nhật thông tin của một lớp học cho trước
CREATE PROC usp_UpdateLop @malop CHAR(4),@tenlop varchar(15),@ngaykg datetime,@hocphi int,@ca tinyint,@sotiet tinyint,@sohv tinyint,@magv CHAR(4)
AS
	IF EXISTS (SELECT * FROM dbo.Lop WHERE MaLop=@malop)
		BEGIN
		    IF EXISTS (SELECT * FROM dbo.CaHoc WHERE Ca=@ca) AND EXISTS(SELECT * FROM dbo.GiaoVien WHERE MSGV=@magv)
				BEGIN
				    UPDATE dbo.Lop SET TenLop=@tenlop,NgayKG=@ngaykg,HocPhi=@hocphi,Ca=@ca,SoTiet=@sotiet,SoHV=@sohv,MSGV=@magv WHERE MaLop=@malop
					PRINT N'Đã cập nhật thành công thông tin của lớp '+@malop
				END
			ELSE
				BEGIN
				    IF NOT EXISTS(SELECT*FROM dbo.CaHoc WHERE Ca=@ca)
						PRINT N'Không tồn tại ca học trong CSDL'
					ELSE 
						PRINT N'Không tồn tại giáo viên trong CSDL'
				END
		END
	ELSE
		PRINT N'Không tồn tại lớp '+@malop+N' trong CSDL'
-------------------------
EXEC usp_UpdateLop 'W123',N'Word 4-6-8','02/18/2008', 100000,2,30,1,'G004'

--e.Xóa một lớp học cho trước nếu lớp này không có học viên
CREATE PROC usp_DeleteLop @malop CHAR(4)
AS
	IF EXISTS (SELECT * FROM dbo.Lop WHERE MaLop=@malop AND SoHV =0)
		BEGIN
			DELETE FROM dbo.HocVien WHERE MaLop=@malop
		    DELETE FROM dbo.Lop WHERE MaLop=@malop
			PRINT N'Xóa thành công lớp '+@malop
		END
	ELSE 
		BEGIN
		    IF NOT EXISTS (SELECT * FROM dbo.Lop WHERE MaLop=@malop AND SoHV=0)
				PRINT N'Không xóa được vì số học viên của lớp lớn hơn 0'
			ELSE IF NOT EXISTS (SELECT * FROM dbo.Lop WHERE MaLop=@malop)
				PRINT N'Không tồn tại mã lớp '+@malop+N' trong CSDL' 
		END

----------------------------------------
EXEC usp_DeleteLop 'W124'
---------------------------------------
--f.Lập danh sách học viên của một lớp cho trước
CREATE PROC usp_LapDSLop @malop CHAR(4)
AS
	IF EXISTS(SELECT * FROM dbo.Lop WHERE MaLop=@malop)
		BEGIN
		    SELECT *
			FROM dbo.HocVien
			WHERE MaLop = @malop
		END
	ELSE
		PRINT N'Không tồn tại lớp '+@malop

--------------------------
EXEC usp_LapDSLop 'A075'
--------------------------
--g.Lập danh sách học viên chưa đóng đủ học phí của một lớp cho trước
CREATE PROC usp_DSHVChuaDuHP @malop CHAR(4)
AS 
	IF EXISTS (SELECT * FROM dbo.Lop WHERE MaLop=@malop)
		BEGIN
		    SELECT hv.MSHV,hv.Ho,hv.Ten,hv.MaLop
			FROM dbo.HocPhi hp,dbo.HocVien hv,dbo.Lop l
			WHERE l.MaLop=hv.MaLop AND HV.MaLop=@malop AND l.MaLop=@malop AND HP.MSHV=HV.MSHV AND l.HocPhi-HP.SoTien>0
		END
	ELSE
		BEGIN
		    IF NOT EXISTS(SELECT * FROM dbo.Lop WHERE MaLop=@malop)
				PRINT N'Không tồn tại lớp trong database!'
		END

EXEC usp_DSHVChuaDuHP 'A075'
--DROP PROC usp_DSHVChuaDuHP
------------------------------------
--Hàm 
------------------------------------
--Tính tổng số học phí đã thu được của một lớp khi biết mã lớp
CREATE FUNCTION tongHocPhiLop(@malop CHAR(5))
RETURNS int
AS
BEGIN
    DECLARE @tongTien INT
		SELECT @tongTien = SUM(hp.SoTien)
		FROM dbo.HocPhi hp, dbo.HocVien hv,dbo.Lop l
		WHERE hv.MaLop=l.MaLop AND l.MaLop = @malop AND hv.MSHV=hp.MSHV
		RETURN @tongTien
END

PRINT dbo.tongHocPhiLop('E114')
-----------------------------------------------------
--b.Tính tổng số học phí thu được trong một khoảng thời gian cho trước
CREATE FUNCTION tongHocPhiTime(@thoigian datetime)
RETURNS int
AS
BEGIN
    DECLARE @tongTien INT
    SELECT @tongTien = SUM(hp.SoTien) 
	FROM dbo.HocPhi hp
	WHERE hp.NgayThu=@thoigian
	RETURN @tongTien
END

PRINT dbo.tongHocPhiTime('02/01/2008')
--------------------------------------------------------
--c.Cho biết một học viên cho trước đã nộp đủ học phí hay chưa
CREATE FUNCTION nopHocPhi(@mshv CHAR(10))
RETURNS nvarchar(100)
AS
BEGIN
	IF EXISTS(SELECT * FROM dbo.HocPhi WHERE MSHV=@mshv)
		begin
			DECLARE @count INT=0;
		    SELECT @count=COUNT(*)
			FROM dbo.HocVien hv, dbo.HocPhi hp,dbo.Lop l
			WHERE  hv.MSHV=hp.MSHV AND hp.MSHV=@mshv AND hv.MSHV=@mshv AND l.HocPhi-hp.SoTien>0 AND l.MaLop=hv.MaLop

			IF (@count>0)
				RETURN N'Học viên chưa nộp đủ học phí'
			ELSE
				RETURN N'Học viên đã nộp đủ học phí'
		END
    ELSE
		RETURN N'Không tồn tại học viên'

		RETURN N'Không xác định'
END

SELECT dbo.nopHocPhi('E11401')
--DROP FUNCTION nopHocPhi

---------------------------------------------------
