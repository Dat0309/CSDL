USE Lab04_QLDB
GO

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