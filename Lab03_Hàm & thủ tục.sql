USE Lab03_QLNXHH
GO
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