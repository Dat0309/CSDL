USE Lab02_QLSX
GO

--1.Liệt kê các công nhân theo tổ sẳn xuất gồm các thông tin: TenTSX, HoTen
SELECT tsx.TenTSX,cn.Ho+' '+cn.Ten AS HoTen 
FROM dbo.CongNhan cn,dbo.ToSanXuat tsx
WHERE cn.MATSX=tsx.MATSX

--2.Liệt kê các thành phẩm mà công nhân 'Nguyễn Trường An' đã làm được'
SELECT sp.TenSP,tp.Ngay,tp.SoLuong,sp.TienCong * tp.SoLuong AS ThanhTien 
FROM dbo.ThanhPham tp,dbo.SanPham sp
WHERE tp.MACN='CN001' AND sp.MASP=tp.MASP
ORDER BY tp.Ngay

--3.Liệt kê các nhân viên không sản xuất sản phẩm 'Bình gốm lớn'
SELECT Ho+' '+Ten AS NhanVienKSX
FROM dbo.CongNhan
WHERE MACN NOT IN(
					SELECT cn.MACN
					FROM dbo.CongNhan cn,dbo.SanPham sp,dbo.ThanhPham tp
					WHERE cn.MACN=tp.MACN AND sp.MASP=tp.MASP AND sp.TenSP = N'Bình gốm lớn')

--4.Liệt kê thông tin các công nhân có sản xuất cả nồi đất và bình gốm nhỏ
SELECT cn.Ho+' '+cn.Ten AS HoTen
FROM dbo.CongNhan cn,dbo.SanPham sp, dbo.ThanhPham tp
WHERE cn.MACN=tp.MACN AND tp.MASP=sp.MASP and sp.TenSP =N'Nồi đất' AND tp.MACN IN (	SELECT tp.MACN
																					FROM dbo.CongNhan cn,dbo.SanPham sp, dbo.ThanhPham tp
																					WHERE cn.MACN=tp.MACN AND tp.MASP=sp.MASP ANd sp.TenSP = N'Bình gốm nhỏ')
--5.Thống kê sô lượng công nhân theo từng tổ sản xuất
SELECT TenTSX,COUNT(MACN) 
FROM dbo.ToSanXuat,dbo.CongNhan
WHERE CongNhan.MATSX=ToSanXuat.MATSX
GROUP BY TenTSX

--6.Tổng số lượng thành phẩm theo từng loại mà mỗi nhân viên làm được
SELECT Ten,TenSP,SoLuong,TienCong*SoLuong AS TongThanhTien
FROM dbo.CongNhan,dbo.SanPham,dbo.ThanhPham
WHERE ThanhPham.MASP=SanPham.MASP AND CongNhan.MACN=ThanhPham.MACN
GROUP BY TenSP,Ten,SoLuong,TienCong*SoLuong

--7.Tổng số tiền công đã trả cho công nhân trong tháng 1 năm 2007
SELECT SUM(TongL.TienCong) AS N'Tổng số tiền lương'
FROM (	SELECT sp.TienCong*tp.SoLuong as TienCong
		FROM dbo.SanPham sp,dbo.ThanhPham tp
		WHERE sp.MASP=tp.MASP AND YEAR(tp.Ngay)=2007 AND MONTH(tp.Ngay)=01) AS TongL

--8.Cho biết sản phẩm được sản xuất nhiều nhất trong tháng 2/2007
SELECT TenSP
FROM dbo.SanPham,dbo.ThanhPham
WHERE SanPham.MASP=ThanhPham.MASP AND MONTH(Ngay) ='02' AND YEAR(Ngay)='2007' AND SoLuong IN(	SELECT MAX(SoLuong)
																								FROM dbo.SanPham,dbo.ThanhPham
																								WHERE SanPham.MASP=ThanhPham.MASP AND MONTH(Ngay) ='02' AND YEAR(Ngay)='2007')

--9.Cho biết công nhân sản xuất được nhiều chén nhất
SELECT cn.MACN,cn.Ho+' '+cn.Ten AS HoTen
FROM dbo.CongNhan cn,dbo.ThanhPham tp
WHERE cn.MACN=tp.MACN AND tp.MASP='SP002' AND tp.SoLuong IN (	SELECT MAX(SoLuong) AS maxSl	
																FROM dbo.CongNhan,dbo.ThanhPham
																WHERE CongNhan.MACN=ThanhPham.MACN AND MASP='SP002')



--10.Tiền công tháng 2/2006 của công nhân viên có mã số 'CN002'
SELECT L.HoTen,SUM(l.TongTienCong) AS TienCongThang2
FROM 
(SELECT Ho+' '+Ten AS HoTen, TienCong*SoLuong AS TongTienCong
FROM dbo.ThanhPham,dbo.SanPham,dbo.CongNhan
WHERE ThanhPham.MASP=SanPham.MASP AND ThanhPham.MACN=CongNhan.MACN AND CongNhan.MACN='CN002' AND MONTH(Ngay) ='02' AND YEAR(Ngay)='2007') AS L
GROUP BY l.HoTen

--11.Liệt kê các công nhân có sản xuất từ 3 loại sản phẩm trở lên
SELECT Ho+' '+Ten AS HoTen,COUNT(MASP) AS SoLuongSP
FROM dbo.CongNhan,dbo.ThanhPham
WHERE CongNhan.MACN=ThanhPham.MACN
GROUP BY Ho+' '+Ten
HAVING COUNT(MASP) >=3

--12.Cập nhật giá tiền công của các loại bình gốm thêm 1000
UPDATE dbo.SanPham SET TienCong = TienCong+1000
WHERE MASP IN('SP003','SP004')
SELECT * FROM dbo.SanPham

--13.Thêm bộ <'CN006'> vào bảng CongNhan
INSERT INTO dbo.CongNhan
VALUES
(   'CN006',        -- MACN - char(5)
    N'Lê Thị',       -- Ho - nvarchar(20)
    N'Lan',       -- Ten - nvarchar(10)
    N'Nữ',       -- Phai - nvarchar(5)
    GETDATE(), -- NgaySinh - datetime
    'TS02'         -- MATSX - char(5)
    )

	SELECT * FROM dbo.CongNhan