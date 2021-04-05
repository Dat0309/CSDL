USE Lab01_QLNV
GO

--a.với mỗi chi nhánh, hãy cho biết các thông tin sau: TenCN, SoNV
SELECT cn.TenCN, COUNT(nv.MANV) AS SoNV
FROM dbo.ChiNhanh AS cn,dbo.NhanVien AS nv
WHERE cn.MSCN=nv.MSCN
GROUP BY cn.TenCN

--b.Với mỗi kỹ năng hãy cho biết TenKN, SoNguoiDung
SELECT kn.TenKN, COUNT(nvkn.MANV) AS SoNguoiDung
FROM dbo.KyNang AS kn, dbo.NhanVienKyNang AS nvkn
WHERE kn.MSKN=nvkn.MSKN
GROUP BY kn.TenKN

--c.Cho biết TenKN có từ 3 nhân viên trong công ty sử dụng trở lên
SELECT kn.TenKN 
FROM dbo.KyNang AS kn, dbo.NhanVienKyNang AS nvkn
WHERE kn.MSKN=nvkn.MSKN 
GROUP BY kn.TenKN
HAVING COUNT(nvkn.MANV) >=3

--d.Cho biết TenCN có nhiều nhân viên nhất

SELECT TenCN 
FROM dbo.ChiNhanh,dbo.NhanVien
WHERE NhanVien.MSCN=ChiNhanh.MSCN 
GROUP BY TenCN
HAVING COUNT(MANV) in
(	SELECT MAX(SLNV.SoLuong) AS MaxSL
	FROM  dbo.ChiNhanh,dbo.NhanVien, (
										SELECT COUNT(MANV) AS SoLuong
										FROM dbo.ChiNhanh,dbo.NhanVien
										WHERE NhanVien.MSCN=ChiNhanh.MSCN  
										GROUP BY TenCN) AS SLNV)

--e.Cho biết tên CN có ít nhân viên nhất
SELECT TenCN 
FROM dbo.ChiNhanh,dbo.NhanVien
WHERE NhanVien.MSCN=ChiNhanh.MSCN 
GROUP BY TenCN
HAVING COUNT(MANV) in
(	SELECT MIN(SLNV.SoLuong) AS MaxSL
	FROM  dbo.ChiNhanh,dbo.NhanVien, (
										SELECT COUNT(MANV) AS SoLuong
										FROM dbo.ChiNhanh,dbo.NhanVien
										WHERE NhanVien.MSCN=ChiNhanh.MSCN  
										GROUP BY TenCN) AS SLNV)

--f.Với mỗi nhân viên, hãy cho biết số kỹ năng tin học mà nhân viên đó sử dụng được
SELECT nvkn.MANV,nv.Ho+' '+nv.Ten AS HoTen,COUNT(nvkn.MSKN) AS SLKN
FROM dbo.NhanVien AS nv,dbo.NhanVienKyNang AS nvkn
WHERE nv.MANV=nvkn.MANV
GROUP BY nvkn.MANV, nv.Ho+' '+nv.Ten

--g.cho biết HoTen, TenCN của nhân viên sử dụng nhiều kỹ năng nhất
SELECT Ho+' '+Ten AS HoTen,TenCN
FROM dbo.NhanVien,dbo.ChiNhanh,dbo.NhanVienKyNang
WHERE NhanVien.MANV=NhanVienKyNang.MANV AND ChiNhanh.MSCN=NhanVien.MSCN
GROUP BY Ho+' '+Ten,TenCN
HAVING COUNT(MSKN) in
		(SELECT MAX(NVSL.SLKN)
		FROM (	SELECT COUNT(nvkn.MSKN) AS SLKN 
				FROM dbo.NhanVien nv,dbo.NhanVienKyNang nvkn
				WHERE nv.MANV=nvkn.MANV
				GROUP BY nvkn.MANV) AS NVSL)
