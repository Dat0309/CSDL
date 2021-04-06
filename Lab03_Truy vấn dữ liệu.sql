﻿USE Lab03_QLNXHH
GO

--1.Liệt kê các mặt hàng thuộc loại đĩa cứng
SELECT *
FROM dbo.HangHoa 
WHERE MaHH LIKE 'CPU%'

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
SELECT *
FROM dbo.DoiTac,dbo.KhaNangCC
WHERE KhaNangCC.MaDT=DoiTac.MaDT AND MAHH LIKE 'CPU%'

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
					WHERE HH.MaHH LIKE 'CPU%'
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
					WHERE HH.MaHH LIKE 'CPU%'
					AND  EXISTS (	SELECT *
										FROM dbo.KhaNangCC KN2
										WHERE KN2.MAHH=HH.MAHH AND KN2.MaDT=KN.MaDT)))
--14.Cho biết cửa hàng bán bao nhiêu mặt hàng
SELECT COUNT(MaHH) AS SoLuongMH
FROM dbo.HangHoa

--15.Cho biết số mặt hàng mà từng nhà cung cấp có khả năng cung cấp
