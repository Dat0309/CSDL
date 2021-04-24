USE Lab04_QLDB
GO

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