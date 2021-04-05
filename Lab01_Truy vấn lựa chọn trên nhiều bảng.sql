USE Lab01_QLNV
GO

--a.Hiển thị MSNV, HoTen, Số năm làm việc
SELECT MANV,Ho+' '+Ten AS HoTen,YEAR(GETDATE())-YEAR(NgayVaoLam) AS SoNamLamViec
FROM dbo.NhanVien

--b.Liệt kê các thông tin về nhân viên: HoTen, NgaySinh, NgayVaoLam,TenCN
SELECT Ho+' '+Ten AS HoTen,Ngaysinh,NgayVaoLam,TenCN
FROM dbo.NhanVien AS NV,dbo.ChiNhanh AS CN
WHERE NV.MSCN=CN.MSCN
ORDER BY CN.TenCN

--c.Liệt kê các nhân viên (HoTen,TenKN, MucDo) của những nhân viên biết sử dụng 'word'
SELECT NV.Ho+' '+NV.Ten AS HoTen,KN.TenKN,NVKN.MucDo 
FROM dbo.NhanVien AS NV,dbo.KyNang AS KN,dbo.NhanVienKyNang AS NVKN
WHERE NV.MANV=NVKN.MANV AND KN.MSKN=NVKN.MSKN AND KN.TenKN=N'Word'

--d.Liệt kê các kỹ năng (TenKN, MucDo) mà nhân viên 'Lê Anh Tuấn' biết sửa dụng
SELECT KN.TenKN,NVKN.MucDo 
FROM dbo.NhanVien AS NV,dbo.KyNang AS KN, dbo.NhanVienKyNang AS NVKN
WHERE NV.MANV=NVKN.MANV AND KN.MSKN=NVKN.MSKN AND NV.Ho+' '+NV.Ten =N'Lê Anh Tuấn'

