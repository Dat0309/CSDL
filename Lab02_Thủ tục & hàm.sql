USE Lab02_QLSX
GO

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

PRINT dbo.TongCongThang('CN001')

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

SELECT dbo.tong_Luong('TS01')

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
DROP PROC usp_BangChamCong