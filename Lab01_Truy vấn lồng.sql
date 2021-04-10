USE Lab01_QLNV
GO

--a.Liệt kê MANV, HoTen,MSCN, TenCN của các nhân viên có mức độ thành thạo về 'Excel' cao nhất trong công ti
SELECT nv.MANV,Ho+' '+NV.Ten AS HoTen, NV.MSCN,CN.TenCN 
FROM dbo.NhanVienKyNang AS NVKN, dbo.NhanVien AS NV,dbo.ChiNhanh AS CN
WHERE NV.MANV=NVKN.MANV AND NV.MSCN=CN.MSCN and NVKN.MucDo in (	SELECT MAX(MucDo) AS MaxMD
																FROM dbo.NhanVienKyNang
																WHERE MSKN='02'
															) AND NVKN.MSKN='02'


--b.Liệt kê MANV, HoTen, TenCN của các nhân viên vừa biết 'word' vừa biết 'excel'
SELECT MANV,Ho+' '+Ten AS HoTen,TenCN 
FROM dbo.NhanVien,dbo.ChiNhanh,dbo.KyNang
WHERE TenKN='Word' and MANV in
(SELECT MANV
FROM dbo.NhanVienKyNang
WHERE MSKN ='01') AND ChiNhanh.MSCN=NhanVien.MSCN

--d.
