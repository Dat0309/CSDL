USE Lab03_QLNXHH
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