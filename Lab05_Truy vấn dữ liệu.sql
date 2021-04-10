USE Lab05_QLTDL
GO

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